// BM5235 research helper. Built for .NET Framework / x64. No automatic UAC.
// Default status; --inspect reads known XRAM only. --serve is an internal
// stdio bridge for bm5235_battery.py. No network or persistent service endpoint.
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Web.Script.Serialization;

static class ECBridge
{
    [DllImport("WinRing0x64.dll", CallingConvention = CallingConvention.Winapi)]
    static extern bool InitializeOls();
    [DllImport("WinRing0x64.dll", CallingConvention = CallingConvention.Winapi)]
    static extern uint GetDllStatus();
    [DllImport("WinRing0x64.dll", CallingConvention = CallingConvention.Winapi)]
    static extern void DeinitializeOls();
    [DllImport("WinRing0x64.dll", CallingConvention = CallingConvention.Winapi)]
    static extern bool ReadIoPortByteEx(ushort port, out byte value);
    [DllImport("WinRing0x64.dll", CallingConvention = CallingConvention.Winapi)]
    static extern bool WriteIoPortByteEx(ushort port, byte value);
    [DllImport("shell32.dll")] static extern bool IsUserAnAdmin();
    [StructLayout(LayoutKind.Sequential)]
    struct PowerStatus
    {
        public byte AC, Flags, SOC, Saver;
        public uint Life, FullLife;
    }
    [DllImport("kernel32.dll", SetLastError = true)]
    static extern bool GetSystemPowerStatus(out PowerStatus status);

    static readonly ushort[] KnownAddresses = {
        0x8150, 0x8151, 0x8152, 0x8370, 0x837C, 0x837D, 0x8394, 0x8395,
        0x83A0, 0x83A1, 0x83A2, 0x83C0, 0x8410, 0x8411, 0x8412, 0x8413,
        0x8460, 0x847C
    };
    static bool initialized;
    static bool poisoned;

    static Dictionary<string, object> WindowsStatus()
    {
        PowerStatus s;
        if (!GetSystemPowerStatus(out s)) throw new InvalidOperationException("Windows power status failed");
        return new Dictionary<string, object> {
            {"ac", s.AC == 255 ? null : (object)(s.AC == 1)},
            {"soc", s.SOC > 100 ? null : (object)s.SOC},
            {"battery_present", s.Flags == 255 ? null : (object)((s.Flags & 128) == 0)},
            {"charging", s.Flags == 255 ? null : (object)((s.Flags & 8) != 0)}
        };
    }

    static void Json(Dictionary<string, object> value)
    {
        value["time"] = DateTimeOffset.Now.ToString("o");
        Console.WriteLine(new JavaScriptSerializer().Serialize(value));
    }

    static void Init()
    {
        string folder = AppDomain.CurrentDomain.BaseDirectory;
        if (!File.Exists(Path.Combine(folder, "WinRing0x64.sys")) ||
            !File.Exists(Path.Combine(folder, "WinRing0x64.dll")))
            throw new InvalidOperationException("Place the user-provided DLL and SYS beside this EXE");
        initialized = InitializeOls();
        uint status = GetDllStatus();
        if (!initialized || status != 0)
            throw new InvalidOperationException("WinRing0 DLL status=" + status +
                "; admin=" + IsUserAnAdmin() + "; EXE folder=" + folder +
                ". Status 2 means driver not loaded, 3 means driver file not found.");
    }

    static byte In(ushort port)
    {
        byte result;
        if (port != 0x62 && port != 0x66) throw new ArgumentException("Port outside profile");
        if (!ReadIoPortByteEx(port, out result)) throw new InvalidOperationException("I/O read failed");
        return result;
    }

    static void Out(ushort port, byte value)
    {
        if (port != 0x62 && port != 0x66) throw new ArgumentException("Port outside profile");
        if (!WriteIoPortByteEx(port, value)) throw new InvalidOperationException("I/O write failed");
    }

    static void Wait(byte mask, byte expected)
    {
        Stopwatch timer = Stopwatch.StartNew();
        do {
            byte s = In(0x66);
            if (s == 255) throw new InvalidOperationException("EC status is FF");
            if ((s & mask) == expected) return;
            Thread.Sleep(1);
        } while (timer.ElapsedMilliseconds < 250);
        throw new TimeoutException("EC transaction timeout; no flush/retry attempted");
    }

