# BM5235 电池限充实验工具

先阅读 `BM5235_analysis.md`。这是针对提供的 MRID6 / EC 00.28.00.00 的实验原型，目标低于 60% 恢复、达到 80% 停充。停充使用 **0x10/0x0E**；**0x0C 会进入主动放电路径，不要使用**。

另已增加原生 `0x10/0x0D` 版本：`Windows/NativeEnable.cmd` 配置一次后由 EC 自行控制，无需 Windows 常驻。详见 `NATIVE_README.md`。默认要求 SOC < 上限；首次启用时，中间范围会先保持停充。原固件离线验证、原生实机配置及程序退出后模式保持均已通过；本次配置为 80／60，在 SOC 61% 进入保持，报告充／放电速率为 0。完整原生阈值循环仍待验证。原生配置已保持启用，旧 Windows 轮询版与原生版不能同时运行／接管同一模式；切回旧版前先使用 `NativeDisable.cmd`。

## 已完成实机充电验证：启动 60%／80% 控制

`charging_test.jsonl` 已通过：SOC 78%、插电充电时，`0x0E` 进入停充模式；电池接口报告充电速率从 19420 变为 0，放电速率为 0，剩余容量保持 46800。`0x0F` 恢复后充电速率变为 19440，EC 和 Windows 都恢复充电状态。速率／容量均为 Windows 原始报告值；没有外接电流表测量。这证明单次停充与恢复通路有效，尚未完成全程 80%→59% 循环及长期／睡眠测试。

在管理员 PowerShell 执行本机绝对路径，持续控制到 Ctrl+C：

```powershell
& 'C:\Users\48069\Documents\Codex\2026-10-06\ec-dsdt-ec-it5570\outputs\Windows\Control60_80.cmd'
```

每 10 秒核对 EC 和 Windows 状态：达到 80% 停充，低于 60% 恢复，60%～79% 保持上一状态。窗口需要保持运行；输出显示在窗口并追加保存到 `control.jsonl`。正常 Ctrl+C 会恢复启动时的策略；直接关闭窗口、进程崩溃或 EC 事务中断时，模式可能保留，需要先核对状态再恢复。睡眠期间程序无法轮询，不应把它视为已验证的后台服务。

`run_control.py` 启动前会核对成功的 `charging_test.jsonl`，检查失败时不加载端口驱动。新机型／更新后的固件不能复用本机日志作为已验证依据。实验运行时退出其他 EC 调节和采样工具。

若只需要 10 分钟试运行，结束后自动恢复启动策略：

```powershell
& '.\Windows\Control60_80.cmd' --duration 600
```

需要手动恢复原厂策略时，先退出控制程序，再在管理员 PowerShell 运行：

```powershell
& 'C:\Users\48069\Documents\Codex\2026-10-06\ec-dsdt-ec-it5570\outputs\Windows\ResumeNormal.cmd'
```

恢复入口只允许已分析的普通模式 `00`／停充模式 `02`，仍会检查版本、插电、电池和邮箱状态；出现未知模式或通信错误时不会盲写。

## 直接可运行：Windows 状态和模拟监视

在此文件所在的 `outputs` 目录打开 PowerShell，使用已有 Python 3：

```powershell
python .\bm5235_battery.py status
python .\bm5235_battery.py monitor --duration 60
```

不带参数也等同于 `status`。这两个功能不加载驱动、不访问 EC 端口、不修改充电。`monitor` 输出 `proposed_stop` 只是拟执行状态。实际查询已运行成功：AC=true、SOC=99、Charging=false。

离线验证不需要管理员或驱动：

```powershell
python .\verify_static.py --ec 'C:\Users\48069\Desktop\ec.bin'
```

## EC 诊断的前提

已按你提供的目录找到 WinRing0 1.3.0.18，并生成 `Windows/BM5235ECBridge.exe`。该目录中的 DLL/SYS 是从你的现有工具原样复制的，不是新下载的驱动。源代码为 `Windows/ECBridge.cs`。

**现在优先使用桥接程序。** 直接从 Python 加载旧 WinRing0 DLL 时，它可能按 Python 可执行文件目录寻找 SYS，导致错误 3（找不到驱动）。桥接 EXE 与 DLL/SYS 同目录解决了这个定位问题。代理会话仍为 `admin=false`，初始化返回错误 2；用户管理员会话已成功读取 EC，并完成下面的停充／恢复模式验证。

