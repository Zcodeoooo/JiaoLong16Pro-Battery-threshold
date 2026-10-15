/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/ssdt4.dat, Mon Oct  5 18:48:44 2026
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000022A9 (8873)
 *     Revision         0x01
 *     Checksum         0x62
 *     OEM ID           "INSYDE"
 *     OEM Table ID     "EDK2    "
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "INSYDE", "EDK2    ", 0x00001000)
{
    External (_SB_.ALIB, MethodObj)    // 2 Arguments
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GP17, DeviceObj)
    External (_SB_.PCI0.GPP0, DeviceObj)
    External (_SB_.PCI0.GPP0.HDAU._ADR, UnknownObj)
    External (_SB_.PCI0.GPP0.PEGP, DeviceObj)
    External (_SB_.PCI0.GPP0.VGA_._ADR, UnknownObj)
    External (_SB_.PCI0.LPC0.H_EC.CPUT, IntObj)
    External (_SB_.PCI0.LPC0.H_EC.DGPU, IntObj)
    External (_SB_.PCI0.LPC0.H_EC.ECRD, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC0.H_EC.ITSM, IntObj)
    External (_SB_.PCI0.LPC0.H_EC.LSTE, IntObj)
    External (_SB_.PLTF.C000, DeviceObj)
    External (_SB_.PLTF.C001, DeviceObj)
    External (_SB_.PLTF.C002, DeviceObj)
    External (_SB_.PLTF.C003, DeviceObj)
    External (_SB_.PLTF.C004, DeviceObj)
    External (_SB_.PLTF.C005, DeviceObj)
    External (_SB_.PLTF.C006, DeviceObj)
    External (_SB_.PLTF.C007, DeviceObj)
    External (_SB_.PLTF.C008, DeviceObj)
    External (_SB_.PLTF.C009, DeviceObj)
    External (_SB_.PLTF.C00A, DeviceObj)
    External (_SB_.PLTF.C00B, DeviceObj)
    External (_SB_.PLTF.C00C, DeviceObj)
    External (_SB_.PLTF.C00D, DeviceObj)
    External (_SB_.PLTF.C00E, DeviceObj)
    External (_SB_.PLTF.C00F, DeviceObj)
    External (EDID, UnknownObj)
    External (M000, MethodObj)    // 1 Arguments
    External (M009, MethodObj)    // 1 Arguments
    External (M010, MethodObj)    // 2 Arguments
    External (M017, MethodObj)    // 6 Arguments
    External (M018, MethodObj)    // 7 Arguments
    External (M019, MethodObj)    // 4 Arguments
    External (M020, MethodObj)    // 5 Arguments
    External (M249, MethodObj)    // 4 Arguments
    External (M250, MethodObj)    // 5 Arguments
    External (M402, MethodObj)    // 3 Arguments
    External (M403, MethodObj)    // 4 Arguments
    External (TCNT, FieldUnitObj)

    Scope (\_SB.PCI0.GPP0)
    {
        Device (PEGP)
        {
            Name (_ADR, Zero)  // _ADR: Address
        }

        Device (NHDA)
        {
            Name (_ADR, One)  // _ADR: Address
            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0)
    {
        OperationRegion (HGOP, SystemMemory, 0xC2F7DF18, 0x00000013)
        Field (HGOP, AnyAcc, Lock, Preserve)
        {
            DGDA,   32, 
            DGBA,   32, 
            DGPV,   16, 
            OPTF,   8, 
            NVGE,   8, 
            DSSV,   32, 
            DISM,   8, 
            DISG,   8, 
            DISS,   8
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        OperationRegion (VBOR, SystemMemory, 0xCADEE018, 0x00040004)
        Field (VBOR, DWordAcc, Lock, Preserve)
        {
            RVBS,   32, 
            VBS1,   262144, 
            VBS2,   262144, 
            VBS3,   262144, 
            VBS4,   262144, 
            VBS5,   262144, 
            VBS6,   262144, 
            VBS7,   262144, 
            VBS8,   262144
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        OperationRegion (NOPR, SystemMemory, 0xCADEB018, 0x00002028)
        Field (NOPR, AnyAcc, Lock, Preserve)
        {
            DHPS,   8, 
            DPCS,   8, 
            GPSS,   8, 
            VENS,   8, 
            NBCS,   8, 
            GC6S,   8, 
            NVSR,   8, 
            NPCS,   8, 
            NCTP,   8, 
            SLVS,   8, 
            PBCM,   8, 
            EXMD,   8, 
            MXBS,   32, 
            MXMB,   32768, 
            SMXS,   32, 
            SMXB,   32768, 
            FBEN,   32, 
            ENVT,   32, 
            PWGD,   32, 
            DMMP,   32, 
            DLRP,   32
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Name (GSV1, Buffer (One)
        {
             0x00                                             // .
        })
        Name (GSV2, Buffer (One)
        {
             0x00                                             // .
        })
        Name (GSDR, Buffer (0xA1)
        {
            /* 0000 */  0x57, 0x74, 0xDC, 0x86, 0x75, 0x84, 0xEC, 0xE7,  // Wt..u...
            /* 0008 */  0x52, 0x44, 0xA1, 0x00, 0x00, 0x00, 0x00, 0x01,  // RD......
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0xDE, 0x10, 0x00, 0x00,  // ........
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0020 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00,  // ......4.
            /* 0028 */  0x00, 0x00, 0x01, 0x00, 0x47, 0x00, 0x00, 0x00,  // ....G...
            /* 0030 */  0x02, 0x00, 0x45, 0x00, 0x00, 0x00, 0x03, 0x00,  // ..E.....
            /* 0038 */  0x51, 0x00, 0x00, 0x00, 0x04, 0x00, 0x4F, 0x00,  // Q.....O.
            /* 0040 */  0x00, 0x00, 0x05, 0x00, 0x4D, 0x00, 0x00, 0x00,  // ....M...
            /* 0048 */  0x06, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x07, 0x00,  // ..K.....
            /* 0050 */  0x49, 0x00, 0x00, 0x00, 0x08, 0x00, 0x47, 0x00,  // I.....G.
            /* 0058 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0x1C,  // ........
            /* 0060 */  0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
            /* 0068 */  0x41, 0x5D, 0xC9, 0x00, 0x01, 0x24, 0x2E, 0x00,  // A]...$..
            /* 0070 */  0x02, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01,  // ........
            /* 0078 */  0x00, 0x00, 0x00, 0xD9, 0x1C, 0x04, 0x00, 0x00,  // ........
            /* 0080 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x68, 0x9E,  // .....`h.
            /* 0088 */  0x35, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // 5.......
            /* 0090 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00A0 */  0x00                                             // .
        })
        Method (NBCI, 4, Serialized)
        {
            Debug = "------- NV NBCI DSM --------"
            If ((Arg1 != 0x0102))
            {
                Debug = " NBCI DSM: NOT SUPPORTED!"
                Return (0x80000002)
            }

            If ((Arg2 == Zero))
            {
                Debug = "   NBCI fun0 NBCI_FUNC_SUPPORT"
                Return (Buffer (0x04)
                {
                     0x01, 0x00, 0x11, 0x00                           // ....
                })
            }

            If ((Arg2 == 0x10))
            {
                Debug = "   NBCI fun16 NBCI_FUNC_GETOBJBYTYPE"
                CreateWordField (Arg3, 0x02, BFF0)
                If ((BFF0 == 0x564B)){}
                If ((BFF0 == 0x4452))
                {
                    Return (GSDR) /* \_SB_.PCI0.GPP0.PEGP.GSDR */
                }
            }

            If ((Arg2 == 0x14))
            {
                Debug = "   NBCI fun20 NBCI_FUNC_GETBACKLIGHT"
                Return (Package (0x20)
                {
                    0x8001A450, 
                    0x0200, 
                    Zero, 
                    Zero, 
                    0x05, 
                    One, 
                    0xC8, 
                    0x32, 
                    0x03E8, 
                    0x0B, 
                    0x32, 
                    0x64, 
                    0x96, 
                    0xC8, 
                    0x012C, 
                    0x0190, 
                    0x01FE, 
                    0x0276, 
                    0x02F8, 
                    0x0366, 
                    0x03E8, 
                    Zero, 
                    0x64, 
                    0xC8, 
                    0x012C, 
                    0x0190, 
                    0x01F4, 
                    0x0258, 
                    0x02BC, 
                    0x0320, 
                    0x0384, 
                    0x03E8
                })
            }
        }
    }

    Scope (\)
    {
        Name (REST, 0x28)
        Name (PWEN, 0x07)
        Name (PWOK, 0x0C)
        Name (PWGD, 0x0C)
        Name (DGBA, 0xF0009000)
    }

    Scope (\_SB.PCI0.GPP0)
    {
        Method (SGPC, 1, NotSerialized)
        {
            If ((Arg0 == One))
            {
                M000 (0x9D)
                Sleep (0x05)
                Local0 = M249 (Zero, Zero, Zero, 0x11180428)
                Local0 |= One
                M250 (Zero, Zero, Zero, 0x11180428, Local0)
                Sleep (0x64)
                If ((M009 (PWOK) == One))
                {
                    Return (Zero)
                }

                M010 (REST, Zero)
                Sleep (One)
                M010 (PWEN, One)
                Sleep (0x02)
                Local0 = Zero
                While ((M009 (PWOK) == Zero))
                {
                    Sleep (One)
                    Local0++
                    If ((Local0 > 0x20))
                    {
                        Break
                    }
                }

                Sleep (0x1E)
                M010 (REST, One)
                Sleep (0x32)
                \_SB.ALIB (0x13, 0x09)
                Sleep (0x32)
                Local6 = 0x7FFFFFFF
                Local6 |= 0x80000000
                Local2 = M017 (Zero, One, One, 0x19, Zero, 0x08)
                Local1 = M019 (Zero, One, One, 0x54)
                M020 (Zero, One, One, 0x54, (Local1 & 0xFFFF7FFC))
                Local4 = One
                Local5 = 0x28
                While ((Local4 && Local5))
                {
                    Local0 = M019 (Local2, Zero, Zero, Zero)
                    If ((Local0 != Local6))
                    {
                        Local4 = Zero
                    }
                    Else
                    {
                        Sleep (0x05)
                        Local5--
                    }
                }

                \_SB.PCI0.GPP0.LREN = \_SB.PCI0.GPP0.PEGP.LTRE
                \_SB.PCI0.GPP0.CEDR = One
                M020 (Zero, One, One, 0x54, (Local1 & 0xFFFF7FFF))
                M000 (0xA0)
            }
            Else
            {
                M000 (0xA1)
                M010 (PWEN, One)
                \_SB.PCI0.GPP0.PEGP.LTRE = \_SB.PCI0.GPP0.LREN
                M402 (Zero, One, One)
                Local2 = M017 (Zero, One, One, 0x70, Zero, 0x10)
                M018 (Zero, One, One, 0x70, Zero, 0x10, (Local2 & 0xEFD7))
                \_SB.ALIB (0x12, 0x09)
                Sleep (One)
                M010 (REST, Zero)
                Sleep (One)
                Sleep (One)
                M010 (PWEN, Zero)
                Sleep (0x64)
                Local0 = Zero
                While ((M009 (PWOK) == One))
                {
                    If ((Local0 > 0x04))
                    {
                        Break
                    }

                    Sleep (0x10)
                    Local0++
                }

                M018 (Zero, One, One, 0x70, Zero, 0x10, Local2)
                M000 (0xA3)
            }
        }

        PowerResource (PG00, 0x00, 0x0000)
        {
            Name (M239, One)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (M239) /* \_SB_.PCI0.GPP0.PG00.M239 */
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                If ((M239 == Zero))
                {
                    If ((\_SB.PCI0.TDGC == One))
                    {
                        If ((\_SB.PCI0.DGCX == 0x03))
                        {
                            \_SB.PCI0.GC6O ()
                        }
                        ElseIf ((\_SB.PCI0.DGCX == 0x04))
                        {
                            \_SB.PCI0.GC6O ()
                        }

                        \_SB.PCI0.TDGC = Zero
                        \_SB.PCI0.DGCX = Zero
                    }
                    Else
                    {
                        SGPC (One)
                        CMDR = 0x07
                        D0ST = Zero
                    }
                }

                M239 = One
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                If ((M239 == One))
                {
                    If ((\_SB.PCI0.TDGC == One))
                    {
                        CreateField (\_SB.PCI0.TGPC, Zero, 0x03, GUPC)
                        If ((ToInteger (GUPC) == One))
                        {
                            \_SB.PCI0.GC6I ()
                        }
                        ElseIf ((ToInteger (GUPC) == 0x02))
                        {
                            \_SB.PCI0.GC6I ()
                        }
                    }
                    Else
                    {
                        SGPC (Zero)
                    }
                }

                M239 = Zero
            }
        }

        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PG00
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            PG00
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PG00
        })
        Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
        OperationRegion (RPCX, SystemMemory, DGBA, 0x1000)
        Field (RPCX, DWordAcc, NoLock, Preserve)
        {
            RVID,   32, 
            CMDR,   8, 
            Offset (0x19), 
            PRBN,   8, 
            Offset (0x54), 
            D0ST,   2, 
            Offset (0x62), 
            CEDR,   1, 
            Offset (0x68), 
            ASPM,   2, 
                ,   2, 
            LNKD,   1, 
            Offset (0x80), 
            Offset (0x81), 
                ,   2, 
            LREN,   1
        }

        Method (GSTA, 0, NotSerialized)
        {
            If ((M009 (PWOK) == Zero))
            {
                Return (Zero)
            }
            Else
            {
                Return (One)
            }
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Name (LTRE, Zero)
        Name (DGPS, Zero)
        Name (_PSC, Zero)  // _PSC: Power State Current
        Name (GPRF, Zero)
        Name (OPCE, 0x02)
        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
        {
            Return (Zero)
        }

        OperationRegion (PCIM, SystemMemory, 0xF0100000, 0x1000)
        Field (PCIM, DWordAcc, NoLock, Preserve)
        {
            NVID,   16, 
            NDID,   16, 
            CMDR,   8, 
            VGAR,   2008, 
            Offset (0x48B), 
                ,   1, 
            HDAE,   1
        }

        OperationRegion (DGPU, SystemMemory, 0xF0100000, 0x1000)
        Field (DGPU, DWordAcc, NoLock, Preserve)
        {
            Offset (0x40), 
            SSSV,   32
        }

        OperationRegion (PCIS, PCI_Config, Zero, 0x0100)
        Field (PCIS, AnyAcc, NoLock, Preserve)
        {
            PVID,   16, 
            PDID,   16
        }

        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            _PSC = Zero
            If ((DGPS != Zero))
            {
                \_SB.PCI0.GPP0.PG00._ON ()
                DGPS = Zero
            }
        }

        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
        {
            If ((OPCE == 0x03))
            {
                If ((DGPS == Zero))
                {
                    \_SB.PCI0.GPP0.PG00._OFF ()
                    DGPS = One
                }

                OPCE = 0x02
            }

            _PSC = 0x03
        }

        Method (SGST, 0, Serialized)
        {
            If ((PVID != 0x0FFF))
            {
                Return (0x0F)
            }

            Return (Zero)
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 == ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0") /* Unknown UUID */))
            {
                Return (\_SB.PCI0.GPP0.PEGP.NVOP (Arg0, Arg1, Arg2, Arg3))
            }

            If ((Arg0 == ToUUID ("a3132d01-8cda-49ba-a52e-bc9d46df6b81") /* Unknown UUID */))
            {
                Return (\_SB.PCI0.GPP0.PEGP.GPS (Arg0, Arg1, Arg2, Arg3))
            }

            If ((Arg0 == ToUUID ("cbeca351-067b-4924-9cbd-b46b00b86f34") /* Unknown UUID */))
            {
                Return (\_SB.PCI0.GPP0.PEGP.NVJT (Arg0, Arg1, Arg2, Arg3))
            }

            If ((Arg0 == ToUUID ("d4a50b75-65c7-46f7-bfb7-41514cea0244") /* Unknown UUID */))
            {
                Return (\_SB.PCI0.GPP0.PEGP.NBCI (Arg0, Arg1, Arg2, Arg3))
            }

            Return (0x80000001)
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Method (NVOP, 4, Serialized)
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (0x04)
                {
                     0x01, 0x00, 0x00, 0x04                           // ....
                })
            }
            ElseIf ((Arg2 == 0x1A))
            {
                CreateField (Arg3, 0x18, 0x02, OMPR)
                CreateField (Arg3, Zero, One, FLCH)
                CreateField (Arg3, One, One, DVSR)
                CreateField (Arg3, 0x02, One, DVSC)
                If (ToInteger (FLCH))
                {
                    \_SB.PCI0.GPP0.PEGP.OPCE = OMPR /* \_SB_.PCI0.GPP0.PEGP.NVOP.OMPR */
                }

                Local0 = Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                           // ....
                    }
                CreateField (Local0, Zero, One, OPEN)
                CreateField (Local0, 0x03, 0x02, CGCS)
                CreateField (Local0, 0x06, One, SHPC)
                CreateField (Local0, 0x08, One, SNSR)
                CreateField (Local0, 0x18, 0x03, DGPC)
                CreateField (Local0, 0x1B, 0x02, OHAC)
                OPEN = One
                SHPC = One
                DGPC = One
                OHAC = 0x03
                If (ToInteger (DVSC))
                {
                    If (ToInteger (DVSR))
                    {
                        \_SB.PCI0.GPP0.PEGP.GPRF = One
                    }
                    Else
                    {
                        \_SB.PCI0.GPP0.PEGP.GPRF = Zero
                    }
                }

                SNSR = \_SB.PCI0.GPP0.PEGP.GPRF
                If ((\_SB.PCI0.GPP0.PEGP.SGST () != Zero))
                {
                    CGCS = 0x03
                }

                Return (Local0)
            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Name (NLIM, Zero)
        Name (PSLS, Zero)
        Name (GPSP, Buffer (0x28){})
        CreateDWordField (GPSP, Zero, RETN)
        CreateDWordField (GPSP, 0x04, VRV1)
        CreateDWordField (GPSP, 0x08, TGPU)
        CreateDWordField (GPSP, 0x0C, PDTS)
        CreateDWordField (GPSP, 0x10, SFAN)
        CreateDWordField (GPSP, 0x14, SKNT)
        CreateDWordField (GPSP, 0x18, CPUE)
        CreateDWordField (GPSP, 0x1C, TMP1)
        CreateDWordField (GPSP, 0x20, TMP2)
        Method (GPS, 4, Serialized)
        {
            Debug = "------- NV GPS DSM --------"
            If ((Arg1 != 0x0200))
            {
                Return (0x80000002)
            }

            Switch (ToInteger (Arg2))
            {
                Case (Zero)
                {
                    Debug = "   GPS fun 0"
                    Return (Buffer (0x08)
                    {
                         0x01, 0x00, 0x08, 0x00, 0x01, 0x04, 0x00, 0x00   // ........
                    })
                }
                Case (0x13)
                {
                    Debug = "   GPS fun 19"
                    CreateDWordField (Arg3, Zero, TEMP)
                    If ((TEMP == Zero))
                    {
                        Return (0x04)
                    }

                    If ((TEMP && 0x04))
                    {
                        Return (0x04)
                    }
                }
                Case (0x20)
                {
                    Debug = "   GPS fun 32"
                    Name (RET1, Zero)
                    CreateBitField (Arg3, 0x02, SPBI)
                    If (NLIM)
                    {
                        RET1 |= One
                    }

                    If (PSLS)
                    {
                        RET1 |= 0x02
                    }

                    Return (RET1) /* \_SB_.PCI0.GPP0.PEGP.GPS_.RET1 */
                }
                Case (0x2A)
                {
                    Debug = "   GPS fun 42"
                    CreateField (Arg3, Zero, 0x04, PSH0)
                    CreateBitField (Arg3, 0x08, GPUT)
                    VRV1 = 0x00010000
                    Switch (ToInteger (PSH0))
                    {
                        Case (Zero)
                        {
                            Return (GPSP) /* \_SB_.PCI0.GPP0.PEGP.GPSP */
                        }
                        Case (One)
                        {
                            RETN = 0x0100
                            RETN |= ToInteger (PSH0)
                            Return (GPSP) /* \_SB_.PCI0.GPP0.PEGP.GPSP */
                        }
                        Case (0x02)
                        {
                            RETN = 0x0102
                            TGPU = Zero
                            Return (GPSP) /* \_SB_.PCI0.GPP0.PEGP.GPSP */
                        }

                    }
                }
                Default
                {
                    Return (0x80000002)
                }

            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0)
    {
        Method (RTL2, 0, NotSerialized)
        {
            M402 (Zero, One, One)
        }

        Method (RTL0, 0, NotSerialized)
        {
            M403 (Zero, One, One, One)
            Local1 = Zero
            While (((Local1 & 0x28) != 0x20))
            {
                Local1 = M017 (Zero, One, One, 0x6B, Zero, 0x08)
                Stall (0x63)
            }

            M403 (Zero, One, One, Zero)
        }

        Name (TGPC, Buffer (0x04)
        {
             0x00                                             // .
        })
        Name (TDGC, Zero)
        Name (DGCX, Zero)
        Name (L23B, Buffer (0x05){})
        Method (GC6I, 0, Serialized)
        {
            \_SB.PCI0.GPP0.PEGP.LTRE = \_SB.PCI0.GPP0.LREN
            Sleep (0x14)
            \_SB.PCI0.RTL2 ()
            Sleep (0x14)
            M010 (REST, Zero)
            Sleep (0x14)
        }

        Method (GC6O, 0, Serialized)
        {
            Sleep (0x14)
            M010 (REST, One)
            \_SB.PCI0.RTL0 ()
            Sleep (0x14)
            \_SB.PCI0.GPP0.CMDR |= 0x04
            \_SB.PCI0.GPP0.D0ST = Zero
            Local0 = Zero
            While ((\_SB.PCI0.GPP0.PEGP.NVID != 0x10DE))
            {
                Sleep (One)
                Local0++
                If ((Local0 > 0x20))
                {
                    Break
                }
            }

            \_SB.PCI0.GPP0.LREN = One
            \_SB.PCI0.GPP0.CEDR = One
            Sleep (0x14)
        }
    }

    Scope (\_SB.PCI0.GPP0.PEGP)
    {
        Method (NVJT, 4, Serialized)
        {
            Debug = "------- NV JT DSM --------"
            If ((ToInteger (Arg1) < 0x0100))
            {
                Return (0x80000001)
            }

            Switch (ToInteger (Arg2))
            {
                Case (Zero)
                {
                    Debug = "   JT fun0 JT_FUNC_SUPPORT"
                    Return (Buffer (0x04)
                    {
                         0x1B, 0x00, 0x00, 0x00                           // ....
                    })
                }
                Case (One)
                {
                    Debug = "   JT fun1 JT_FUNC_CAPS"
                    Name (JTCA, Buffer (0x04)
                    {
                         0x00                                             // .
                    })
                    CreateField (JTCA, Zero, One, JTEN)
                    CreateField (JTCA, One, 0x02, SREN)
                    CreateField (JTCA, 0x03, 0x02, PLPR)
                    CreateField (JTCA, 0x05, One, SRPR)
                    CreateField (JTCA, 0x06, 0x02, FBPR)
                    CreateField (JTCA, 0x08, 0x02, GUPR)
                    CreateField (JTCA, 0x0A, One, GC6R)
                    CreateField (JTCA, 0x0B, One, PTRH)
                    CreateField (JTCA, 0x0D, One, MHYB)
                    CreateField (JTCA, 0x0E, One, RPCL)
                    CreateField (JTCA, 0x0F, 0x02, GC6V)
                    CreateField (JTCA, 0x11, One, GEIS)
                    CreateField (JTCA, 0x12, One, GSWS)
                    CreateField (JTCA, 0x14, 0x0C, JTRV)
                    JTEN = One
                    GC6R = Zero
                    RPCL = One
                    SREN = One
                    FBPR = Zero
                    MHYB = One
                    GC6V = 0x02
                    JTRV = 0x0200
                    Return (JTCA) /* \_SB_.PCI0.GPP0.PEGP.NVJT.JTCA */
                }
                Case (0x02)
                {
                    Debug = "   JT fun2 JT_FUNC_POLICYSELECT"
                    Return (0x80000002)
                }
                Case (0x03)
                {
                    Debug = "   JT fun3 JT_FUNC_POWERCONTROL"
                    CreateField (Arg3, Zero, 0x03, GPPC)
                    CreateField (Arg3, 0x04, One, PLPC)
                    CreateField (Arg3, 0x07, One, ECOC)
                    CreateField (Arg3, 0x0E, 0x02, DFGC)
                    CreateField (Arg3, 0x10, 0x03, GPCX)
                    \_SB.PCI0.TGPC = Arg3
                    If (((ToInteger (GPPC) != Zero) || (ToInteger (DFGC
                        ) != Zero)))
                    {
                        \_SB.PCI0.TDGC = ToInteger (DFGC)
                        \_SB.PCI0.DGCX = ToInteger (GPCX)
                    }

                    Name (JTPC, Buffer (0x04)
                    {
                         0x00                                             // .
                    })
                    CreateField (JTPC, Zero, 0x03, GUPS)
                    CreateField (JTPC, 0x03, One, GPWO)
                    CreateField (JTPC, 0x07, One, PLST)
                    If ((ToInteger (DFGC) != Zero))
                    {
                        GPWO = One
                        GUPS = One
                        Return (JTPC) /* \_SB_.PCI0.GPP0.PEGP.NVJT.JTPC */
                    }

                    Debug = "   JT fun3 GPPC="
                    Debug = ToInteger (GPPC)
                    If ((ToInteger (GPPC) == One))
                    {
                        \_SB.PCI0.GC6I ()
                        PLST = One
                        GUPS = Zero
                    }
                    ElseIf ((ToInteger (GPPC) == 0x02))
                    {
                        \_SB.PCI0.GC6I ()
                        If ((ToInteger (PLPC) == Zero))
                        {
                            PLST = Zero
                        }

                        GUPS = Zero
                    }
                    ElseIf ((ToInteger (GPPC) == 0x03))
                    {
                        \_SB.PCI0.GC6O ()
                        If ((ToInteger (PLPC) != Zero))
                        {
                            PLST = Zero
                        }

                        GPWO = One
                        GUPS = One
                    }
                    ElseIf ((ToInteger (GPPC) == 0x04))
                    {
                        \_SB.PCI0.GC6O ()
                        If ((ToInteger (PLPC) != Zero))
                        {
                            PLST = Zero
                        }

                        GPWO = One
                        GUPS = One
                    }
                    ElseIf ((M009 (PWGD) == One))
                    {
                        Debug = "   JT GETS() return 0x1"
                        GPWO = One
                        GUPS = One
                    }
                    Else
                    {
                        Debug = "   JT GETS() return 0x3"
                        GPWO = Zero
                        GUPS = 0x03
                    }

                    Return (JTPC) /* \_SB_.PCI0.GPP0.PEGP.NVJT.JTPC */
                }
                Case (0x04)
                {
                    Debug = "   JT fun4 JT_FUNC_PLATPOLICY"
                    CreateField (Arg3, 0x02, One, PAUD)
                    CreateField (Arg3, 0x03, One, PADM)
                    CreateField (Arg3, 0x04, 0x04, PDGS)
                    Local0 = Zero
                    Local0 = (\_SB.PCI0.GPP0.PEGP.HDAE << 0x02)
                    Return (Local0)
                }

            }

            Return (0x80000002)
        }
    }

    Scope (\_SB)
    {
        Device (NPCF)
        {
            Name (ACBT, 0x50)
            Name (DCBT, 0x28)
            Name (DBAC, Zero)
            Name (DBDC, Zero)
            Name (AMAT, 0x78)
            Name (AMIT, 0xFF88)
            Name (ATPP, 0x01B8)
            Name (ATP2, 0x0208)
            Name (DTPP, 0xF0)
            Name (TPPL, Zero)
            Name (DROS, Zero)
            Name (HPCT, 0x02)
            Name (IOBS, Zero)
            Name (CMPL, 0x33)
            Name (CNPL, 0x10)
            Name (CDIS, Zero)
            Name (CUSL, Zero)
            Name (CUCT, Zero)
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                CDIS = Zero
                Return ("NVDA0820")
            }

            Name (_UID, "NPCF")  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((CDIS == One))
                {
                    Return (0x0D)
                }

                Return (0x0F)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                CDIS = One
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("36b49710-2483-11e7-9598-0800200c9a66") /* Unknown UUID */))
                {
                    Return (NPCF (Arg0, Arg1, Arg2, Arg3))
                }
            }

            Method (NPCF, 4, Serialized)
            {
                Debug = "------- NVPCF DSM --------"
                If ((ToInteger (Arg1) != 0x0200))
                {
                    Return (0x80000001)
                }

                Switch (ToInteger (Arg2))
                {
                    Case (Zero)
                    {
                        Debug = "   NVPCF sub-func#0"
                        Return (Buffer (0x04)
                        {
                             0x07, 0x03, 0x00, 0x00                           // ....
                        })
                    }
                    Case (One)
                    {
                        Debug = "   NVPCF sub-func#1"
                        Return (Buffer (0x0E)
                        {
                            /* 0000 */  0x20, 0x03, 0x01, 0x01, 0x23, 0x04, 0x05, 0x01,  //  ...#...
                            /* 0008 */  0x01, 0x01, 0x00, 0x00, 0x00, 0xAC               // ......
                        })
                    }
                    Case (0x02)
                    {
                        Debug = "   NVPCF sub-func#2"
                        Name (PBD2, Buffer (0x31)
                        {
                             0x00                                             // .
                        })
                        CreateByteField (PBD2, Zero, PTV2)
                        CreateByteField (PBD2, One, PHB2)
                        CreateByteField (PBD2, 0x02, GSB2)
                        CreateByteField (PBD2, 0x03, CTB2)
                        CreateByteField (PBD2, 0x04, NCE2)
                        PTV2 = 0x23
                        PHB2 = 0x05
                        GSB2 = 0x10
                        CTB2 = 0x1C
                        NCE2 = One
                        CreateWordField (PBD2, 0x05, TGPA)
                        CreateWordField (PBD2, 0x07, TGPD)
                        CreateByteField (PBD2, 0x15, PC01)
                        CreateByteField (PBD2, 0x16, PC02)
                        CreateWordField (PBD2, 0x19, TPPA)
                        CreateWordField (PBD2, 0x1B, TPPD)
                        CreateWordField (PBD2, 0x1D, MAGA)
                        CreateWordField (PBD2, 0x1F, MAGD)
                        CreateWordField (PBD2, 0x21, MIGA)
                        CreateWordField (PBD2, 0x23, MIGD)
                        CreateDWordField (PBD2, 0x25, DROP)
                        CreateDWordField (PBD2, 0x29, PA5O)
                        CreateDWordField (PBD2, 0x2D, PA6O)
                        CreateField (Arg3, 0x28, 0x02, NIGS)
                        CreateByteField (Arg3, 0x15, IORC)
                        CreateField (Arg3, 0xB0, One, PWCS)
                        CreateField (Arg3, 0xB1, One, PWTS)
                        CreateField (Arg3, 0xB2, One, CGPS)
                        If ((ToInteger (NIGS) == Zero))
                        {
                            If ((\_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.DGPU)) == One))
                            {
                                If ((\_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CPUT)) == 0x07))
                                {
                                    ATPP = 0x0168
                                }

                                If ((\_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.ITSM)) == One))
                                {
                                    DBAC = Zero
                                    TGPA = 0x0118
                                    MIGA = Zero
                                    MAGA = 0xC8
                                    TPPA = ATPP /* \_SB_.NPCF.ATPP */
                                }
                                ElseIf ((\_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.ITSM)) == Zero))
                                {
                                    DBAC = Zero
                                    TGPA = 0x78
                                    MIGA = Zero
                                    MAGA = 0xC8
                                    TPPA = ATPP /* \_SB_.NPCF.ATPP */
                                }
                                Else
                                {
                                    DBAC = One
                                    TPPA = 0x0168
                                }
                            }
                            Else
                            {
                                If ((\_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CPUT)) == 0x07))
                                {
                                    ATPP = 0x0168
                                    ATP2 = 0x0168
                                }

                                If ((\_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.ITSM)) == One))
                                {
                                    DBAC = Zero
                                    TGPA = 0x0118
                                    MIGA = Zero
                                    MAGA = 0xC8
                                    TPPA = ATP2 /* \_SB_.NPCF.ATP2 */
                                }
                                ElseIf ((\_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.ITSM)) == Zero))
                                {
                                    DBAC = Zero
                                    TGPA = 0x78
                                    MIGA = Zero
                                    MAGA = 0xC8
                                    TPPA = ATPP /* \_SB_.NPCF.ATPP */
                                }
                                Else
                                {
                                    DBAC = One
                                    TPPA = 0x0168
                                }
                            }

                            TGPD = DCBT /* \_SB_.NPCF.DCBT */
                            PC01 = Zero
                            PC02 = (DBAC | (DBDC << One))
                            TPPD = DTPP /* \_SB_.NPCF.DTPP */
                            DROP = DROS /* \_SB_.NPCF.DROS */
                        }

                        If ((ToInteger (NIGS) == One))
                        {
                            If ((ToInteger (PWCS) == One)){}
                            Else
                            {
                            }

                            If ((ToInteger (PWTS) == One)){}
                            Else
                            {
                            }

                            If ((ToInteger (CGPS) == One)){}
                            Else
                            {
                            }

                            TGPA = Zero
                            TGPD = Zero
                            PC01 = Zero
                            PC02 = Zero
                            TPPA = Zero
                            TPPD = Zero
                            MAGA = Zero
                            MIGA = Zero
                            MAGD = Zero
                            MIGD = Zero
                        }

                        Return (PBD2) /* \_SB_.NPCF.NPCF.PBD2 */
                    }
                    Case (0x03)
                    {
                        Debug = "   NVPCF sub-func#3"
                        Return (Buffer (0x3D)
                        {
                            /* 0000 */  0x11, 0x04, 0x13, 0x03, 0x00, 0xFF, 0x00, 0x28,  // .......(
                            /* 0008 */  0x2D, 0x2D, 0x33, 0x33, 0x39, 0x39, 0x3F, 0x3F,  // --3399??
                            /* 0010 */  0x45, 0x42, 0x4B, 0x46, 0x50, 0xFF, 0xFF, 0x05,  // EBKFP...
                            /* 0018 */  0xFF, 0x00, 0x3C, 0x41, 0x41, 0x46, 0x46, 0x4B,  // ..<AAFFK
                            /* 0020 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                            /* 0028 */  0xFF, 0xFF, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                            /* 0030 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                            /* 0038 */  0x00, 0x30, 0x34, 0x34, 0x3A                     // .044:
                        })
                    }
                    Case (0x04)
                    {
                        Debug = "   NVPCF sub-func#4"
                        Return (Buffer (0x32)
                        {
                            /* 0000 */  0x11, 0x04, 0x2E, 0x01, 0x05, 0x00, 0x01, 0x02,  // ........
                            /* 0008 */  0x03, 0x04, 0x03, 0x01, 0x02, 0x03, 0x00, 0x02,  // ........
                            /* 0010 */  0x03, 0x04, 0x00, 0x02, 0x03, 0x04, 0x00, 0x02,  // ........
                            /* 0018 */  0x03, 0x04, 0x00, 0x02, 0x03, 0x04, 0x00, 0x02,  // ........
                            /* 0020 */  0x03, 0x04, 0x01, 0x02, 0x03, 0x04, 0x02, 0x02,  // ........
                            /* 0028 */  0x03, 0x04, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04,  // ........
                            /* 0030 */  0x04, 0x04                                       // ..
                        })
                    }
                    Case (0x05)
                    {
                        Debug = "   NVPCF sub-func#5"
                        Name (PBD5, Buffer (0x28)
                        {
                             0x00                                             // .
                        })
                        CreateByteField (PBD5, Zero, PTV5)
                        CreateByteField (PBD5, One, PHB5)
                        CreateByteField (PBD5, 0x02, TEB5)
                        CreateByteField (PBD5, 0x03, NTE5)
                        PTV5 = 0x11
                        PHB5 = 0x04
                        TEB5 = 0x24
                        NTE5 = One
                        CreateDWordField (PBD5, 0x04, F5O0)
                        CreateDWordField (PBD5, 0x08, F5O1)
                        CreateDWordField (PBD5, 0x0C, F5O2)
                        CreateDWordField (PBD5, 0x10, F5O3)
                        CreateDWordField (PBD5, 0x14, F5O4)
                        CreateDWordField (PBD5, 0x18, F5O5)
                        CreateDWordField (PBD5, 0x1C, F5O6)
                        CreateDWordField (PBD5, 0x20, F5O7)
                        CreateDWordField (PBD5, 0x24, F5O8)
                        CreateField (Arg3, 0x20, 0x03, INC5)
                        CreateDWordField (Arg3, 0x08, F5P1)
                        CreateDWordField (Arg3, 0x0C, F5P2)
                        Switch (ToInteger (INC5))
                        {
                            Case (Zero)
                            {
                                F5O0 = One
                                F5O1 = Zero
                                F5O2 = Zero
                                F5O3 = Zero
                            }
                            Case (One)
                            {
                                F5O0 = Zero
                                F5O1 = Zero
                                F5O2 = Zero
                                F5O3 = Zero
                            }
                            Case (0x02)
                            {
                                F5O0 = Zero
                                F5O1 = Zero
                                F5O2 = Zero
                                F5O3 = Zero
                                F5O4 = Zero
                                F5O5 = Zero
                                F5O6 = Zero
                                F5O7 = Zero
                                F5O8 = Zero
                            }
                            Case (0x03)
                            {
                                CUSL = (F5P1 & 0xFF)
                            }
                            Case (0x04)
                            {
                                CUCT = F5P2 /* \_SB_.NPCF.NPCF.F5P2 */
                            }
                            Default
                            {
                                Return (0x80000002)
                            }

                        }

                        Return (PBD5) /* \_SB_.NPCF.NPCF.PBD5 */
                    }
                    Case (0x06)
                    {
                        Debug = "   NVPCF sub-func#6"
                        Name (PBD6, Buffer (0x11)
                        {
                             0x00                                             // .
                        })
                        CreateByteField (PBD6, Zero, CCHV)
                        CreateByteField (PBD6, One, CCHB)
                        CreateByteField (PBD6, 0x02, CCTB)
                        CreateByteField (PBD6, 0x03, RES0)
                        CreateByteField (PBD6, 0x04, RES1)
                        CCHV = 0x10
                        CCHB = 0x05
                        CCTB = 0x0C
                        CreateField (PBD6, 0x28, 0x02, F6O0)
                        CreateByteField (PBD6, 0x09, F6MP)
                        CreateByteField (PBD6, 0x0A, F6NP)
                        CreateDWordField (PBD6, 0x0D, F6O2)
                        CreateField (Arg3, 0x28, 0x02, INC6)
                        CreateByteField (Arg3, 0x09, NCHP)
                        Switch (ToInteger (INC6))
                        {
                            Case (Zero)
                            {
                                If ((IOBS != Zero))
                                {
                                    F6O0 = HPCT /* \_SB_.NPCF.HPCT */
                                    F6MP = CMPL /* \_SB_.NPCF.CMPL */
                                    F6NP = CNPL /* \_SB_.NPCF.CNPL */
                                    F6O2 = IOBS /* \_SB_.NPCF.IOBS */
                                }
                            }
                            Case (One)
                            {
                                If ((IOBS != Zero))
                                {
                                    OperationRegion (NVIO, SystemIO, IOBS, 0x10)
                                    Field (NVIO, ByteAcc, NoLock, Preserve)
                                    {
                                        CPUC,   8
                                    }

                                    CPUC = NCHP /* \_SB_.NPCF.NPCF.NCHP */
                                    F6MP = Zero
                                    F6NP = Zero
                                    F6O2 = Zero
                                    Notify (\_SB.PLTF.C000, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C001, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C002, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C003, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C004, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C005, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C006, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C007, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C008, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C009, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C00A, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C00B, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C00C, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C00D, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C00E, 0x85) // Device-Specific
                                    Notify (\_SB.PLTF.C00F, 0x85) // Device-Specific
                                }
                            }
                            Default
                            {
                                Return (0x80000002)
                            }

                        }

                        Return (PBD6) /* \_SB_.NPCF.NPCF.PBD6 */
                    }
                    Case (0x07)
                    {
                        Debug = "   NVPCF sub-func#7"
                        CreateDWordField (Arg3, 0x05, AMAX)
                        CreateDWordField (Arg3, 0x09, ARAT)
                        CreateDWordField (Arg3, 0x0D, DMAX)
                        CreateDWordField (Arg3, 0x11, DRAT)
                        CreateDWordField (Arg3, 0x15, TGPM)
                        Return (Zero)
                    }
                    Case (0x08)
                    {
                        Debug = "   NVPCF sub-func#8"
                        Return (Buffer (0x59)
                        {
                            /* 0000 */  0x10, 0x04, 0x11, 0x05, 0x64, 0x64, 0x19, 0x00,  // ....dd..
                            /* 0008 */  0x00, 0x30, 0x75, 0x00, 0x00, 0xB8, 0x88, 0x00,  // .0u.....
                            /* 0010 */  0x00, 0x10, 0xA4, 0x00, 0x00, 0x50, 0x70, 0x17,  // .....Pp.
                            /* 0018 */  0x00, 0x00, 0x60, 0x6D, 0x00, 0x00, 0xB8, 0x88,  // ..`m....
                            /* 0020 */  0x00, 0x00, 0x10, 0xA4, 0x00, 0x00, 0x3C, 0x88,  // ......<.
                            /* 0028 */  0x13, 0x00, 0x00, 0x90, 0x65, 0x00, 0x00, 0xB8,  // ....e...
                            /* 0030 */  0x88, 0x00, 0x00, 0x10, 0xA4, 0x00, 0x00, 0x28,  // .......(
                            /* 0038 */  0xCC, 0x10, 0x00, 0x00, 0x98, 0x3A, 0x00, 0x00,  // .....:..
                            /* 0040 */  0xB8, 0x88, 0x00, 0x00, 0x10, 0xA4, 0x00, 0x00,  // ........
                            /* 0048 */  0x14, 0x68, 0x10, 0x00, 0x00, 0xC8, 0x32, 0x00,  // .h....2.
                            /* 0050 */  0x00, 0xB8, 0x88, 0x00, 0x00, 0x10, 0xA4, 0x00,  // ........
                            /* 0058 */  0x00                                             // .
                        })
                    }
                    Case (0x09)
                    {
                        Debug = "   NVPCF sub-func#9"
                        CreateDWordField (Arg3, 0x03, CPTD)
                        Return (Zero)
                    }

                }

                Return (0x80000002)
            }
        }
    }
}

