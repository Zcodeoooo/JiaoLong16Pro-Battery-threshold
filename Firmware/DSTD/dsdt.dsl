/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.dat, Wed Oct  7 11:42:27 2026
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00008468 (33896)
 *     Revision         0x02
 *     Checksum         0x70
 *     OEM ID           "INSYDE"
 *     OEM Table ID     "EDK2    "
 *     OEM Revision     0x00000002 (2)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "DSDT", 2, "INSYDE", "EDK2    ", 0x00000002)
{
    External (_GPE, DeviceObj)
    External (_SB_.ADP1.ACDC, IntObj)
    External (_SB_.ALIB, MethodObj)    // 2 Arguments
    External (_SB_.APTS, MethodObj)    // 1 Arguments
    External (_SB_.AWAK, MethodObj)    // 1 Arguments
    External (_SB_.HDWB, DeviceObj)
    External (_SB_.NPCF, DeviceObj)
    External (_SB_.PCI0.GFX0.VGA_.LCD_, DeviceObj)
    External (_SB_.PCI0.GP17.EDID, UnknownObj)
    External (_SB_.PCI0.GP17.PANT, IntObj)
    External (_SB_.PCI0.GP17.VGA_.AFN4, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.GP17.VGA_.AFN7, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.GPP0.LNKD, FieldUnitObj)
    External (_SB_.PCI0.GPP0.PEGP, DeviceObj)
    External (_SB_.PCI0.P80H, FieldUnitObj)
    External (_SB_.PCI0.VGA_.LCD_, DeviceObj)
    External (_SB_.PCI0.WMID, DeviceObj)
    External (_SB_.PCI0.WMID.EVBU, BuffObj)
    External (_SB_.U4PC, IntObj)
    External (AFN7, MethodObj)    // 1 Arguments
    External (EDID, IntObj)
    External (M000, MethodObj)    // 1 Arguments
    External (M017, MethodObj)    // 6 Arguments
    External (M019, MethodObj)    // 4 Arguments
    External (M020, MethodObj)    // 5 Arguments
    External (M037, DeviceObj)
    External (M046, IntObj)
    External (M049, MethodObj)    // 2 Arguments
    External (M050, DeviceObj)
    External (M051, DeviceObj)
    External (M052, DeviceObj)
    External (M053, DeviceObj)
    External (M054, DeviceObj)
    External (M055, DeviceObj)
    External (M056, DeviceObj)
    External (M057, DeviceObj)
    External (M058, DeviceObj)
    External (M059, DeviceObj)
    External (M062, DeviceObj)
    External (M068, DeviceObj)
    External (M069, DeviceObj)
    External (M070, DeviceObj)
    External (M071, DeviceObj)
    External (M072, DeviceObj)
    External (M074, DeviceObj)
    External (M075, DeviceObj)
    External (M076, DeviceObj)
    External (M077, DeviceObj)
    External (M078, DeviceObj)
    External (M079, DeviceObj)
    External (M080, DeviceObj)
    External (M081, DeviceObj)
    External (M082, FieldUnitObj)
    External (M083, FieldUnitObj)
    External (M084, FieldUnitObj)
    External (M085, FieldUnitObj)
    External (M086, FieldUnitObj)
    External (M087, FieldUnitObj)
    External (M088, FieldUnitObj)
    External (M089, FieldUnitObj)
    External (M090, FieldUnitObj)
    External (M091, FieldUnitObj)
    External (M092, FieldUnitObj)
    External (M093, FieldUnitObj)
    External (M094, FieldUnitObj)
    External (M095, FieldUnitObj)
    External (M096, FieldUnitObj)
    External (M097, FieldUnitObj)
    External (M098, FieldUnitObj)
    External (M099, FieldUnitObj)
    External (M100, FieldUnitObj)
    External (M101, FieldUnitObj)
    External (M102, FieldUnitObj)
    External (M103, FieldUnitObj)
    External (M104, FieldUnitObj)
    External (M105, FieldUnitObj)
    External (M106, FieldUnitObj)
    External (M107, FieldUnitObj)
    External (M108, FieldUnitObj)
    External (M109, FieldUnitObj)
    External (M110, FieldUnitObj)
    External (M115, BuffObj)
    External (M116, BuffFieldObj)
    External (M117, BuffFieldObj)
    External (M118, BuffFieldObj)
    External (M119, BuffFieldObj)
    External (M120, BuffFieldObj)
    External (M122, FieldUnitObj)
    External (M127, DeviceObj)
    External (M128, FieldUnitObj)
    External (M131, FieldUnitObj)
    External (M132, FieldUnitObj)
    External (M133, FieldUnitObj)
    External (M134, FieldUnitObj)
    External (M135, FieldUnitObj)
    External (M136, FieldUnitObj)
    External (M220, FieldUnitObj)
    External (M221, FieldUnitObj)
    External (M226, FieldUnitObj)
    External (M227, DeviceObj)
    External (M229, FieldUnitObj)
    External (M231, FieldUnitObj)
    External (M233, FieldUnitObj)
    External (M235, FieldUnitObj)
    External (M23A, FieldUnitObj)
    External (M249, MethodObj)    // 4 Arguments
    External (M250, MethodObj)    // 5 Arguments
    External (M251, FieldUnitObj)
    External (M280, FieldUnitObj)
    External (M290, FieldUnitObj)
    External (M29A, FieldUnitObj)
    External (M310, FieldUnitObj)
    External (M31C, FieldUnitObj)
    External (M320, FieldUnitObj)
    External (M321, FieldUnitObj)
    External (M322, FieldUnitObj)
    External (M323, FieldUnitObj)
    External (M324, FieldUnitObj)
    External (M325, FieldUnitObj)
    External (M326, FieldUnitObj)
    External (M327, FieldUnitObj)
    External (M328, FieldUnitObj)
    External (M329, DeviceObj)
    External (M32A, DeviceObj)
    External (M32B, DeviceObj)
    External (M330, DeviceObj)
    External (M331, FieldUnitObj)
    External (M378, FieldUnitObj)
    External (M379, FieldUnitObj)
    External (M380, FieldUnitObj)
    External (M381, FieldUnitObj)
    External (M382, FieldUnitObj)
    External (M383, FieldUnitObj)
    External (M384, FieldUnitObj)
    External (M385, FieldUnitObj)
    External (M386, FieldUnitObj)
    External (M387, FieldUnitObj)
    External (M388, FieldUnitObj)
    External (M389, FieldUnitObj)
    External (M390, FieldUnitObj)
    External (M391, FieldUnitObj)
    External (M392, FieldUnitObj)
    External (M404, BuffObj)
    External (M408, MutexObj)
    External (M414, FieldUnitObj)
    External (M444, FieldUnitObj)
    External (M449, FieldUnitObj)
    External (M453, FieldUnitObj)
    External (M454, FieldUnitObj)
    External (M455, FieldUnitObj)
    External (M456, FieldUnitObj)
    External (M457, FieldUnitObj)
    External (M460, MethodObj)    // 7 Arguments
    External (M4C0, FieldUnitObj)
    External (M4F0, FieldUnitObj)
    External (M610, FieldUnitObj)
    External (M620, FieldUnitObj)
    External (M631, FieldUnitObj)
    External (MPTS, MethodObj)    // 1 Arguments
    External (MWAK, MethodObj)    // 1 Arguments

    Scope (\_SB)
    {
        Device (PLTF)
        {
            Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A05") /* Generic Container Device */)  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Device (C000)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, Zero)
                Name (THRD, Zero)
            }

            Device (C001)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, Zero)
                Name (THRD, One)
            }

            Device (C002)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, One)
                Name (THRD, Zero)
            }

            Device (C003)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, One)
                Name (THRD, One)
            }

            Device (C004)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x02)
                Name (THRD, Zero)
            }

            Device (C005)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x02)
                Name (THRD, One)
            }

            Device (C006)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x03)
                Name (THRD, Zero)
            }

            Device (C007)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x03)
                Name (THRD, One)
            }

            Device (C008)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x04)
                Name (THRD, Zero)
            }

            Device (C009)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x09)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x04)
                Name (THRD, One)
            }

            Device (C00A)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x05)
                Name (THRD, Zero)
            }

            Device (C00B)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0B)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x05)
                Name (THRD, One)
            }

            Device (C00C)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0C)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x06)
                Name (THRD, Zero)
            }

            Device (C00D)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0D)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x06)
                Name (THRD, One)
            }

            Device (C00E)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0E)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x07)
                Name (THRD, Zero)
            }

            Device (C00F)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0F)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x07)
                Name (THRD, One)
            }

            Device (C010)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x10)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x08)
                Name (THRD, Zero)
            }

            Device (C011)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x11)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x08)
                Name (THRD, One)
            }

            Device (C012)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x12)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x09)
                Name (THRD, Zero)
            }

            Device (C013)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x13)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x09)
                Name (THRD, One)
            }

            Device (C014)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x14)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0A)
                Name (THRD, Zero)
            }

            Device (C015)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x15)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0A)
                Name (THRD, One)
            }

            Device (C016)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x16)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0B)
                Name (THRD, Zero)
            }

            Device (C017)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x17)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0B)
                Name (THRD, One)
            }

            Device (C018)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x18)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0C)
                Name (THRD, Zero)
            }

            Device (C019)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x19)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0C)
                Name (THRD, One)
            }

            Device (C01A)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1A)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0D)
                Name (THRD, Zero)
            }

            Device (C01B)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1B)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0D)
                Name (THRD, One)
            }

            Device (C01C)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1C)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0E)
                Name (THRD, Zero)
            }

            Device (C01D)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1D)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0E)
                Name (THRD, One)
            }

            Device (C01E)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1E)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0F)
                Name (THRD, Zero)
            }

            Device (C01F)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x1F)  // _UID: Unique ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (PACK, Zero)
                Name (DIE, Zero)
                Name (CCD, Zero)
                Name (CCX, Zero)
                Name (CORE, 0x0F)
                Name (THRD, One)
            }
        }
    }

    OperationRegion (DBG0, SystemIO, 0x80, One)
    Field (DBG0, ByteAcc, NoLock, Preserve)
    {
        IO80,   8
    }

    OperationRegion (DBG1, SystemIO, 0x80, 0x04)
    Field (DBG1, DWordAcc, NoLock, Preserve)
    {
        P80H,   32
    }

    OperationRegion (ACMS, SystemIO, 0x72, 0x02)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ACMX,   8, 
        ACMA,   8
    }

    IndexField (ACMX, ACMA, ByteAcc, NoLock, Preserve)
    {
        Offset (0xB9), 
        IMEN,   8
    }

    OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
    Field (PSMI, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (PMRG, SystemIO, 0x0CD6, 0x02)
    Field (PMRG, ByteAcc, NoLock, Preserve)
    {
        PMRI,   8, 
        PMRD,   8
    }

    IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
    {
            ,   6, 
        HPEN,   1, 
        Offset (0x60), 
        P1EB,   16, 
        Offset (0xF0), 
            ,   3, 
        RSTU,   1
    }

    OperationRegion (GSMG, SystemMemory, 0xFED81500, 0x03FF)
    Field (GSMG, AnyAcc, NoLock, Preserve)
    {
        Offset (0x5C), 
        Offset (0x5E), 
        GS23,   1, 
            ,   5, 
        GV23,   1, 
        GE23,   1, 
        Offset (0xA0), 
        Offset (0xA2), 
        GS40,   1, 
            ,   5, 
        GV40,   1, 
        GE40,   1
    }

    OperationRegion (GSMM, SystemMemory, 0xFED80000, 0x1000)
    Field (GSMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x288), 
            ,   1, 
        CLPS,   1, 
        Offset (0x2B0), 
            ,   2, 
        SLPS,   2, 
        Offset (0x3BB), 
            ,   6, 
        PWDE,   1
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    OperationRegion (IOCC, SystemIO, 0x0400, 0x80)
    Field (IOCC, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
            ,   2, 
        RTCS,   1
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        PRWP [Zero] = Arg0
        PRWP [One] = Arg1
        If ((CNSB == Zero))
        {
            If ((Arg1 <= 0x03))
            {
                PRWP [One] = Zero
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Method (SPTS, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            RSTU = Zero
        }

        CLPS = One
        SLPS = One
        PEWS = PEWS /* \PEWS */
    }

    Method (SWAK, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            RSTU = One
        }

        PEWS = PEWS /* \PEWS */
        PEWD = Zero
        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }
    }

    Method (TPST, 1, Serialized)
    {
        M000 (Arg0)
    }

    Name (PICM, Zero)
    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        PICM = Arg0
        GPIC = Arg0
        M460 ("PLA-ASL-\\_PIC Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
        If (PICM)
        {
            \_SB.DSPI ()
            \_SB.PCI0.NAPE ()
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x03, 
        0x03, 
        Zero, 
        Zero
    })
    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x04, 
        0x04, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    OperationRegion (GNVS, SystemMemory, 0xCAF3DA98, 0x00000195)
    Field (GNVS, AnyAcc, NoLock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        TLST,   8, 
        IGDS,   8, 
        LCDA,   16, 
        CSTE,   16, 
        NSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        ADDL,   16, 
        BCMD,   8, 
        SBFN,   8, 
        DID,    32, 
        INFO,   2048, 
        TOML,   8, 
        TOMH,   8, 
        CEBP,   8, 
        C0LS,   8, 
        C1LS,   8, 
        C0HS,   8, 
        C1HS,   8, 
        ROMS,   32, 
        MUXF,   8, 
        PDDN,   8, 
        CNSB,   8, 
        RDHW,   8, 
        DAS3,   8, 
        TNBH,   8, 
        TCP0,   8, 
        TCP1,   8, 
        ATNB,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PWMN,   8, 
        LPTY,   8, 
        M92D,   8, 
        WKPM,   8, 
        ALST,   8, 
        AFUC,   8, 
        GV0E,   8, 
        WLSH,   8, 
        TSSS,   8, 
        AOZP,   8, 
        TZFG,   8, 
        BPS0,   8, 
        NAPC,   8, 
        PCBA,   32, 
        PCBL,   32, 
        WLAN,   8, 
        BLTH,   8, 
        GPSS,   8, 
        NFCS,   8, 
        SBTY,   8, 
        BDID,   16, 
        MWTT,   8, 
        ACPM,   8, 
        KBCS,   8, 
        ACEC,   8, 
        DPTC,   8, 
        ECTL,   8, 
        MM64,   8, 
        HMB1,   64, 
        HMB2,   64, 
        HMM1,   64, 
        HMM2,   64, 
        HML1,   64, 
        HML2,   64, 
        WOVS,   8, 
        TCNT,   8, 
        TOPM,   32, 
        MB32,   32, 
        ML32,   32
    }

    OperationRegion (OGNS, SystemMemory, 0xCAF3DD18, 0x00000011)
    Field (OGNS, AnyAcc, Lock, Preserve)
    {
        OG00,   8, 
        OG01,   8, 
        M2WL,   8, 
        THPN,   8, 
        PBAR,   8, 
        THPD,   8, 
        DTEN,   8, 
        SDMO,   8, 
        TBEN,   8, 
        TBNH,   8, 
        RV2I,   8, 
        ISDS,   8, 
        PSEL,   8
    }

    OperationRegion (BLDN, SystemMemory, 0xC2F7DB18, 0x030F)
    Field (BLDN, AnyAcc, Lock, Preserve)
    {
        DGDS,   8, 
        UMAO,   8, 
        GPUT,   8, 
        TPID,   8, 
        TPFW,   32, 
        PANT,   8, 
        H264,   8, 
        EDSZ,   32, 
        EDID,   3072, 
        EDUD,   2048, 
        EDOR,   1024, 
        DGMD,   8
    }

    Name (WNOS, Zero)
    Name (MYOS, Zero)
    Name (HTTS, Zero)
    Name (OSTB, Ones)
    Name (TPOS, Zero)
    Name (LINX, Zero)
    Name (OSSP, Zero)
    Method (SEQL, 2, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Local1 = SizeOf (Arg1)
        If ((Local0 != Local1))
        {
            Return (Zero)
        }

        Name (BUF0, Buffer (Local0){})
        BUF0 = Arg0
        Name (BUF1, Buffer (Local1){})
        BUF1 = Arg1
        Local2 = Zero
        While ((Local2 < Local0))
        {
            Local3 = DerefOf (BUF0 [Local2])
            Local4 = DerefOf (BUF1 [Local2])
            If ((Local3 != Local4))
            {
                Return (Zero)
            }

            Local2++
        }

        Return (One)
    }

    Method (OSTP, 0, NotSerialized)
    {
        If ((OSTB == Ones))
        {
            If (CondRefOf (\_OSI, Local0))
            {
                OSTB = Zero
                TPOS = Zero
                If (_OSI ("Windows 2001"))
                {
                    OSTB = 0x08
                    TPOS = 0x08
                }

                If (_OSI ("Windows 2001.1"))
                {
                    OSTB = 0x20
                    TPOS = 0x20
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    OSTB = 0x10
                    TPOS = 0x10
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    OSTB = 0x11
                    TPOS = 0x11
                }

                If (_OSI ("Windows 2001 SP3"))
                {
                    OSTB = 0x12
                    TPOS = 0x12
                }

                If (_OSI ("Windows 2006"))
                {
                    OSTB = 0x40
                    TPOS = 0x40
                }

                If (_OSI ("Windows 2006 SP1"))
                {
                    OSTB = 0x41
                    TPOS = 0x41
                    OSSP = One
                }

                If (_OSI ("Windows 2009"))
                {
                    OSTB = 0x50
                    TPOS = 0x50
                    OSSP = One
                }

                If (_OSI ("Windows 2012"))
                {
                    OSTB = 0x60
                    TPOS = 0x60
                    OSSP = One
                }

                If (_OSI ("Windows 2013"))
                {
                    OSTB = 0x61
                    TPOS = 0x61
                    OSSP = One
                }

                If (_OSI ("Windows 2015"))
                {
                    OSTB = 0x70
                    TPOS = 0x70
                    OSSP = One
                }
            }
            ElseIf (CondRefOf (\_OS, Local0))
            {
                If (SEQL (_OS, "Microsoft Windows"))
                {
                    OSTB = One
                    TPOS = One
                }
                ElseIf (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                {
                    OSTB = 0x02
                    TPOS = 0x02
                }
                ElseIf (SEQL (_OS, "Microsoft Windows NT"))
                {
                    OSTB = 0x04
                    TPOS = 0x04
                }
                Else
                {
                    OSTB = Zero
                    TPOS = Zero
                }
            }
            Else
            {
                OSTB = Zero
                TPOS = Zero
            }
        }

        Return (OSTB) /* \OSTB */
    }

    Name (BUFN, Zero)
    Name (MBUF, Buffer (0x1000){})
    OperationRegion (MDBG, SystemMemory, 0xCAE31018, 0x00001004)
    Field (MDBG, AnyAcc, Lock, Preserve)
    {
        MDG0,   32768
    }

    Method (DB2H, 1, Serialized)
    {
        SHOW (Arg0)
        MDGC (0x20)
        MDG0 = MBUF /* \MBUF */
    }

    Method (DW2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x08)
        Local0 &= 0xFF
        Local1 &= 0xFF
        DB2H (Local1)
        BUFN--
        DB2H (Local0)
    }

    Method (DD2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x10)
        Local0 &= 0xFFFF
        Local1 &= 0xFFFF
        DW2H (Local1)
        BUFN--
        DW2H (Local0)
    }

    Method (MBGS, 1, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Name (BUFS, Buffer (Local0){})
        BUFS = Arg0
        MDGC (0x20)
        While (Local0)
        {
            MDGC (DerefOf (BUFS [(SizeOf (Arg0) - Local0)]))
            Local0--
        }

        MDG0 = MBUF /* \MBUF */
    }

    Method (SHOW, 1, Serialized)
    {
        MDGC (NTOC ((Arg0 >> 0x04)))
        MDGC (NTOC (Arg0))
    }

    Method (LINE, 0, Serialized)
    {
        Local0 = BUFN /* \BUFN */
        Local0 &= 0x0F
        While (Local0)
        {
            MDGC (Zero)
            Local0++
            Local0 &= 0x0F
        }
    }

    Method (MDGC, 1, Serialized)
    {
        MBUF [BUFN] = Arg0
        BUFN += One
        If ((BUFN > 0x0FFF))
        {
            BUFN &= 0x0FFF
            UP_L (One)
        }
    }

    Method (UP_L, 1, Serialized)
    {
        Local2 = Arg0
        Local2 <<= 0x04
        MOVE (Local2)
        Local3 = (0x1000 - Local2)
        While (Local2)
        {
            MBUF [Local3] = Zero
            Local3++
            Local2--
        }
    }

    Method (MOVE, 1, Serialized)
    {
        Local4 = Arg0
        BUFN = Zero
        Local5 = (0x1000 - Local4)
        While (Local5)
        {
            Local5--
            MBUF [BUFN] = DerefOf (MBUF [Local4])
            BUFN++
            Local4++
        }
    }

    Method (NTOC, 1, Serialized)
    {
        Local0 = (Arg0 & 0x0F)
        If ((Local0 < 0x0A))
        {
            Local0 += 0x30
        }
        Else
        {
            Local0 += 0x37
        }

        Return (Local0)
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        SPTS (Arg0)
        If ((Arg0 == One))
        {
            \_SB.S80H (0x51)
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0x53)
            SLPS = One
            Local1 = 0x40
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0x54)
            SLPS = One
            RSTU = One
            Local1 = 0x80
        }

        If ((Arg0 == 0x05))
        {
            \_SB.S80H (0x55)
            If ((WKPM == One))
            {
                PWDE = One
            }

            BCMD = 0x90
            \_SB.BSMI (Zero)
            \_SB.GSMI (0x03)
            Local1 = 0xC0
        }

        \_SB.APTS (Arg0)
        MPTS (Arg0)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        Local0 = (\_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.AWHG)) << 0x08)
        Local0 += \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.AWLW))
        Local1 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.ECWR))
        If (((Local0 > 0xC8) && (Local1 & One))){}
        ElseIf ((\_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CMEN)) == One))
        {
            \_SB.PCI0.LPC0.H_EC.ECWT (Zero, RefOf (\_SB.PCI0.LPC0.H_EC.CMEN))
        }

        Local0 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.ITSM))
        \_SB.PCI0.LPC0.H_EC.FNQS (Local0)
        \_SB.PCI0.LPC0.H_EC.COMM ()
        SWAK (Arg0)
        \_SB.AWAK (Arg0)
        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0xE3)
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0xE4)
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        \_SB.ADP1.ACDC = 0xFF
        Notify (\_SB.ADP1, 0x80) // Status Change
        MWAK (Arg0)
        Return (Zero)
    }

    Scope (_GPE)
    {
        Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            M460 ("PLA-ASL-\\_GPE._L04\n", Zero, Zero, Zero, Zero, Zero, Zero)
            TPST (0x3904)
            Notify (\_SB.PCI0.GPP0.PEGP, 0x81) // Information Change
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            M460 ("PLA-ASL-\\_GPE._L0D\n", Zero, Zero, Zero, Zero, Zero, Zero)
            TPST (0x390D)
            Notify (\_SB.PCI0.GPP3, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L15, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            M460 ("PLA-ASL-\\_GPE._L15\n", Zero, Zero, Zero, Zero, Zero, Zero)
            TPST (0x3915)
            Notify (\_SB.PWRB, 0x80) // Status Change
        }

        Method (_L16, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            M460 ("PLA-ASL-\\_GPE._L16\n", Zero, Zero, Zero, Zero, Zero, Zero)
            TPST (0x3919)
            Notify (\_SB.PCI0.GPP5, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L19, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            M460 ("PLA-ASL-\\_GPE._L19\n", Zero, Zero, Zero, Zero, Zero, Zero)
            TPST (0x3919)
            Notify (\_SB.PCI0.GP17, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP17.XHC0, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP17.XHC1, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L1A, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            M460 ("PLA-ASL-\\_GPE._L1A\n", Zero, Zero, Zero, Zero, Zero, Zero)
            TPST (0x391A)
            Notify (\_SB.PCI0.GP19, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP19.XHC2, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (AMDM)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0xF0000000,         // Address Base
                    0x08000000,         // Address Length
                    )
            })
        }

        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x0C), 
            SIRA,   8, 
            SIRB,   8, 
            SIRC,   8, 
            SIRD,   8, 
            PIRS,   8, 
            Offset (0x17), 
            SDCL,   8, 
            Offset (0x1A), 
            SDIO,   8, 
            Offset (0x41), 
            SATA,   8, 
            Offset (0x62), 
            GIOC,   8, 
            Offset (0x70), 
            I2C0,   8, 
            I2C1,   8, 
            I2C2,   8, 
            I2C3,   8
        }

        OperationRegion (KBDD, SystemIO, 0x64, One)
        Field (KBDD, ByteAcc, NoLock, Preserve)
        {
            PD64,   8
        }

        Method (DSPI, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            Local1 = PD64 /* \_SB_.PD64 */
            PIRE = 0x1F
            PIRF = 0x1F
            PIRG = 0x1F
            PIRH = 0x1F
        }

        Method (INTA, 1, NotSerialized)
        {
            PIRA = Arg0
        }

        Method (INTB, 1, NotSerialized)
        {
            PIRB = Arg0
        }

        Method (INTC, 1, NotSerialized)
        {
            PIRC = Arg0
        }

        Method (INTD, 1, NotSerialized)
        {
            PIRD = Arg0
            If (PICM)
            {
                SATA = Arg0
            }
        }

        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {4,5,7,10,11,14,15}
        })
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRA && (PIRA != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKA._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKA._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKA._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKA._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKA._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRA) /* \_SB_.PIRA */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKA._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRA = Local0
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRB && (PIRB != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKB._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKB._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKB._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKB._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKB._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRB) /* \_SB_.PIRB */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKB._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRB = Local0
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRC && (PIRC != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKC._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKC._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKC._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKC._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKC._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRC) /* \_SB_.PIRC */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKC._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRC = Local0
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRD && (PIRD != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKD._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKD._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKD._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKD._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKD._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRD) /* \_SB_.PIRD */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKD._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRD = Local0
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRE && (PIRE != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKE._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKE._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKE._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKE._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                PIRE = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKE._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRE) /* \_SB_.PIRE */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKE._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRF && (PIRF != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKF._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKF._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKF._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKF._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                PIRF = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKF._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRF) /* \_SB_.PIRF */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKF._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRG && (PIRG != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKG._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKG._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKG._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKG._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                PIRG = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKG._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRG) /* \_SB_.PIRG */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKG._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRH && (PIRH != 0x1F)))
                {
                    M460 ("PLA-ASL-\\_SB.LNKH._STA = 0xB\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x0B)
                }
                Else
                {
                    M460 ("PLA-ASL-\\_SB.LNKH._STA = 0x9\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKH._PRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                M460 ("PLA-ASL-\\_SB.LNKH._DIS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                PIRH = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKH._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRH) /* \_SB_.PIRH */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                M460 ("PLA-ASL-\\_SB.LNKH._SRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (NBRI, Zero)
            Name (NBAR, Zero)
            Name (NCMD, Zero)
            Name (PXDC, Zero)
            Name (PXLC, Zero)
            Name (PXD2, Zero)
            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0xFFFFFFFE
                    }

                    CTRL &= 0xFFFFFFF5
                    If (~(CDW1 & One))
                    {
                        If ((CTRL & One)){}
                        If ((CTRL & 0x04)){}
                        If ((CTRL & 0x10)){}
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (PXCR, 3, Serialized)
            {
                M460 ("PLA-ASL-_SB.PCI0.GPPX.PXCR\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Local0 = Zero
                Local1 = M017 (Arg0, Arg1, Arg2, 0x34, Zero, 0x08)
                While ((Local1 != Zero))
                {
                    Local2 = M017 (Arg0, Arg1, Arg2, Local1, Zero, 0x08)
                    If (((Local2 == Zero) || (Local2 == 0xFF)))
                    {
                        Break
                    }

                    If ((Local2 == 0x10))
                    {
                        Local0 = Local1
                        Break
                    }

                    Local1 = M017 (Arg0, Arg1, Arg2, (Local1 + One), Zero, 0x08)
                }

                Return (Local0)
            }

            Method (SPCF, 1, NotSerialized)
            {
                M460 ("PLA-ASL-_SB.PCI0.GPPX.SPCF\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Local0 = M019 (Zero, (Arg0 >> 0x10), (Arg0 & 0xFF), 
                    0x18)
                NBRI = ((Local0 & 0xFF00) >> 0x08)
                NCMD = M019 (NBRI, Zero, Zero, 0x04)
                NBAR = M019 (NBRI, Zero, Zero, 0x10)
                Local1 = PXCR (NBRI, Zero, Zero)
                PXDC = M019 (NBRI, Zero, Zero, (Local1 + 0x08))
                PXLC = M019 (NBRI, Zero, Zero, (Local1 + 0x10))
                PXD2 = M019 (NBRI, Zero, Zero, (Local1 + 0x28))
            }

            Method (RPCF, 0, NotSerialized)
            {
                M460 ("PLA-ASL-_SB.PCI0.GPPX.RPCF\n", Zero, Zero, Zero, Zero, Zero, Zero)
                Local1 = PXCR (NBRI, Zero, Zero)
                M020 (NBRI, Zero, Zero, (Local1 + 0x08), PXDC)
                M020 (NBRI, Zero, Zero, (Local1 + 0x10), (PXLC & 0xFFFFFEFC))
                M020 (NBRI, Zero, Zero, (Local1 + 0x28), PXD2)
                M020 (NBRI, Zero, Zero, 0x10, NBAR)
                M020 (NBRI, Zero, Zero, 0x04, 0x06)
            }

            Method (UPWD, 0, NotSerialized)
            {
                M460 ("PLA-ASL-_SB.PCI0.UPWD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
                Field (PSMI, ByteAcc, NoLock, Preserve)
                {
                    SMIC,   8, 
                    SMID,   8
                }

                SMIC = 0xE3
            }

            Name (CRES, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, _Y04)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xF7FFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x78000000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFC000000,         // Range Minimum
                    0xFEAFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x02B00000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED45000,         // Range Minimum
                    0xFED814FF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0003C500,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED81900,         // Range Minimum
                    0xFED81FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000700,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFEDC0000,         // Range Minimum
                    0xFEDC0FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFEDC6000,         // Range Minimum
                    0xFEDC6FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CFF,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (CRES, \_SB.PCI0._Y00._MIN, BTMN)  // _MIN: Minimum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._MAX, BTMX)  // _MAX: Maximum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._LEN, BTLN)  // _LEN: Length
                CreateDWordField (CRES, \_SB.PCI0._Y01._MIN, BTN1)  // _MIN: Minimum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y01._MAX, BTX1)  // _MAX: Maximum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y01._LEN, BTL1)  // _LEN: Length
                BTMN = MB32 /* \MB32 */
                BTMX = ((MB32 + ML32) - One)
                BTLN = ML32 /* \ML32 */
                If ((TOPM != Zero))
                {
                    BTX1 = TOPM /* \TOPM */
                }

                BTN1 = (PCBL + One)
                BTL1 = (BTX1 - BTN1) /* \_SB_.PCI0._CRS.BTN1 */
                BTL1 += One
                If ((MM64 == One))
                {
                    CreateQWordField (CRES, \_SB.PCI0._Y02._MIN, M1MN)  // _MIN: Minimum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y02._MAX, M1MX)  // _MAX: Maximum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y02._LEN, M1LN)  // _LEN: Length
                    M1MN = HMB1 /* \HMB1 */
                    M1MX = HMM1 /* \HMM1 */
                    M1LN = HML1 /* \HML1 */
                    CreateQWordField (CRES, \_SB.PCI0._Y03._MIN, M2MN)  // _MIN: Minimum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y03._MAX, M2MX)  // _MAX: Maximum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y03._LEN, M2LN)  // _LEN: Length
                    M2MN = HMB2 /* \HMB2 */
                    M2MX = HMM2 /* \HMM2 */
                    M2LN = HML2 /* \HML2 */
                }

                Return (CRES) /* \_SB_.PCI0.CRES */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                CreateWordField (CRES, \_SB.PCI0._Y04._LEN, BLEN)  // _LEN: Length
                If ((BLEN != Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                CreateWordField (CRES, \_SB.PCI0._Y04._LEN, BLEN)  // _LEN: Length
                CreateWordField (CRES, \_SB.PCI0._Y04._MIN, BMIN)  // _MIN: Minimum Base Address
                If ((BLEN != Zero))
                {
                    Return (BMIN) /* \_SB_.PCI0._BBN.BMIN */
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (NAPE, 0, NotSerialized)
            {
                Local0 = M249 (Zero, Zero, Zero, 0x14300000)
                Local0 &= 0xFFFFFFEF
                M250 (Zero, Zero, Zero, 0x14300000, Local0)
            }

            Name (PD00, Package (0x0A)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    Zero, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }
            })
            Name (AR00, Package (0x0A)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x18
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x18
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x19
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    Zero, 
                    Zero, 
                    0x19
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    Zero, 
                    0x19
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x1A
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00) /* \_SB_.PCI0.AR00 */
                }

                Return (PD00) /* \_SB_.PCI0.PD00 */
            }

            Device (GPP0)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Name (M434, 0x2711)
                Name (PD10, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR10, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x18
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x19
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1B
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR10) /* \_SB_.PCI0.GPP0.AR10 */
                    }

                    Return (PD10) /* \_SB_.PCI0.GPP0.PD10 */
                }

                Method (_DSD, 0, Serialized)  // _DSD: Device-Specific Data
                {
                    Return (Package (0x02)
                    {
                        ToUUID ("6b4ad420-8fd3-4364-acf8-eb94876fd9eb") /* Unknown UUID */, 
                        Package (0x00){}
                    })
                }

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    Name (M432, Zero)
                    Name (M433, Zero)
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (M435, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (M435, Zero, M436)
                                CreateBitField (M435, 0x05, M445)
                                CreateBitField (M435, 0x0A, M437)
                                CreateBitField (M435, 0x0B, M438)
                                If ((Arg1 >= 0x04))
                                {
                                    M436 = One
                                    M445 = One
                                    M432 = ((M049 (M128, 0x66) >> 0x04) & One)
                                    M433 = ((M049 (M128, 0x66) >> 0x05) & One)
                                    If ((M432 == One))
                                    {
                                        M437 = One
                                    }

                                    If ((M433 == One))
                                    {
                                        M438 = One
                                    }
                                }
                                Else
                                {
                                    M436 = One
                                    M445 = One
                                }

                                Return (M435) /* \_SB_.PCI0.GPP0._DSM.M435 */
                            }
                            Case (0x05)
                            {
                                Return (Zero)
                            }
                            Case (0x0A)
                            {
                                Return (One)
                            }
                            Case (0x0B)
                            {
                                Local0 = ToInteger (Arg3)
                                If ((Local0 <= 0x2710))
                                {
                                    M434 = 0x2710
                                }
                                Else
                                {
                                    Local0 = 0x2710
                                }

                                Return (Local0)
                            }
                            Default
                            {
                                Return (Zero)
                            }

                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
            }

            Device (GPP1)
            {
                Name (_ADR, 0x00010002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP1._PRW Return GPRW (0x8, 0x4)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP1._PRW Return GPRW (0x8, 0x0)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PD12, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR12, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1D
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1F
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR12) /* \_SB_.PCI0.GPP1.AR12 */
                    }

                    Return (PD12) /* \_SB_.PCI0.GPP1.PD12 */
                }
            }

            Device (GPP2)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
                Name (PD1E, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, 
                        Zero
                    }
                })
                Name (AR1E, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR1E) /* \_SB_.PCI0.GPP2.AR1E */
                    }

                    Return (PD1E) /* \_SB_.PCI0.GPP2.PD1E */
                }
            }

            Device (GPP3)
            {
                Name (_ADR, 0x00020002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP3._PRW Return GPRW (0xE, 0x4)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x0D, 0x04))
                    }
                    Else
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP3._PRW Return GPRW (0xE, 0x0)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x0D, Zero))
                    }
                }

                Name (PD20, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, 
                        Zero
                    }
                })
                Name (AR20, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR20) /* \_SB_.PCI0.GPP3.AR20 */
                    }

                    Return (PD20) /* \_SB_.PCI0.GPP3.PD20 */
                }

                Device (WLAN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (WRDX, Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0x80000000, 
                            0x8000
                        }
                    })
                    Method (WRDD, 0, Serialized)
                    {
                        DerefOf (WRDX [One]) [Zero] = 0x07
                        DerefOf (WRDX [One]) [One] = 0x434E
                        Return (WRDX) /* \_SB_.PCI0.GPP3.WLAN.WRDX */
                    }

                    OperationRegion (WLPC, PCI_Config, Zero, 0x90)
                    Field (WLPC, ByteAcc, NoLock, Preserve)
                    {
                        WVID,   16, 
                        WDID,   16, 
                        Offset (0x44), 
                        ICAP,   32, 
                        ICTR,   16, 
                        Offset (0x84), 
                        MCAP,   32, 
                        MCTR,   16
                    }

                    Method (MTDS, 0, Serialized)
                    {
                        Name (MTD6, Package (0x1F)
                        {
                            0x4D, 
                            0x54, 
                            0x44, 
                            0x53, 
                            One, 
                            Zero, 
                            0x02, 
                            One, 
                            0x1E, 
                            0x1C, 
                            0x1C, 
                            0x1C, 
                            0x1C, 
                            0x13, 
                            0x13, 
                            0x13, 
                            0x13, 
                            0x13, 
                            0x13, 
                            0x02, 
                            0x1E, 
                            0x1C, 
                            0x1C, 
                            0x1C, 
                            0x1C, 
                            0x13, 
                            0x13, 
                            0x13, 
                            0x13, 
                            0x13, 
                            0x13
                        })
                        Name (MTD5, Package (0x1F)
                        {
                            0x4D, 
                            0x54, 
                            0x44, 
                            0x53, 
                            One, 
                            Zero, 
                            0x02, 
                            One, 
                            0x1E, 
                            0x1C, 
                            0x1C, 
                            0x1C, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x02, 
                            0x1E, 
                            0x1C, 
                            0x1C, 
                            0x1C, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        If ((WDID == 0x0616))
                        {
                            Return (MTD6) /* \_SB_.PCI0.GPP3.WLAN.MTDS.MTD6 */
                        }
                        Else
                        {
                            Return (MTD5) /* \_SB_.PCI0.GPP3.WLAN.MTDS.MTD5 */
                        }
                    }

                    Method (MTCL, 0, Serialized)
                    {
                        Name (MTCL, Package (0x0C)
                        {
                            0x4D, 
                            0x54, 
                            0x43, 
                            0x4C, 
                            One, 
                            Zero, 
                            0x80, 
                            Zero, 
                            One, 
                            0x08, 
                            Zero, 
                            Zero
                        })
                        Return (MTCL) /* \_SB_.PCI0.GPP3.WLAN.MTCL.MTCL */
                    }

                    Method (MTGS, 0, Serialized)
                    {
                        Name (MTGS, Package (0x15)
                        {
                            0x4D, 
                            0x54, 
                            0x47, 
                            0x53, 
                            One, 
                            0x03, 
                            One, 
                            0x18, 
                            0x06, 
                            0x22, 
                            0x04, 
                            0x02, 
                            0x28, 
                            0x08, 
                            0x26, 
                            0x07, 
                            0x03, 
                            0x2A, 
                            0x0B, 
                            0x28, 
                            0x08
                        })
                        Return (MTGS) /* \_SB_.PCI0.GPP3.WLAN.MTGS.MTGS */
                    }

                    Method (MTCC, 0, Serialized)
                    {
                        Name (MTCC, Package (0x07)
                        {
                            0x4D, 
                            0x54, 
                            0x43, 
                            0x43, 
                            Zero, 
                            0x43, 
                            0x4E
                        })
                        Return (MTCC) /* \_SB_.PCI0.GPP3.WLAN.MTCC.MTCC */
                    }

                    PowerResource (WRST, 0x05, 0x0000)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (One)
                        }

                        Method (_ON, 0, NotSerialized)  // _ON_: Power On
                        {
                        }

                        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                        {
                        }

                        Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                        {
                            If ((WVID == 0x14C3))
                            {
                                If ((MCAP & 0x10000000))
                                {
                                    Local0 = MCTR /* \_SB_.PCI0.GPP3.WLAN.MCTR */
                                    Local0 |= 0x8000
                                    MCTR = Local0
                                }
                            }
                            ElseIf ((ICAP & 0x10000000))
                            {
                                Local0 = ICTR /* \_SB_.PCI0.GPP3.WLAN.ICTR */
                                Local0 |= 0x8000
                                ICTR = Local0
                            }
                        }
                    }

                    Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
                    {
                        Return (Package (0x01)
                        {
                            WRST
                        })
                    }
                }
            }

            Device (GPP4)
            {
                Name (_ADR, 0x00030001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP4._PRW Return GPRW (0xE, 0x4)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x04, 0x04))
                    }
                    Else
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP4._PRW Return GPRW (0xE, 0x0)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x04, Zero))
                    }
                }

                Name (PD22, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AR22, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2B
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x28
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x29
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR22) /* \_SB_.PCI0.GPP4.AR22 */
                    }

                    Return (PD22) /* \_SB_.PCI0.GPP4.PD22 */
                }
            }

            Device (GPP5)
            {
                Name (_ADR, 0x00030002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP5._PRW Return GPRW (0xE, 0x4)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x16, 0x04))
                    }
                    Else
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GPP5._PRW Return GPRW (0xE, 0x0)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x16, Zero))
                    }
                }

                Name (PD24, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, 
                        Zero
                    }
                })
                Name (AR24, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x27
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x25
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR24) /* \_SB_.PCI0.GPP5.AR24 */
                    }

                    Return (PD24) /* \_SB_.PCI0.GPP5.PD24 */
                }

                Device (LAN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GP17)
            {
                Name (_ADR, 0x00080001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GP17._PRW Return GPRW (0x19, 0x4)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x19, 0x04))
                    }
                    Else
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GP17._PRW Return GPRW (0x19, 0x0)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x19, Zero))
                    }
                }

                Name (PD34, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AR34, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2B
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x28
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x29
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR34) /* \_SB_.PCI0.GP17.AR34 */
                    }

                    Return (PD34) /* \_SB_.PCI0.GP17.PD34 */
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GP17.VGA._STA Return 0xF\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (0x0F)
                    }

                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        DOSA = Arg0
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GP17.VGA._DOD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (Package (0x05)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200, 
                            0x00010210, 
                            0x00010220
                        })
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (BCLB, Package (0x34)
                        {
                            0x5A, 
                            0x3C, 
                            0x02, 
                            0x04, 
                            0x06, 
                            0x08, 
                            0x0A, 
                            0x0C, 
                            0x0E, 
                            0x10, 
                            0x12, 
                            0x14, 
                            0x16, 
                            0x18, 
                            0x1A, 
                            0x1C, 
                            0x1E, 
                            0x20, 
                            0x22, 
                            0x24, 
                            0x26, 
                            0x28, 
                            0x2A, 
                            0x2C, 
                            0x2E, 
                            0x30, 
                            0x32, 
                            0x34, 
                            0x36, 
                            0x38, 
                            0x3A, 
                            0x3C, 
                            0x3E, 
                            0x40, 
                            0x42, 
                            0x44, 
                            0x46, 
                            0x48, 
                            0x4A, 
                            0x4C, 
                            0x4E, 
                            0x50, 
                            0x52, 
                            0x54, 
                            0x56, 
                            0x58, 
                            0x5A, 
                            0x5C, 
                            0x5E, 
                            0x60, 
                            0x62, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            M460 ("PLA-ASL-\\_SB.PCI0.GP17.VGA.LCD._BCL\n", Zero, Zero, Zero, Zero, Zero, Zero)
                            Return (BCLB) /* \_SB_.PCI0.GP17.VGA_.LCD_.BCLB */
                        }

                        Method (_DDC, 1, NotSerialized)  // _DDC: Display Data Current
                        {
                            If (((PANT == One) || (PANT == 0xEF)))
                            {
                                Return (EDID) /* External reference */
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            M460 ("PLA-ASL-\\_SB.PCI0.GP17.VGA.LCD._BCM Arg0 = 0x%X\n", ToInteger (Arg0), Zero, Zero, Zero, Zero, Zero)
                            Divide ((Arg0 * 0xFF), 0x64, Local1, Local0)
                            AFN7 (Local0)
                        }
                    }
                }

                Device (XHC0)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0._PRW Return GPRW (0x19, 0x4)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x19, 0x04))
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x09, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT1._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT1.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x01, 0x00, 0x80, 0x00, 0x03, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT1_PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT1.PLD1 */
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x09, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT3._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT3.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x01, 0x00, 0x80, 0x00, 0x03, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT3._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT3.PLD1 */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT2._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT2.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x01, 0x00, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT2._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT2.PLD1 */
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT4._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT4.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x01, 0x00, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC0.RHUB.PRT4._PLD\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC0.RHUB.PRT4.PLD1 */
                            }
                        }
                    }
                }

                Device (XHC1)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1._PRW Return GPRW (0x19, 0x4)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x19, 0x04))
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1.RHUB.PRT1._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x01, 0x00, 0x80, 0x01, 0x03, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT1.PLD1 */
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1.RHUB.PRT3._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT3.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x01, 0x00, 0x80, 0x01, 0x03, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT3.PLD1 */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1.RHUB.PRT2._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x01, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PLD1 */
                            }

                            Device (PRT1)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Name (UPC1, Package (0x04)
                                {
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1.RHUB.PRT2.PRT1._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                    Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PRT1.UPC1 */
                                }

                                Name (PLD1, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x01, 0x00, 0x80, 0x02, 0x03, 0x00, 0x00, 0x00,  // ........
                                        /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PRT1.PLD1 */
                                }
                            }

                            Device (PRT2)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Name (UPC1, Package (0x04)
                                {
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1.RHUB.PRT2.PRT2._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                    Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PRT2.UPC1 */
                                }

                                Name (PLD1, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PRT2.PLD1 */
                                }
                            }

                            Device (PRT3)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Name (UPC1, Package (0x04)
                                {
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1.RHUB.PRT2.PRT3._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                    Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PRT3.UPC1 */
                                }

                                Name (PLD1, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PRT3.PLD1 */
                                }
                            }

                            Device (PRT4)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Name (UPC1, Package (0x04)
                                {
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1.RHUB.PRT2.PRT4._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                    Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PRT4.UPC1 */
                                }

                                Name (PLD1, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT2.PRT4.PLD1 */
                                }
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1.RHUB.PRT4._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT4.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x01, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT4.PLD1 */
                            }

                            Device (PRT1)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Name (UPC1, Package (0x04)
                                {
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    M460 ("PLA-ASL-\\_SB.PCI0.GP17.XHC1.RHUB.PRT4.PRT1._UPC\n", Zero, Zero, Zero, Zero, Zero, Zero)
                                    Return (UPC1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT4.PRT1.UPC1 */
                                }

                                Name (PLD1, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x01, 0x00, 0x80, 0x02, 0x03, 0x00, 0x00, 0x00,  // ........
                                        /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT4.PRT1.PLD1 */
                                }
                            }
                        }
                    }
                }

                Device (PSP)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                }

                Device (ACP)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                }

                Device (AZAL)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                }
            }

            Device (GP18)
            {
                Name (_ADR, 0x00080002)  // _ADR: Address
                Name (PD35, Package (0x00){})
                Name (AR35, Package (0x00){})
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR35) /* \_SB_.PCI0.GP18.AR35 */
                    }

                    Return (PD35) /* \_SB_.PCI0.GP18.PD35 */
                }

                Device (SATA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GP19)
            {
                Name (_ADR, 0x00080003)  // _ADR: Address
                Name (PD36, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, 
                        Zero
                    }
                })
                Name (AR36, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR36) /* \_SB_.PCI0.GP19.AR36 */
                    }

                    Return (PD36) /* \_SB_.PCI0.GP19.PD36 */
                }

                Device (XHC2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        M460 ("PLA-ASL-\\_SB.PCI0.GP19.XHC2._PRW Return GPRW (0x1A, 0x4)\n", Zero, Zero, Zero, Zero, Zero, Zero)
                        Return (GPRW (0x1A, 0x03))
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.UPC1 */
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x00, 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.PLD1 */
                            }

                            Device (PRT1)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Name (UPC1, Package (0x04)
                                {
                                    0xFF, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (UPC1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.PRT1.UPC1 */
                                }

                                Name (PLD1, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x24, 0x01, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  // $.......
                                        /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLD1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.PRT1.PLD1 */
                                }

                                Device (BLU0)
                                {
                                    Name (_ADR, One)  // _ADR: Address
                                }
                            }

                            Device (PRT2)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Name (UPC1, Package (0x04)
                                {
                                    0xFF, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (UPC1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.PRT2.UPC1 */
                                }

                                Name (PLD1, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x24, 0x01, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  // $.......
                                        /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLD1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.PRT2.PLD1 */
                                }

                                Device (CAM0)
                                {
                                    Name (_ADR, 0x02)  // _ADR: Address
                                    Name (PLD1, Package (0x01)
                                    {
                                        Buffer (0x14)
                                        {
                                            /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                            /* 0008 */  0x24, 0x01, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  // $.......
                                            /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                        }
                                    })
                                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                    {
                                        Return (PLD1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.PRT2.CAM0.PLD1 */
                                    }
                                }
                            }

                            Device (PRT3)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Name (UPC1, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (UPC1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.PRT3.UPC1 */
                                }

                                Name (PLD1, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x48, 0x1E, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00,  // H.......
                                        /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                    }
                                })
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLD1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.PRT3.PLD1 */
                                }
                            }

                            Device (PRT4)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Name (UPC1, Package (0x04)
                                {
                                    0xFF, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                })
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (UPC1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT1.PRT4.UPC1 */
                                }
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (UPC1, Package (0x04)
                            {
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x00, 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0010 */  0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            })
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT2.UPC1 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP19.XHC2.RHUB.PRT2.PLD1 */
                            }
                        }
                    }
                }
            }

            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((HPEN == One))
                    {
                        Return (0x0F)
                    }

                    Return (One)
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    M460 ("PLA-ASL-\\_SB.PCI0.HPET._CRS\n", Zero, Zero, Zero, Zero, Zero, Zero)
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y05)
                    })
                    CreateDWordField (BUF0, \_SB.PCI0.HPET._CRS._Y05._BAS, HPEB)  // _BAS: Base Address
                    Local0 = 0xFED00000
                    HPEB = (Local0 & 0xFFFFFC00)
                    Return (BUF0) /* \_SB_.PCI0.HPET._CRS.BUF0 */
                }
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If ((HPEN == One))
                        {
                            Return (BUF0) /* \_SB_.PCI0.LPC0.RTC_.BUF0 */
                        }

                        Return (BUF1) /* \_SB_.PCI0.LPC0.RTC_.BUF1 */
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0xD0,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                    })
                }

                Device (SPIR)
                {
                    Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Name (THMP, Package (0x17)
                {
                    Package (0x12)
                    {
                        0x05, 
                        0x00018A88, 
                        0x07, 
                        0x00019A28, 
                        0x13, 
                        0x00018A88, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x0001D4C0, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00027100, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xD6D8, 
                        0x07, 
                        0xD6D8, 
                        0x13, 
                        0xD6D8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x000124F8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00027100, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xD6D8, 
                        0x07, 
                        0xFDE8, 
                        0x13, 
                        0xD6D8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x000124F8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00027100, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x88B8, 
                        0x07, 
                        0x88B8, 
                        0x13, 
                        0x88B8, 
                        One, 
                        0x32, 
                        0x06, 
                        0xA410, 
                        0x08, 
                        0x05, 
                        0x0C, 
                        0x00015F90, 
                        0x0B, 
                        0xEA60, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xAFC8, 
                        0x07, 
                        0xAFC8, 
                        0x13, 
                        0xAFC8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0xD6D8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x0001D4C0, 
                        0x0B, 
                        0x00013880, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x88B8, 
                        0x07, 
                        0x88B8, 
                        0x13, 
                        0x88B8, 
                        One, 
                        0x32, 
                        0x06, 
                        0xA410, 
                        0x08, 
                        0x05, 
                        0x0C, 
                        0x00015F90, 
                        0x0B, 
                        0xEA60, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x000128E0, 
                        0x07, 
                        0x000128E0, 
                        0x13, 
                        0x000128E0, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x0001D4C0, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00027100, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xAFC8, 
                        0x07, 
                        0xAFC8, 
                        0x13, 
                        0xAFC8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0xFDE8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00027100, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xAFC8, 
                        0x07, 
                        0xAFC8, 
                        0x13, 
                        0xAFC8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0xFDE8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00027100, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x88B8, 
                        0x07, 
                        0x88B8, 
                        0x13, 
                        0x88B8, 
                        One, 
                        0x32, 
                        0x06, 
                        0xA410, 
                        0x08, 
                        0x05, 
                        0x0C, 
                        0x00015F90, 
                        0x0B, 
                        0xEA60, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xAFC8, 
                        0x07, 
                        0xD6D8, 
                        0x13, 
                        0xAFC8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0xD6D8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x0001D4C0, 
                        0x0B, 
                        0x00013880, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x88B8, 
                        0x07, 
                        0x88B8, 
                        0x13, 
                        0x88B8, 
                        One, 
                        0x32, 
                        0x06, 
                        0xA410, 
                        0x08, 
                        0x05, 
                        0x0C, 
                        0x00015F90, 
                        0x0B, 
                        0xEA60, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x00018A88, 
                        0x07, 
                        0x00019A28, 
                        0x13, 
                        0x00018A88, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x0001D4C0, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00027100, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xD6D8, 
                        0x07, 
                        0xD6D8, 
                        0x13, 
                        0xD6D8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x000124F8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00027100, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xD6D8, 
                        0x07, 
                        0xD6D8, 
                        0x13, 
                        0xFDE8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x000124F8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00027100, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x88B8, 
                        0x07, 
                        0x88B8, 
                        0x13, 
                        0x88B8, 
                        One, 
                        0x32, 
                        0x06, 
                        0xA410, 
                        0x08, 
                        0x05, 
                        0x0C, 
                        0x00015F90, 
                        0x0B, 
                        0xEA60, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xAFC8, 
                        0x07, 
                        0xAFC8, 
                        0x13, 
                        0xAFC8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0xD6D8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x0001D4C0, 
                        0x0B, 
                        0x00013880, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x88B8, 
                        0x07, 
                        0x88B8, 
                        0x13, 
                        0x88B8, 
                        One, 
                        0x32, 
                        0x06, 
                        0xA410, 
                        0x08, 
                        0x05, 
                        0x0C, 
                        0x00015F90, 
                        0x0B, 
                        0xEA60, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x7530, 
                        0x07, 
                        0x7530, 
                        0x13, 
                        0x7530, 
                        One, 
                        0x32, 
                        0x06, 
                        0x88B8, 
                        0x08, 
                        0x05, 
                        0x0C, 
                        0x000DBBA0, 
                        0x0B, 
                        0xEA60, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0x00014C08, 
                        0x07, 
                        0x00015F90, 
                        0x13, 
                        0x00014C08, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x0001D4C0, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00186A00, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xD6D8, 
                        0x07, 
                        0xD6D8, 
                        0x13, 
                        0xD6D8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x000124F8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00186A00, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xEA60, 
                        0x07, 
                        0xFDE8, 
                        0x13, 
                        0xEA60, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0x0001D4C0, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00186A00, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }, 

                    Package (0x12)
                    {
                        0x05, 
                        0xAFC8, 
                        0x07, 
                        0xAFC8, 
                        0x13, 
                        0xAFC8, 
                        One, 
                        0x01F4, 
                        0x06, 
                        0xFDE8, 
                        0x08, 
                        0x1E, 
                        0x0C, 
                        0x00186A00, 
                        0x0B, 
                        0x0001A5E0, 
                        0x03, 
                        0x5F
                    }
                })
                Device (H_EC)
                {
                    Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (ECON, One)
                    Name (ECAV, Zero)
                    Name (ECTK, One)
                    Name (GPSF, Zero)
                    Name (DGST, 0xD1)
                    Mutex (ECMT, 0x00)
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BFFR, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0062,             // Range Minimum
                                0x0062,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                            IO (Decode16,
                                0x0066,             // Range Minimum
                                0x0066,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                        })
                        Return (BFFR) /* \_SB_.PCI0.LPC0.H_EC._CRS.BFFR */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((ECON == One))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Method (_GPE, 0, NotSerialized)  // _GPE: General Purpose Events
                    {
                        Local0 = 0x07
                        Return (Local0)
                    }

                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If ((Arg0 == 0x03))
                        {
                            ECAV = Arg1
                        }

                        If (ECAV)
                        {
                            Local0 = (ECRD (RefOf (AWHG)) << 0x08)
                            Local0 += ECRD (RefOf (AWLW))
                            Local1 = ECRD (RefOf (ECWR))
                            If (((Local0 > 0xC8) && (Local1 & One))){}
                            ElseIf ((ECRD (RefOf (CMEN)) == One))
                            {
                                ECWT (Zero, RefOf (CMEN))
                            }

                            Local0 = ECRD (RefOf (ITSM))
                            FNQS (Local0)
                            COMM ()
                        }
                    }

                    OperationRegion (ECF2, SystemMemory, 0xFE800400, 0xFF)
                    Field (ECF2, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x01), 
                        Offset (0x02), 
                        Offset (0x03), 
                        Offset (0x0F), 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        HKVC,   1, 
                            ,   1, 
                        Offset (0x10), 
                        EVMR,   8, 
                        EVMN,   8, 
                        EVT1,   8, 
                        EVT2,   8, 
                        HTKS,   8, 
                        HTKE,   8, 
                        Offset (0x17), 
                        TSR1,   8, 
                        TSR2,   8, 
                        TSR3,   8, 
                        TSR4,   8, 
                        TSR5,   8, 
                        TSR6,   8, 
                        TSR7,   8, 
                        TSR8,   8, 
                        TSR9,   8, 
                        LSTE,   1, 
                            ,   1, 
                            ,   1, 
                        FNHK,   1, 
                            ,   1, 
                        CRHK,   1, 
                        OCFL,   1, 
                        Offset (0x21), 
                            ,   1, 
                        PJID,   1, 
                            ,   2, 
                            ,   1, 
                        Offset (0x22), 
                        Offset (0x23), 
                        GSTS,   8, 
                        HKST,   8, 
                        TOCP,   1, 
                        CALK,   1, 
                        NULK,   1, 
                            ,   1, 
                            ,   1, 
                        WINK,   1, 
                        Offset (0x26), 
                        AST1,   8, 
                        Offset (0x28), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCD,   8, 
                        SDAT,   16, 
                        SDA2,   16, 
                        SDA4,   32, 
                        SDA5,   32, 
                        SDA6,   32, 
                        SDA7,   32, 
                        SDA8,   32, 
                        SDA9,   32, 
                        SDAA,   32, 
                        SMCN,   8, 
                        Offset (0x50), 
                        BS50,   32, 
                        BS54,   16, 
                        BS56,   8, 
                        Offset (0x5F), 
                        FASP,   8, 
                        ECWR,   8, 
                        PAWT,   8, 
                        B1SN,   16, 
                        B1DC,   16, 
                        B1FV,   16, 
                        B1FC,   16, 
                        BTPT,   16, 
                        B1CR,   16, 
                        B1RC,   16, 
                        B1VT,   16, 
                        BALM,   16, 
                        BCYC,   16, 
                        Offset (0x78), 
                        B1DA,   16, 
                        B1TP,   16, 
                        BRSC,   8, 
                        MIDL,   8, 
                        MIDH,   8, 
                        HIDL,   8, 
                        HIDH,   8, 
                        FWVL,   8, 
                        FWVH,   8, 
                        DAVL,   8, 
                        DAVH,   8, 
                        Offset (0x86), 
                        BFUD,   16, 
                        Offset (0x89), 
                        Offset (0x8A), 
                        B1TE,   16, 
                        B1TF,   16, 
                        AWHG,   8, 
                        AWLW,   8, 
                            ,   1, 
                        FWEN,   1, 
                        FUEN,   1, 
                        Offset (0x91), 
                        EDCC,   1, 
                        ALSC,   1, 
                        CDMB,   1, 
                        CCSB,   1, 
                        BTSM,   1, 
                        BTCM,   1, 
                        LBTM,   1, 
                        CSBM,   1, 
                        HYMS,   1, 
                        HDME,   1, 
                        HGMF,   1, 
                        SWCS,   1, 
                            ,   1, 
                        DCRC,   1, 
                        ALSS,   1, 
                        Offset (0x93), 
                        IPEN,   1, 
                        MBBD,   1, 
                        SBBD,   1, 
                        QCFG,   1, 
                        QCEN,   1, 
                        UCSA,   1, 
                            ,   1, 
                        Offset (0x94), 
                        EDCF,   1, 
                        BTCF,   1, 
                        HSMG,   1, 
                            ,   1, 
                        BLEG,   1, 
                        BTMF,   1, 
                        ATOM,   1, 
                        Offset (0x95), 
                        PERM,   1, 
                        TEMM,   1, 
                        Offset (0x96), 
                        BATM,   8, 
                        BBHL,   8, 
                        BBLP,   8, 
                        BBHM,   8, 
                        KBNL,   8, 
                        F1HI,   8, 
                        F1LO,   8, 
                        F2HI,   8, 
                        F2LO,   8, 
                        PABD,   8, 
                        Offset (0xA1), 
                        Offset (0xA2), 
                        Offset (0xA3), 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        Offset (0xA4), 
                        Offset (0xA8), 
                        RTC1,   32, 
                        Offset (0xB0), 
                        BDN1,   128, 
                        BVN1,   128, 
                        TFLG,   8, 
                        GFLG,   8, 
                        GPMD,   8, 
                        Offset (0xE0), 
                        Offset (0xE1), 
                        SSDK,   8, 
                            ,   2, 
                        FWDE,   1, 
                            ,   2, 
                        FAAP,   1, 
                        Offset (0xE3), 
                        BPWM,   8, 
                        ITSM,   8, 
                        Offset (0xE6), 
                        Offset (0xE7), 
                        ECTP,   8, 
                        LEDM,   8, 
                        RGBR,   8, 
                        RGBG,   8, 
                        RGBB,   8, 
                        Offset (0xED), 
                        Offset (0xEE), 
                        Offset (0xEF), 
                        Offset (0xF0), 
                            ,   3, 
                            ,   1, 
                            ,   2, 
                            ,   1, 
                        CMEN,   1, 
                        Offset (0xF2), 
                        DGPU,   8, 
                        CPUT,   8, 
                        STSM,   8, 
                        Offset (0xF6), 
                        CSPL,   8, 
                        FPPT,   8, 
                        CTCL,   8
                    }

                    Method (ECRD, 1, Serialized)
                    {
                        Local0 = Acquire (ECMT, 0x03E8)
                        If ((Local0 == Zero))
                        {
                            If (ECAV)
                            {
                                Local1 = DerefOf (Arg0)
                                Release (ECMT)
                                Return (Local1)
                            }
                        }

                        Release (ECMT)
                        Return (Zero)
                    }

                    Method (ECWT, 2, Serialized)
                    {
                        Local0 = Acquire (ECMT, 0x03E8)
                        If ((Local0 == Zero))
                        {
                            If (ECAV)
                            {
                                Arg1 = Arg0
                            }

                            Release (ECMT)
                        }
                    }

                    Scope (\)
                    {
                        Name (DBFS, Zero)
                    }

                    Method (NVDX, 0, NotSerialized)
                    {
                        If ((ECRD (RefOf (ECWR)) & One))
                        {
                            Local1 = (ECRD (RefOf (AWHG)) << 0x08)
                            Local1 += ECRD (RefOf (AWLW))
                            If (((Local1 > 0x5F) && (Local1 <= 0xC8)))
                            {
                                Local0 = 0xD3
                            }

                            If (((Local1 >= 0x5A) && (Local1 <= 0x5F)))
                            {
                                Local0 = 0xD5
                            }

                            If ((Local1 > 0xC8))
                            {
                                Local0 = 0xD1
                            }
                        }
                        Else
                        {
                            Local0 = 0xD1
                        }

                        If ((Local0 == 0xD1))
                        {
                            If ((DGST != Local0))
                            {
                                P80H = Local0
                                DGST = Local0
                                Notify (^^^GPP0.PEGP, Local0)
                            }

                            Sleep (0x0A)
                            If ((GPSF == Zero))
                            {
                                GPSF = One
                                Notify (^^^GPP0.PEGP, 0xC0) // Hardware-Specific
                            }
                        }
                        Else
                        {
                            If ((DGST != Local0))
                            {
                                P80H = Local0
                                DGST = Local0
                                Notify (^^^GPP0.PEGP, Local0)
                            }

                            Sleep (0x0A)
                            If ((GPSF == One))
                            {
                                GPSF = Zero
                                Notify (^^^GPP0.PEGP, 0xC0) // Hardware-Specific
                            }
                        }
                    }

                    Method (THMD, 1, Serialized)
                    {
                        Name (XX11, Buffer (0x07){})
                        CreateWordField (XX11, Zero, SSZF)
                        CreateByteField (XX11, 0x02, SMUF)
                        CreateDWordField (XX11, 0x03, SMUD)
                        SSZF = 0x07
                        Local2 = 0x12
                        Local0 = Zero
                        Local1 = 0xE8
                        While ((Local0 < Local2))
                        {
                            Local1 = M249 (Zero, Zero, Zero, 0x03B1057C)
                            If ((Local1 == One))
                            {
                                SMUF = DerefOf (DerefOf (THMP [Arg0]) [Local0])
                                Local0++
                                SMUD = DerefOf (DerefOf (THMP [Arg0]) [Local0])
                                Local0++
                                ALIB (0x0C, XX11)
                            }
                        }

                        NVDX ()
                        Notify (NPCF, 0xC0) // Hardware-Specific
                    }

                    Method (FNQS, 1, Serialized)
                    {
                        Local0 = (ECRD (RefOf (AWHG)) << 0x08)
                        Local0 += ECRD (RefOf (AWLW))
                        Local1 = ECRD (RefOf (ECWR))
                        If (((Local0 <= 0xC8) && (Local1 & One)))
                        {
                            ECWT (0x02, RefOf (ITSM))
                            THMD (0x12)
                        }
                        ElseIf ((ToInteger (Arg0) == 0x02))
                        {
                            If ((ECRD (RefOf (ECWR)) & One))
                            {
                                If ((ECRD (RefOf (CPUT)) == 0x07))
                                {
                                    THMD (0x0A)
                                }
                                ElseIf ((ECRD (RefOf (CPUT)) == 0x09))
                                {
                                    THMD (0x04)
                                }
                                ElseIf ((ECRD (RefOf (CPUT)) == 0x05))
                                {
                                    THMD (0x0A)
                                }
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x07))
                            {
                                THMD (0x0B)
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x09))
                            {
                                THMD (0x05)
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x05))
                            {
                                THMD (0x0B)
                            }
                        }
                        ElseIf ((ToInteger (Arg0) == Zero))
                        {
                            If ((ECRD (RefOf (ECWR)) & One))
                            {
                                If ((DBFS == Zero))
                                {
                                    If ((ECRD (RefOf (CPUT)) == 0x07))
                                    {
                                        THMD (0x15)
                                    }
                                    ElseIf ((ECRD (RefOf (CPUT)) == 0x09))
                                    {
                                        THMD (0x13)
                                    }
                                    ElseIf ((ECRD (RefOf (CPUT)) == 0x05))
                                    {
                                        THMD (0x15)
                                    }
                                }
                                ElseIf ((ECRD (RefOf (CPUT)) == 0x07))
                                {
                                    THMD (0x16)
                                }
                                ElseIf ((ECRD (RefOf (CPUT)) == 0x09))
                                {
                                    THMD (0x14)
                                }
                                ElseIf ((ECRD (RefOf (CPUT)) == 0x05))
                                {
                                    THMD (0x16)
                                }
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x07))
                            {
                                THMD (0x09)
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x09))
                            {
                                THMD (0x03)
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x05))
                            {
                                THMD (0x09)
                            }
                        }
                        ElseIf ((ToInteger (Arg0) == One))
                        {
                            If ((ECRD (RefOf (ECWR)) & One))
                            {
                                If ((DBFS == Zero))
                                {
                                    If ((ECRD (RefOf (CPUT)) == 0x07))
                                    {
                                        THMD (0x06)
                                    }
                                    ElseIf ((ECRD (RefOf (CPUT)) == 0x09))
                                    {
                                        THMD (Zero)
                                    }
                                    ElseIf ((ECRD (RefOf (CPUT)) == 0x05))
                                    {
                                        THMD (0x06)
                                    }
                                }
                                ElseIf ((ECRD (RefOf (CPUT)) == 0x07))
                                {
                                    THMD (0x07)
                                }
                                ElseIf ((ECRD (RefOf (CPUT)) == 0x09))
                                {
                                    THMD (One)
                                }
                                ElseIf ((ECRD (RefOf (CPUT)) == 0x05))
                                {
                                    THMD (0x07)
                                }
                            }
                            Else
                            {
                            }
                        }
                    }

                    Method (MSPL, 0, Serialized)
                    {
                        Local0 = ECRD (RefOf (CSPL))
                        If ((DBFS == One))
                        {
                            If ((ECRD (RefOf (CPUT)) == 0x07))
                            {
                                If ((Local0 > 0x2D))
                                {
                                    Local0 = 0x2D
                                }
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x09))
                            {
                                If ((Local0 > 0x37))
                                {
                                    Local0 = 0x37
                                }
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x05))
                            {
                                If ((Local0 > 0x2D))
                                {
                                    Local0 = 0x2D
                                }
                            }
                        }

                        Local0 *= 0x03E8
                        MODP (0x05, Local0)
                        MODP (0x07, Local0)
                        MODP (0x13, Local0)
                    }

                    Method (MFPT, 0, Serialized)
                    {
                        Local0 = ECRD (RefOf (FPPT))
                        If ((DBFS == One))
                        {
                            If ((ECRD (RefOf (CPUT)) == 0x07))
                            {
                                If ((Local0 > 0x41))
                                {
                                    Local0 = 0x41
                                }
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x09))
                            {
                                If ((Local0 > 0x4B))
                                {
                                    Local0 = 0x4B
                                }
                            }
                            ElseIf ((ECRD (RefOf (CPUT)) == 0x05))
                            {
                                If ((Local0 > 0x41))
                                {
                                    Local0 = 0x41
                                }
                            }
                        }

                        Local0 *= 0x03E8
                        MODP (0x06, Local0)
                    }

                    Method (COMM, 0, Serialized)
                    {
                        If ((ECRD (RefOf (CMEN)) == One))
                        {
                            MSPL ()
                            MFPT ()
                            Local0 = ECRD (RefOf (CTCL))
                            MODP (0x03, Local0)
                        }
                    }

                    Method (MODP, 2, Serialized)
                    {
                        Name (XX11, Buffer (0x07){})
                        CreateWordField (XX11, Zero, SSZF)
                        CreateByteField (XX11, 0x02, SMUF)
                        CreateDWordField (XX11, 0x03, SMUD)
                        SSZF = 0x07
                        SMUF = Arg0
                        SMUD = Arg1
                        ALIB (0x0C, XX11)
                    }

                    Device (BAT0)
                    {
                        Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
                        Name (_UID, One)  // _UID: Unique ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If ((ECON == One))
                            {
                                If ((ECRD (RefOf (ECWR)) & 0x02))
                                {
                                    Return (0x1F)
                                }
                            }

                            Return (0x0F)
                        }

                        Method (_BIX, 0, Serialized)  // _BIX: Battery Information Extended
                        {
                            Name (BPK1, Package (0x15)
                            {
                                One, 
                                Zero, 
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                One, 
                                0xFFFFFFFF, 
                                Zero, 
                                Zero, 
                                0x64, 
                                0x00017318, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x64, 
                                Zero, 
                                "SR Real Battery", 
                                "123456789", 
                                "Li-ion", 
                                "LiP", 
                                One
                            })
                            Local0 = (B1DC * 0x0A)
                            BPK1 [0x02] = Local0
                            Local1 = (B1FC * 0x0A)
                            BPK1 [0x03] = Local1
                            BPK1 [0x06] = (Local1 / 0x0A)
                            BPK1 [0x07] = (Local1 / 0x19)
                            BPK1 [0x08] = BCYC /* \_SB_.PCI0.LPC0.H_EC.BCYC */
                            BPK1 [0x10] = ToString (BDN1, Ones)
                            BPK1 [0x11] = ToHexString (B1SN)
                            BPK1 [0x13] = ToString (BVN1, Ones)
                            Return (BPK1) /* \_SB_.PCI0.LPC0.H_EC.BAT0._BIX.BPK1 */
                        }

                        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                        {
                            Name (PKG1, Package (0x04)
                            {
                                Ones, 
                                Ones, 
                                Ones, 
                                Ones
                            })
                            Local0 = Zero
                            If ((ECRD (RefOf (ECWR)) & 0x04))
                            {
                                Local0 = 0x02
                            }
                            ElseIf ((ECRD (RefOf (ECWR)) & 0x08))
                            {
                                Local0 = One
                            }

                            If ((ECRD (RefOf (ECWR)) & 0x10))
                            {
                                Local0 |= 0x04
                            }

                            PKG1 [Zero] = Local0
                            Local1 = (B1CR * 0x0A)
                            PKG1 [One] = Local1
                            PKG1 [0x02] = (B1RC * 0x0A)
                            PKG1 [0x03] = B1FV /* \_SB_.PCI0.LPC0.H_EC.B1FV */
                            Return (PKG1) /* \_SB_.PCI0.LPC0.H_EC.BAT0._BST.PKG1 */
                        }

                        Method (_PCL, 0, NotSerialized)  // _PCL: Power Consumer List
                        {
                            Return (_SB) /* \_SB_ */
                        }
                    }

                    Device (LID0)
                    {
                        Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If ((ECON == One))
                            {
                                Return (0x0F)
                            }

                            Return (Zero)
                        }

                        Method (_LID, 0, NotSerialized)  // _LID: Lid Status
                        {
                            If ((ECRD (RefOf (LSTE)) == One))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (One)
                            }
                        }
                    }

                    Method (_Q05, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((TOCP == One))
                        {
                            ^^^WMID.EVBU [Zero] = One
                            ^^^WMID.EVBU [One] = 0x06
                            ^^^WMID.EVBU [0x02] = One
                            Notify (WMID, 0x20) // Reserved
                        }
                        Else
                        {
                            ^^^WMID.EVBU [Zero] = One
                            ^^^WMID.EVBU [One] = 0x06
                            ^^^WMID.EVBU [0x02] = Zero
                            Notify (WMID, 0x20) // Reserved
                        }
                    }

                    Method (_Q09, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((ECRD (RefOf (KBNL)) == Zero))
                        {
                            ^^^WMID.EVBU [Zero] = One
                            ^^^WMID.EVBU [One] = 0x05
                            ^^^WMID.EVBU [0x02] = Zero
                            Notify (WMID, 0x20) // Reserved
                        }
                        ElseIf ((ECRD (RefOf (KBNL)) == One))
                        {
                            ^^^WMID.EVBU [Zero] = One
                            ^^^WMID.EVBU [One] = 0x05
                            ^^^WMID.EVBU [0x02] = One
                            Notify (WMID, 0x20) // Reserved
                        }
                        ElseIf ((ECRD (RefOf (KBNL)) == 0x02))
                        {
                            ^^^WMID.EVBU [Zero] = One
                            ^^^WMID.EVBU [One] = 0x05
                            ^^^WMID.EVBU [0x02] = 0x02
                            Notify (WMID, 0x20) // Reserved
                        }
                        ElseIf ((ECRD (RefOf (KBNL)) == 0x03))
                        {
                            ^^^WMID.EVBU [Zero] = One
                            ^^^WMID.EVBU [One] = 0x05
                            ^^^WMID.EVBU [0x02] = 0x03
                            Notify (WMID, 0x20) // Reserved
                        }
                    }

                    Method (_Q0C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Notify (HDWB, 0x80) // Status Change
                        Sleep (0x32)
                    }

                    Method (_Q0A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((ECRD (RefOf (CMEN)) == One))
                        {
                            ECWT (One, RefOf (ITSM))
                            FNQS (One)
                            ^^^WMID.EVBU [Zero] = One
                            ^^^WMID.EVBU [One] = 0x0F
                            ^^^WMID.EVBU [0x02] = One
                            Notify (WMID, 0x20) // Reserved
                            ECWT (Zero, RefOf (CMEN))
                        }
                        Else
                        {
                            ECWT (0x55, RefOf (TFLG))
                            If ((ECRD (RefOf (ECWR)) & One))
                            {
                                Local1 = (ECRD (RefOf (AWHG)) << 0x08)
                                Local1 += ECRD (RefOf (AWLW))
                                If ((Local1 > 0xC8))
                                {
                                    If ((ECRD (RefOf (ITSM)) == Zero))
                                    {
                                        ECWT (One, RefOf (ITSM))
                                        FNQS (One)
                                        ^^^WMID.EVBU [Zero] = One
                                        ^^^WMID.EVBU [One] = 0x0F
                                        ^^^WMID.EVBU [0x02] = One
                                        Notify (WMID, 0x20) // Reserved
                                    }
                                    ElseIf ((ECRD (RefOf (ITSM)) == One))
                                    {
                                        ECWT (0x02, RefOf (ITSM))
                                        FNQS (0x02)
                                        ^^^WMID.EVBU [Zero] = One
                                        ^^^WMID.EVBU [One] = 0x0F
                                        ^^^WMID.EVBU [0x02] = 0x02
                                        Notify (WMID, 0x20) // Reserved
                                    }
                                    ElseIf ((ECRD (RefOf (ITSM)) == 0x02))
                                    {
                                        ECWT (Zero, RefOf (ITSM))
                                        FNQS (Zero)
                                        ^^^WMID.EVBU [Zero] = One
                                        ^^^WMID.EVBU [One] = 0x0F
                                        ^^^WMID.EVBU [0x02] = Zero
                                        Notify (WMID, 0x20) // Reserved
                                    }
                                }
                            }
                            ElseIf ((ECRD (RefOf (ITSM)) == Zero))
                            {
                                ECWT (0x02, RefOf (ITSM))
                                FNQS (0x02)
                                ^^^WMID.EVBU [Zero] = One
                                ^^^WMID.EVBU [One] = 0x0F
                                ^^^WMID.EVBU [0x02] = 0x02
                                Notify (WMID, 0x20) // Reserved
                            }
                            ElseIf ((ECRD (RefOf (ITSM)) == 0x02))
                            {
                                ECWT (Zero, RefOf (ITSM))
                                FNQS (Zero)
                                ^^^WMID.EVBU [Zero] = One
                                ^^^WMID.EVBU [One] = 0x0F
                                ^^^WMID.EVBU [0x02] = Zero
                                Notify (WMID, 0x20) // Reserved
                            }
                        }
                    }

                    Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Sleep (0x012C)
                        Notify (BAT0, 0x80) // Status Change
                        Notify (ADP1, 0x80) // Status Change
                        Local1 = (ECRD (RefOf (AWHG)) << 0x08)
                        Local1 += ECRD (RefOf (AWLW))
                        If ((ECRD (RefOf (ECWR)) & One))
                        {
                            If ((Local1 > 0xC8))
                            {
                                Local0 = ECRD (RefOf (ITSM))
                                FNQS (Local0)
                            }
                            Else
                            {
                                If ((ECRD (RefOf (CMEN)) == One))
                                {
                                    ECWT (Zero, RefOf (CMEN))
                                }

                                GPSF = One
                                DGST = 0xD1
                                Local0 = ECRD (RefOf (ITSM))
                                FNQS (Local0)
                            }
                        }
                        Else
                        {
                            If ((ECRD (RefOf (CMEN)) == One))
                            {
                                ECWT (Zero, RefOf (CMEN))
                            }

                            If ((ECRD (RefOf (ITSM)) == One))
                            {
                                ECWT (Zero, RefOf (ITSM))
                                FNQS (Zero)
                                ECWT (0x55, RefOf (TFLG))
                            }
                            Else
                            {
                                Local0 = ECRD (RefOf (ITSM))
                                FNQS (Local0)
                            }
                        }

                        Local0 = ECRD (RefOf (ITSM))
                        ^^^WMID.EVBU [Zero] = One
                        ^^^WMID.EVBU [One] = 0x0F
                        ^^^WMID.EVBU [0x02] = Local0
                        Notify (WMID, 0x20) // Reserved
                    }

                    Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Sleep (0x012C)
                        Notify (BAT0, 0x80) // Status Change
                        Notify (BAT0, 0x81) // Information Change
                    }

                    Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Notify (LID0, 0x80) // Status Change
                    }

                    Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Notify (PWRB, 0x80) // Status Change
                        Sleep (0x32)
                    }

                    Method (_Q21, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Notify (BAT0, 0x80) // Status Change
                    }

                    Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((ECRD (RefOf (FWDE)) == Zero))
                        {
                            ^^^WMID.EVBU [Zero] = One
                            ^^^WMID.EVBU [One] = 0x0A
                            ^^^WMID.EVBU [0x02] = One
                            Notify (WMID, 0x20) // Reserved
                        }
                        Else
                        {
                            ^^^WMID.EVBU [Zero] = One
                            ^^^WMID.EVBU [One] = 0x0A
                            ^^^WMID.EVBU [0x02] = Zero
                            Notify (WMID, 0x20) // Reserved
                        }
                    }

                    Method (_Q81, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((ECRD (RefOf (ECWR)) & One))
                        {
                            DBFS = Zero
                            Local0 = ECRD (RefOf (ITSM))
                            FNQS (Local0)
                            COMM ()
                        }
                    }

                    Method (_Q82, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((ECRD (RefOf (ECWR)) & One))
                        {
                            DBFS = One
                            Local0 = ECRD (RefOf (ITSM))
                            FNQS (Local0)
                            COMM ()
                        }
                    }

                    Method (_QD0, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Local0 = (ECRD (RefOf (AWHG)) << 0x08)
                        Local0 += ECRD (RefOf (AWLW))
                        If ((ECRD (RefOf (ECWR)) & One))
                        {
                            If ((Local0 <= 0xC8))
                            {
                                P80H = 0xD0
                                GPSF = One
                                DGST = 0xD1
                                NVDX ()
                                Notify (NPCF, 0xC0) // Hardware-Specific
                            }
                        }
                    }
                }

                Scope (\_SB)
                {
                    Device (ADP1)
                    {
                        Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
                        Name (XX00, Buffer (0x03){})
                        Name (ACDC, 0xFF)
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If ((^^PCI0.LPC0.H_EC.ECON == One))
                            {
                                Return (0x0F)
                            }

                            Return (Zero)
                        }

                        Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
                        {
                            Local0 = (^^PCI0.LPC0.H_EC.ECRD (RefOf (^^PCI0.LPC0.H_EC.ECWR)) & One)
                            If (((Local0 != ACDC) || (ACDC == 0xFF)))
                            {
                                CreateWordField (XX00, Zero, SSZE)
                                CreateByteField (XX00, 0x02, ACST)
                                SSZE = 0x03
                                ACDC = Local0
                                If (ACDC)
                                {
                                    P80H = 0xECAC
                                    ^^PCI0.GP17.VGA.AFN4 (One)
                                    ACST = Zero
                                }
                                Else
                                {
                                    P80H = 0xECDC
                                    ^^PCI0.GP17.VGA.AFN4 (0x02)
                                    ACST = One
                                }

                                ALIB (One, XX00)
                            }

                            Return (Local0)
                        }

                        Method (_PCL, 0, NotSerialized)  // _PCL: Power Consumer List
                        {
                            Return (_SB) /* \_SB_ */
                        }
                    }
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("KBC8042"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _CID: Compatible ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveLow, Shared, )
                            {1}
                    })
                }
            }
        }

        Method (GSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xE4
            Sleep (0x02)
        }

        Method (S80H, 1, NotSerialized)
        {
            Local0 = (Arg0 & 0x00FFFFFF)
            P80H = (Local0 | 0xDB000000)
        }

        Method (BSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xBE
            Sleep (One)
        }
    }

    Name (TSOS, 0x75)
    Name (UR0I, 0x03)
    Name (UR1I, 0x04)
    Name (UR2I, 0x03)
    Name (UR3I, 0x04)
    Name (UR4I, 0x0F)
    Name (IC0I, 0x0A)
    Name (IC1I, 0x0B)
    Name (IC2I, 0x04)
    Name (IC3I, 0x06)
    Name (IC4I, 0x0E)
    If (CondRefOf (\_OSI))
    {
        If (_OSI ("Windows 2009"))
        {
            TSOS = 0x50
        }

        If (_OSI ("Windows 2015"))
        {
            TSOS = 0x70
        }
    }

    Scope (_SB)
    {
        OperationRegion (SMIC, SystemMemory, 0xFED80000, 0x00800000)
        Field (SMIC, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36A), 
            SMIB,   8
        }

        OperationRegion (SSMI, SystemIO, SMIB, 0x02)
        Field (SSMI, AnyAcc, NoLock, Preserve)
        {
            SMIW,   16
        }

        OperationRegion (ECMC, SystemIO, 0x72, 0x02)
        Field (ECMC, AnyAcc, NoLock, Preserve)
        {
            ECMI,   8, 
            ECMD,   8
        }

        IndexField (ECMI, ECMD, ByteAcc, NoLock, Preserve)
        {
            Offset (0x08), 
            FRTB,   32
        }

        OperationRegion (FRTP, SystemMemory, FRTB, 0x0100)
        Field (FRTP, AnyAcc, NoLock, Preserve)
        {
            PEBA,   32, 
                ,   5, 
            IC0E,   1, 
            IC1E,   1, 
            IC2E,   1, 
            IC3E,   1, 
            IC4E,   1, 
            IC5E,   1, 
            UT0E,   1, 
            UT1E,   1, 
            I31E,   1, 
            I32E,   1, 
            I33E,   1, 
            UT2E,   1, 
                ,   1, 
            EMMD,   2, 
            UT4E,   1, 
            I30E,   1, 
                ,   1, 
            XHCE,   1, 
                ,   1, 
                ,   1, 
            UT3E,   1, 
            ESPI,   1, 
            EMME,   1, 
            HFPE,   1, 
            HD0E,   1, 
            Offset (0x08), 
            PCEF,   1, 
                ,   4, 
            IC0D,   1, 
            IC1D,   1, 
            IC2D,   1, 
            IC3D,   1, 
            IC4D,   1, 
            IC5D,   1, 
            UT0D,   1, 
            UT1D,   1, 
            I31D,   1, 
            I32D,   1, 
            I33D,   1, 
            UT2D,   1, 
                ,   1, 
            EHCD,   1, 
                ,   1, 
            UT4D,   1, 
            I30D,   1, 
                ,   1, 
            XHCD,   1, 
            SD_D,   1, 
                ,   1, 
            UT3D,   1, 
                ,   1, 
            EMD3,   1, 
                ,   2, 
            S03D,   1, 
            Offset (0x1C), 
            I30M,   1, 
            I31M,   1, 
            I32M,   1, 
            I33M,   1
        }

        OperationRegion (FCFG, SystemMemory, PEBA, 0x01000000)
        Field (FCFG, DWordAcc, NoLock, Preserve)
        {
            Offset (0xA3078), 
                ,   2, 
            LDQ0,   1, 
            Offset (0xA30CB), 
                ,   7, 
            AUSS,   1
        }

        OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
        Field (IOMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0x15), 
            IM15,   8, 
            IM16,   8, 
            Offset (0x1F), 
            IM1F,   8, 
            IM20,   8, 
            Offset (0x44), 
            IM44,   8, 
            Offset (0x46), 
            IM46,   8, 
            Offset (0x4A), 
            IM4A,   8, 
            IM4B,   8, 
            Offset (0x57), 
            IM57,   8, 
            IM58,   8, 
            Offset (0x68), 
            IM68,   8, 
            IM69,   8, 
            IM6A,   8, 
            IM6B,   8, 
            Offset (0x6D), 
            IM6D,   8
        }

        OperationRegion (FACR, SystemMemory, 0xFED81E00, 0x0100)
        Field (FACR, AnyAcc, NoLock, Preserve)
        {
            Offset (0x80), 
                ,   28, 
            RD28,   1, 
                ,   1, 
            RQTY,   1, 
            Offset (0x84), 
                ,   28, 
            SD28,   1, 
                ,   1, 
            Offset (0xA0), 
            PG1A,   1
        }

        OperationRegion (LUIE, SystemMemory, 0xFEDC0020, 0x04)
        Field (LUIE, AnyAcc, NoLock, Preserve)
        {
            IER0,   1, 
            IER1,   1, 
            IER2,   1, 
            IER3,   1, 
            UOL0,   1, 
            UOL1,   1, 
            UOL2,   1, 
            UOL3,   1, 
            WUR0,   2, 
            WUR1,   2, 
            WUR2,   2, 
            WUR3,   2
        }

        Method (FRUI, 1, Serialized)
        {
            If ((Arg0 == Zero))
            {
                Return (IUA0) /* \_SB_.IUA0 */
            }
            ElseIf ((Arg0 == One))
            {
                Return (IUA1) /* \_SB_.IUA1 */
            }
            ElseIf ((Arg0 == 0x02))
            {
                Return (IUA2) /* \_SB_.IUA2 */
            }
            ElseIf ((Arg0 == 0x03))
            {
                Return (IUA3) /* \_SB_.IUA3 */
            }
            Else
            {
                Return (0x03)
            }
        }

        Method (FUIO, 1, Serialized)
        {
            If ((IER0 == One))
            {
                If ((WUR0 == Arg0))
                {
                    Return (Zero)
                }
            }

            If ((IER1 == One))
            {
                If ((WUR1 == Arg0))
                {
                    Return (One)
                }
            }

            If ((IER2 == One))
            {
                If ((WUR2 == Arg0))
                {
                    Return (0x02)
                }
            }

            If ((IER3 == One))
            {
                If ((WUR3 == Arg0))
                {
                    Return (0x03)
                }
            }

            Return (0x0F)
        }

        Method (SRAD, 2, Serialized)
        {
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            ADIS = One
            ADSR = Zero
            Stall (Arg1)
            ADSR = One
            ADIS = Zero
            Stall (Arg1)
        }

        Method (DSAD, 2, Serialized)
        {
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg1 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }

                    ADTD = 0x03
                }
            }
        }

        Method (HSAD, 2, Serialized)
        {
            Local3 = (One << Arg0)
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg1 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    PG1A = One
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    RQTY = One
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (!Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    RQTY = Zero
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }

                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    ADTD = 0x03
                    PG1A = Zero
                }
            }
        }

        OperationRegion (FPIC, SystemIO, 0x0C00, 0x02)
        Field (FPIC, AnyAcc, NoLock, Preserve)
        {
            FPII,   8, 
            FPID,   8
        }

        IndexField (FPII, FPID, ByteAcc, NoLock, Preserve)
        {
            Offset (0xF4), 
            IUA0,   8, 
            IUA1,   8, 
            Offset (0xF8), 
            IUA2,   8, 
            IUA3,   8
        }

        Device (HFP1)
        {
            Name (_HID, "AMDI0060")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HFPE)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFEC11000,         // Address Base
                        0x00000100,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.HFP1._CRS.RBUF */
            }
        }

        Device (HID0)
        {
            Name (_HID, "AMDI0063")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HD0E)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFEC13000,         // Address Base
                        0x00000200,         // Address Length
                        )
                    GpioInt (Edge, ActiveHigh, SharedAndWake, PullNone, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00AB
                        }
                })
                Return (RBUF) /* \_SB_.HID0._CRS.RBUF */
            }
        }

        Device (GPIO)
        {
            Name (_HID, "AMDI0030")  // _HID: Hardware ID
            Name (_CID, "AMDI0030")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                    {
                        0x00000007,
                    }
                    Memory32Fixed (ReadWrite,
                        0xFED81500,         // Address Base
                        0x00000400,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (PPKG)
        {
            Name (_HID, "AMDI0052")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (FUR0)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {3}
                    Memory32Fixed (ReadWrite,
                        0xFEDC9000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEDC7000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (UR0I & 0x0F))
                Return (BUF0) /* \_SB_.FUR0._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT0E == One))
                    {
                        If ((FUIO (Zero) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT0D && UT0E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT0D && UT0E))
                {
                    DSAD (0x0B, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT0D && UT0E))
                {
                    DSAD (0x0B, 0x03)
                }
            }
        }

        Device (FUR1)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {4}
                    Memory32Fixed (ReadWrite,
                        0xFEDCA000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEDC8000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (UR1I & 0x0F))
                Return (BUF0) /* \_SB_.FUR1._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT1E == One))
                    {
                        If ((FUIO (One) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT1D && UT1E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT1D && UT1E))
                {
                    DSAD (0x0C, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT1D && UT1E))
                {
                    DSAD (0x0C, 0x03)
                }
            }
        }

        Device (FUR2)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {3}
                    Memory32Fixed (ReadWrite,
                        0xFEDCE000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEDCC000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (UR2I & 0x0F))
                Return (BUF0) /* \_SB_.FUR2._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT2E == One))
                    {
                        If ((FUIO (0x02) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT2D && UT2E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT2D && UT2E))
                {
                    DSAD (0x10, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT2D && UT2E))
                {
                    DSAD (0x10, 0x03)
                }
            }
        }

        Device (FUR3)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {4}
                    Memory32Fixed (ReadWrite,
                        0xFEDCF000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEDCD000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (UR3I & 0x0F))
                Return (BUF0) /* \_SB_.FUR3._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT3E == One))
                    {
                        If ((FUIO (0x03) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT3D && UT3E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT3D && UT3E))
                {
                    DSAD (0x1A, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT3D && UT3E))
                {
                    DSAD (0x1A, 0x03)
                }
            }
        }

        Device (FUR4)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {15}
                    Memory32Fixed (ReadWrite,
                        0xFEDD1000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEDD0000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (UR4I & 0x0F))
                Return (BUF0) /* \_SB_.FUR4._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT4E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT4D && UT4E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT4D && UT4E))
                {
                    DSAD (0x14, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT4D && UT4E))
                {
                    DSAD (0x14, 0x03)
                }
            }
        }

        Device (I2CA)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {10}
                    Memory32Fixed (ReadWrite,
                        0xFEDC2000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC0I & 0x0F))
                Return (BUF0) /* \_SB_.I2CA._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC0E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d93e4d1c-58bb-493c-a06a-605a717f9e2e") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (0x04)
                            {
                                 0xE5, 0x00, 0x6A, 0x00                           // ..j.
                            })
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x05, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC0D && IC0E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC0D && IC0E))
                {
                    DSAD (0x05, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC0D && IC0E))
                {
                    DSAD (0x05, 0x03)
                }
            }
        }

        Device (I2CB)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {11}
                    Memory32Fixed (ReadWrite,
                        0xFEDC3000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC1I & 0x0F))
                Return (BUF0) /* \_SB_.I2CB._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC1E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d93e4d1c-58bb-493c-a06a-605a717f9e2e") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (0x04)
                            {
                                 0xE5, 0x00, 0x6A, 0x00                           // ..j.
                            })
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x06, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC1D && IC1E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC1D && IC1E))
                {
                    DSAD (0x06, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC1D && IC1E))
                {
                    DSAD (0x06, 0x03)
                }
            }
        }

        Device (I2CC)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {4}
                    Memory32Fixed (ReadWrite,
                        0xFEDC4000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC2I & 0x0F))
                Return (BUF0) /* \_SB_.I2CC._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC2E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d93e4d1c-58bb-493c-a06a-605a717f9e2e") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (0x04)
                            {
                                 0xE5, 0x00, 0x6A, 0x00                           // ..j.
                            })
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x07, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC2D && IC2E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC2D && IC2E))
                {
                    DSAD (0x07, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC2D && IC2E))
                {
                    DSAD (0x07, 0x03)
                }
            }
        }

        Device (I2CD)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {6}
                    Memory32Fixed (ReadWrite,
                        0xFEDC5000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC3I & 0x0F))
                Return (BUF0) /* \_SB_.I2CD._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC3E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("d93e4d1c-58bb-493c-a06a-605a717f9e2e") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (0x04)
                            {
                                 0xE5, 0x00, 0x6A, 0x00                           // ..j.
                            })
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x08, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC3D && IC3E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC3D && IC3E))
                {
                    DSAD (0x08, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC3D && IC3E))
                {
                    DSAD (0x08, 0x03)
                }
            }
        }

        Name (I3ID, "AMDI0015")
        Name (I2ID, "AMDI0016")
        Device (I3CA)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((I30M == Zero))
                {
                    Return (I3ID) /* \_SB_.I3ID */
                }
                Else
                {
                    Return (I2ID) /* \_SB_.I2ID */
                }
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {10}
                    Memory32Fixed (ReadWrite,
                        0xFEDD2000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC0I & 0x0F))
                Return (BUF0) /* \_SB_.I3CA._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((I30E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x15, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((I30D && I30E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((I30D && I30E))
                {
                    DSAD (0x15, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((I30D && I30E))
                {
                    DSAD (0x15, 0x03)
                }
            }
        }

        Device (I3CB)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((I31M == Zero))
                {
                    Return (I3ID) /* \_SB_.I3ID */
                }
                Else
                {
                    Return (I2ID) /* \_SB_.I2ID */
                }
            }

            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {11}
                    Memory32Fixed (ReadWrite,
                        0xFEDD3000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC1I & 0x0F))
                Return (BUF0) /* \_SB_.I3CB._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((I31E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0D, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((I31D && I31E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((I31D && I31E))
                {
                    DSAD (0x0D, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((I31D && I31E))
                {
                    DSAD (0x0D, 0x03)
                }
            }
        }

        Device (I3CC)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((I32M == Zero))
                {
                    Return (I3ID) /* \_SB_.I3ID */
                }
                Else
                {
                    Return (I2ID) /* \_SB_.I2ID */
                }
            }

            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {4}
                    Memory32Fixed (ReadWrite,
                        0xFEDD4000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC2I & 0x0F))
                Return (BUF0) /* \_SB_.I3CC._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((I32E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0E, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((I32D && I32E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((I32D && I32E))
                {
                    DSAD (0x0E, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((I32D && I32E))
                {
                    DSAD (0x0E, 0x03)
                }
            }
        }

        Device (I3CD)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((I33M == Zero))
                {
                    Return (I3ID) /* \_SB_.I3ID */
                }
                Else
                {
                    Return (I2ID) /* \_SB_.I2ID */
                }
            }

            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Edge, ActiveHigh, Exclusive, )
                        {6}
                    Memory32Fixed (ReadWrite,
                        0xFEDD6000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                CreateWordField (BUF0, One, IRQW)
                IRQW = (One << (IC3I & 0x0F))
                Return (BUF0) /* \_SB_.I3CD._CRS.BUF0 */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((I33E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0F, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((I33D && I33E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((I33D && I33E))
                {
                    DSAD (0x0F, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((I33D && I33E))
                {
                    DSAD (0x0F, 0x03)
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (UAR1)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DDN, "COM1")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (Zero) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x02E8,             // Range Minimum
                        0x02E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y06)
                    IRQNoFlags (_Y07)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y06._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y06._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR1._CRS._Y07._INT, IRQL)  // _INT: Interrupts
                Local0 = FUIO (Zero)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                IRQL = (One << (FRUI (Zero) & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR1._CRS.BUF0 */
            }
        }

        Device (UAR2)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_DDN, "COM2")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (One) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x02F8,             // Range Minimum
                        0x02F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y08)
                    IRQNoFlags (_Y09)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y08._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y08._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR2._CRS._Y09._INT, IRQL)  // _INT: Interrupts
                Local0 = FUIO (One)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                IRQL = (One << (FRUI (One) & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR2._CRS.BUF0 */
            }
        }

        Device (UAR3)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DDN, "COM3")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (0x02) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x03E8,             // Range Minimum
                        0x03E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0A)
                    IRQNoFlags (_Y0B)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0A._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0A._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR3._CRS._Y0B._INT, IRQL)  // _INT: Interrupts
                Local0 = FUIO (0x02)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                IRQL = (One << (FRUI (0x02) & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR3._CRS.BUF0 */
            }
        }

        Device (UAR4)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_DDN, "COM4")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (0x03) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x03F8,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0C)
                    IRQNoFlags (_Y0D)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y0C._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y0C._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR4._CRS._Y0D._INT, IRQL)  // _INT: Interrupts
                Local0 = FUIO (0x03)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                IRQL = (One << (FRUI (0x03) & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR4._CRS.BUF0 */
            }
        }
    }

    Scope (_SB.I2CD)
    {
        Device (TPD0)
        {
            Name (_ADR, One)  // _ADR: Address
            Name (_HID, "HTIX5288")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                GPIO, 
                I2CD
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x001B
                        }
                })
                Return (RBUF) /* \_SB_.I2CD.TPD0._CRS.RBUF */
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                {
                    If ((Arg2 == Zero))
                    {
                        If ((Arg1 == One))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Else
                        {
                            Return (Buffer (One)
                            {
                                 0x00                                             // .
                            })
                        }
                    }
                    ElseIf ((Arg2 == One))
                    {
                        Return (0x20)
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
                ElseIf ((Arg0 == ToUUID ("ef87eb82-f951-46da-84ec-14871ac6f84b") /* Unknown UUID */))
                {
                    If ((Arg2 == Zero))
                    {
                        If ((Arg1 == One))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }
}