在**管理员 PowerShell** 中先运行独立只读诊断，不需要 Python：

```powershell
& '.\Windows\BM5235ECBridge.exe' --inspect |
    Set-Content -Encoding UTF8 -LiteralPath '.\ec_readonly.json'
```

不带 `--inspect` 则只读 Windows 电池状态、不加载驱动。程序不会自行请求 UAC 提权，也不会更改系统的驱动安全策略。若管理员会话也返回驱动错误，先保留日志。

现有 `JiaoLongPlus2.0/RyzenSmu/Smu.cs` 的 `Read_EC_EX` 实现没有从数据端口读取，而是沿写入序列提交值 0 并返回 0；请不要用该方法作为只读诊断。本交付不调用或修改该项目代码。

实验 EC 访问使用你已有、可信的 WinRing0 兼容 DLL 及其驱动，必须导出 `InitializeOls/GetDllStatus/ReadIoPortByteEx/WriteIoPortByteEx/DeinitializeOls`。Windows 桥接后端为 x64；直接 DLL 后端要求 DLL 位数与 Python 匹配。当前附带文件从你提供的目录原样复制，未下载新驱动；加载通常需要管理员权限。如果系统安全策略拒绝驱动，保留安全策略，停止这条实验访问路线。

原型直接访问 `0x62/0x66`，无法获取 Windows ACPIEC 的事务锁；可能与系统请求发生竞争。即使仅诊断，也会向命令端口发送读取命令。这里“只读”表示不写 EC RAM，不表示没有端口写操作。发生忙、已有返回数据、SCI 待处理或超时会退出，不抢读、清空队列或自动重试。

以下 `$driverDll` 必须替换为你实际可信 DLL 的绝对路径；示例路径本身不代表已有文件。

```powershell
$driverDll = 'D:\your-trusted-driver\WinRing0x64.dll'
python .\bm5235_battery.py inspect --board BM5235 --dll $driverDll --experimental-raw-io |
    Tee-Object -FilePath .\inspect_before.jsonl
```

`inspect` 不写 EC RAM。期望版本原始字节为 `[0,40,0,0]`，这里十进制 40 是十六进制 `28`。该版本检查不是整份运行固件的哈希验证，不能单靠版本字节将本工具推广到其他型号。

通过桥接程序运行 Python 版本，同样需要在可加载驱动的管理员会话中执行：

```powershell
python .\bm5235_battery.py inspect --board BM5235 --bridge '.\Windows\BM5235ECBridge.exe' --experimental-raw-io
```

下文的 `--dll $driverDll` 可全部替换为 `--bridge '.\Windows\BM5235ECBridge.exe'`。二者选其一。桥接进程继承调用者权限，使用私有标准输入／输出管道，没有公开网络监听或常驻提权服务。

## 首次实机验证顺序

已完成实机只读核对：`ec_readonly.json` 显示版本 `00.28.00.00`、SOC 99、插电、模式 `00`、邮箱空闲，电池已不充电且未报告放电。

已完成 99% 状态下的短时**模式验证**：`mode_test.jsonl` 记录 `0x0E` → 模式 `02`／状态 `31`／请求电流为零，随后 `0x0F` → 模式 `00`／状态 `10`，结束已恢复原厂策略。测试期间报告插电、未充电、未放电；初始已经不充电，因此还不能证明充电电流被切断。`Windows/TestMode.cmd` 可复测模式，当前脚本的观察期约 30 秒。

```powershell
& '.\Windows\TestMode.cmd'
```

已完成电量 78%、插电正在充电时的状态与速率变化测试。以下命令可以复测：

```powershell
& '.\Windows\TestCharging.cmd'
# 或用已有 Python 3：
python .\verify_live.py --test-stop-and-restore |
    Set-Content -Encoding UTF8 -LiteralPath '.\charging_test.jsonl'
```