    static byte ReadXram(ushort address)
    {
        if (poisoned) throw new InvalidOperationException("EC transaction object is poisoned");
        try {
            byte s = In(0x66);
            if (s == 255 || (s & 0x23) != 0)
                throw new InvalidOperationException("EC busy/SCI/output pending: " + s.ToString("X2"));
            Out(0x66, 0x92); // READ command; never 0x93 in inspection mode
            Wait(2, 0); Out(0x62, (byte)(address >> 8));
            Wait(2, 0); Out(0x62, (byte)address);
            Wait(2, 0); Wait(1, 1);
            return In(0x62);
        } catch { poisoned = true; throw; }
    }

    static void Inspect()
    {
        var values = new Dictionary<ushort, byte>();
        var raw = new Dictionary<string, object>();
        foreach (ushort address in KnownAddresses) {
            byte value = ReadXram(address);
            values[address] = value;
            raw[address.ToString("X4")] = value.ToString("X2");
        }
        byte flags = values[0x8460];
        var ec = new Dictionary<string, object> {
            {"version", new int[] {values[0x8410],values[0x8411],values[0x8412],values[0x8413]}},
            {"soc",values[0x847C]}, {"ac",(flags & 1) != 0},
            {"battery_present",(flags & 2) != 0}, {"charging",(flags & 4) != 0},
            {"discharging",(flags & 8) != 0}, {"mode",values[0x83C0]},
            {"state",values[0x8370]}, {"mailbox_command",values[0x8150]},
            {"mailbox_result",values[0x8152]},
            {"requested_current_zero",values[0x837C] == 0 && values[0x837D] == 0}, {"raw",raw}
        };
        Json(new Dictionary<string, object> {
            {"operation","inspect"}, {"writes_ec_ram",false},
            {"admin",IsUserAnAdmin()}, {"windows",WindowsStatus()}, {"ec",ec}
        });
    }

    static void Serve(bool allowWrites)
    {
        Console.WriteLine("READY");
        string line;
        while ((line = Console.ReadLine()) != null) {
            if (line == "QUIT") { Console.WriteLine("BYE"); return; }
            string[] fields = line.Split(' ');
            if (fields.Length == 2 && fields[0] == "R") {
                ushort port = ushort.Parse(fields[1], NumberStyles.HexNumber);
                Console.WriteLine("V " + In(port).ToString("X2"));
            } else if (fields.Length == 3 && fields[0] == "W") {
                ushort port = ushort.Parse(fields[1], NumberStyles.HexNumber);
                byte value = byte.Parse(fields[2], NumberStyles.HexNumber);
                if (port == 0x66 && value != 0x92 && !(value == 0x93 && allowWrites))
                    throw new InvalidOperationException("Only analyzed EC commands are allowed");
                Out(port, value); Console.WriteLine("OK");
            } else throw new ArgumentException("Invalid stdio command");
        }
    }

    static int Main(string[] args)
    {
        Console.OutputEncoding = new UTF8Encoding(false);
        bool serve = Array.IndexOf(args, "--serve") >= 0;
        bool inspect = Array.IndexOf(args, "--inspect") >= 0;
        try {
            if (!serve && !inspect) {
                Json(new Dictionary<string, object> {{"operation","status"},{"writes_ec_ram",false},
                    {"admin",IsUserAnAdmin()},{"windows",WindowsStatus()}});
                return 0;
            }
            if (serve && Array.IndexOf(args, "--experimental-raw-io") < 0)
                throw new ArgumentException("Internal bridge requires --experimental-raw-io");
            if (serve) {
                Init(); Serve(Array.IndexOf(args,"--allow-ec-write") >= 0);
            } else {
                bool created;
                using (var mutex = new Mutex(true, @"Global\BM5235BatteryPrototype", out created)) {
                    if (!created) throw new InvalidOperationException("Another prototype process exists");
                    try { Init(); Inspect(); } finally { mutex.ReleaseMutex(); }
                }
            }
            return 0;
        } catch (Exception error) {
            if (serve) Console.WriteLine("ERR " + error.Message.Replace('\n',' ').Replace('\r',' '));
            else Json(new Dictionary<string, object> {{"error",error.Message},{"admin",IsUserAnAdmin()},
                {"automatic_retry",false},{"ec_ram_write_submitted",false}});
            return 1;
        } finally { if (initialized) DeinitializeOls(); }
    }
}