默认不带测试参数只读。测试程序正常结束恢复原厂策略；传输失败后不盲写恢复，需核对状态。测试日志现在同时收集 `BatteryStatus` 原始速率、剩余容量、电压和状态；查询失败或未知速率会明确保留为未知。`battery_reported_rate_transition_pass=true` 表示同一块电池报告正充电速率 → 停充且充／放电速率为零 → 恢复正充电速率。它仍不是独立电流表测量。完整阈值循环及较长时间的供电保持需继续观察。测试前退出 RWEverything 等 EC 调节／采样工具，避免额外访问竞争。

1. 先保存诊断，核对 EC 和 Windows 的 SOC、插电状态、电池存在一致；初始 `mode` 应为 0。出现未知模式、固件版本不同或端口错误就先分析日志。
2. 选择电量约 60%～79%、插电后原厂正在正常充电的状态。当前 99%、已经未充电的状态不能验证停充的因果关系。
3. 单次启用停充，记录返回结果：

```powershell
python .\bm5235_battery.py stop --board BM5235 --dll $driverDll --experimental-raw-io --enable-write |
    Tee-Object -FilePath .\stop_result.jsonl
```

4. 等待 10～30 秒，再执行 `inspect`。预期 `mode=2`，后续 `state=49`（十六进制 `31`），`requested_current_zero=true`。这些是固件状态，不是实际电流测量。
5. 观察 Windows 不再充电，并且插电轻负载下电池没有持续放电、剩余容量基本稳定。单凭 AC=true 或 Charging=false 不足以证明仍由适配器供电。可在另一个 PowerShell 中每隔约 10 秒查询：

```powershell
Get-CimInstance -Namespace root/wmi -ClassName BatteryStatus |
    Select-Object PowerOnline,Charging,Discharging,ChargeRate,DischargeRate,RemainingCapacity,Voltage
```

若这些传感器不提供有效电流／功率值，不能把未知值当作 0。代理会话内 CIM 查询拒绝访问；用户管理员会话已成功获得上述速率和容量，记录在 `charging_test.jsonl`。

6. 恢复原厂策略：

```powershell
python .\bm5235_battery.py resume --board BM5235 --dll $driverDll --experimental-raw-io --enable-write |
    Tee-Object -FilePath .\resume_result.jsonl
```

预期 `mode=0`；在允许充电的温度、电量条件下应恢复充电。`resume` 不强迫充电器越过原厂保护。如果停充导致持续放电，应结束实验并在接口正常、模式已核对的前提下执行恢复；不要反复盲写。

## 60%／80% 控制原型

仅在上述单次停充、适配器供电、恢复均验证成功后，执行一个 5 分钟试运行：

本机已通过短时的状态／速率验证，可使用最前面的启动入口；以下是同一控制程序的完整参数形式。

```powershell
python .\bm5235_battery.py control --board BM5235 --bridge '.\Windows\BM5235ECBridge.exe' --experimental-raw-io --enable-write --verified-stop-on-ac --low 60 --high 80 --duration 300 |
    Tee-Object -FilePath .\control.jsonl
```

每 10 秒检查：SOC >= 80 停充；SOC < 60 恢复；60～79 保持上一状态。60% 本身不会触发恢复。开始时处于 60～79 的范围，会继承现有状态。该程序只恢复原厂充电策略，不强制绕过原厂保护。

默认在期限结束或 Ctrl+C 时恢复进入程序前的策略；如果开始时已经存在停充标志，程序拒绝接管，需要先明确其来源。单次 `stop` 的停充标志不会因该进程结束自动清除。

`--duration 0` 表示运行到 Ctrl+C；`--leave-stop` 表示正常退出也保留当前模式；`--take-over-stop` 用于明确接管已设置的停充标志。原型不自动安装开机任务或服务。

程序崩溃、被强行关闭或发生 EC 事务错误时，EC 标志可能保留。错误后不会自动尝试写入恢复，避免在未知事务状态下再次操作。需先核对诊断与模式，再显式恢复。睡眠期间程序无法轮询阈值；10 秒轮询及传感器刷新也会带来小幅越限，这些是软件方案的限制。

## 后续决策

固件原生 `0x0D` 模式能在 EC 内执行上下阈值，但初始化高于上限存在主动放电分支。首轮工具没有暴露该命令。获得 `inspect_before.jsonl`、`stop_result.jsonl`、停充后的诊断和实际电流观察、`resume_result.jsonl` 后，可以决定继续原生模式验证，或为 Windows 制作有 EC 并发协调的正式访问实现。
