/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/ssdt.dat, Mon Oct  5 18:48:44 2026
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000012FF (4863)
 *     Revision         0x01
 *     Checksum         0xA1
 *     OEM ID           "INSYDE"
 *     OEM Table ID     "EDK2    "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "INSYDE", "EDK2    ", 0x00000001)
{
    External (_SB_.PCI0.LPC0.H_EC, DeviceObj)
    External (_SB_.PCI0.LPC0.H_EC.ECRD, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC0.H_EC.ECWT, MethodObj)    // 2 Arguments

    Scope (\_SB.PCI0.LPC0.H_EC)
    {
        OperationRegion (USBD, SystemMemory, 0xFE800A80, 0x80)
        Field (USBD, ByteAcc, Lock, Preserve)
        {
            CCD1,   8, 
            CCD2,   8, 
            Offset (0x10), 
            CVE1,   8, 
            CVE2,   8, 
            CRS1,   8, 
            CRS2,   8, 
            MCI0,   8, 
            MCI1,   8, 
            MCI2,   8, 
            MCI3,   8, 
            MTL0,   8, 
            MTL1,   8, 
            MTL2,   8, 
            MTL3,   8, 
            MTL4,   8, 
            MTL5,   8, 
            MTL6,   8, 
            MTL7,   8, 
            CGI0,   8, 
            CGI1,   8, 
            CGI2,   8, 
            CGI3,   8, 
            CGI4,   8, 
            CGI5,   8, 
            CGI6,   8, 
            CGI7,   8, 
            CGI8,   8, 
            CGI9,   8, 
            CGIA,   8, 
            CGIB,   8, 
            CGIC,   8, 
            CGID,   8, 
            CGIE,   8, 
            CGIF,   8, 
            CGO0,   8, 
            CGO1,   8, 
            CGO2,   8, 
            CGO3,   8, 
            CGO4,   8, 
            CGO5,   8, 
            CGO6,   8, 
            CGO7,   8, 
            CGO8,   8, 
            CGO9,   8, 
            CGOA,   8, 
            CGOB,   8, 
            CGOC,   8, 
            CGOD,   8, 
            CGOE,   8, 
            CGOF,   8
        }

        Method (_Q79, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            \_SB.UBTC.NTFY ()
        }
    }

    Scope (\_SB)
    {
        Device (UBTC)
        {
            Name (_HID, EisaId ("USBC000"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0CA0"))  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_DDN, "USB Type C")  // _DDN: DOS Device Name
            Name (_ADR, Zero)  // _ADR: Address
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PCI0.LPC0.H_EC
            })
            OperationRegion (DBG0, SystemIO, 0x80, One)
            Field (DBG0, ByteAcc, NoLock, Preserve)
            {
                IO80,   8
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xCAF66000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.UBTC._CRS.RBUF */
            }

            Device (CR01)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0x09, 
                    Zero, 
                    Zero
                })
                Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                {
                    ToPLD (
                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x1,
                        PLD_Red                = 0x0,
                        PLD_Green              = 0x0,
                        PLD_Blue               = 0x0,
                        PLD_Width              = 0x0,
                        PLD_Height             = 0x0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "RIGHT",
                        PLD_VerticalPosition   = "CENTER",
                        PLD_HorizontalPosition = "CENTER",
                        PLD_Shape              = "OVAL",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x1,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x0,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x0,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0)

                })
            }

            OperationRegion (USBC, SystemMemory, 0xCAF66000, 0x30)
            Field (USBC, ByteAcc, Lock, Preserve)
            {
                VER1,   8, 
                VER2,   8, 
                RSV1,   8, 
                RSV2,   8, 
                CCI0,   8, 
                CCI1,   8, 
                CCI2,   8, 
                CCI3,   8, 
                CTL0,   8, 
                CTL1,   8, 
                CTL2,   8, 
                CTL3,   8, 
                CTL4,   8, 
                CTL5,   8, 
                CTL6,   8, 
                CTL7,   8, 
                MGI0,   8, 
                MGI1,   8, 
                MGI2,   8, 
                MGI3,   8, 
                MGI4,   8, 
                MGI5,   8, 
                MGI6,   8, 
                MGI7,   8, 
                MGI8,   8, 
                MGI9,   8, 
                MGIA,   8, 
                MGIB,   8, 
                MGIC,   8, 
                MGID,   8, 
                MGIE,   8, 
                MGIF,   8, 
                MGO0,   8, 
                MGO1,   8, 
                MGO2,   8, 
                MGO3,   8, 
                MGO4,   8, 
                MGO5,   8, 
                MGO6,   8, 
                MGO7,   8, 
                MGO8,   8, 
                MGO9,   8, 
                MGOA,   8, 
                MGOB,   8, 
                MGOC,   8, 
                MGOD,   8, 
                MGOE,   8, 
                MGOF,   8
            }

            Method (NTFY, 0, Serialized)
            {
                IO80 = 0x79
                Local0 = Timer
                ECR1 ()
                Local1 = ((Timer - Local0) / 0x2710)
                Notify (\_SB.UBTC, 0x80) // Status Change
            }

            Method (ECR1, 0, Serialized)
            {
                MGI0 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI0))
                MGI1 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI1))
                MGI2 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI2))
                MGI3 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI3))
                MGI4 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI4))
                MGI5 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI5))
                MGI6 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI6))
                MGI7 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI7))
                MGI8 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI8))
                MGI9 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI9))
                MGIA = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIA))
                MGIB = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIB))
                MGIC = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIC))
                MGID = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGID))
                MGIE = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIE))
                MGIF = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIF))
                VER1 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CVE1))
                VER2 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CVE2))
                RSV1 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CRS1))
                RSV2 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CRS2))
                CCI0 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.MCI0))
                CCI1 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.MCI1))
                CCI2 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.MCI2))
                CCI3 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.MCI3))
                \_SB.PCI0.LPC0.H_EC.ECWT (0xE1, RefOf (\_SB.PCI0.LPC0.H_EC.CCD2))
                Return (Zero)
            }

            Method (ECRD, 0, Serialized)
            {
                MGI0 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI0))
                MGI1 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI1))
                MGI2 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI2))
                MGI3 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI3))
                MGI4 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI4))
                MGI5 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI5))
                MGI6 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI6))
                MGI7 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI7))
                MGI8 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI8))
                MGI9 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGI9))
                MGIA = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIA))
                MGIB = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIB))
                MGIC = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIC))
                MGID = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGID))
                MGIE = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIE))
                MGIF = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CGIF))
                VER1 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CVE1))
                VER2 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CVE2))
                RSV1 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CRS1))
                RSV2 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.CRS2))
                CCI0 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.MCI0))
                CCI1 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.MCI1))
                CCI2 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.MCI2))
                CCI3 = \_SB.PCI0.LPC0.H_EC.ECRD (RefOf (\_SB.PCI0.LPC0.H_EC.MCI3))
                Return (Zero)
            }

            Method (ECWR, 0, Serialized)
            {
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO0, RefOf (\_SB.PCI0.LPC0.H_EC.CGO0))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO1, RefOf (\_SB.PCI0.LPC0.H_EC.CGO1))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO2, RefOf (\_SB.PCI0.LPC0.H_EC.CGO2))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO3, RefOf (\_SB.PCI0.LPC0.H_EC.CGO3))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO4, RefOf (\_SB.PCI0.LPC0.H_EC.CGO4))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO5, RefOf (\_SB.PCI0.LPC0.H_EC.CGO5))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO6, RefOf (\_SB.PCI0.LPC0.H_EC.CGO6))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO7, RefOf (\_SB.PCI0.LPC0.H_EC.CGO7))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO8, RefOf (\_SB.PCI0.LPC0.H_EC.CGO8))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGO9, RefOf (\_SB.PCI0.LPC0.H_EC.CGO9))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGOA, RefOf (\_SB.PCI0.LPC0.H_EC.CGOA))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGOB, RefOf (\_SB.PCI0.LPC0.H_EC.CGOB))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGOC, RefOf (\_SB.PCI0.LPC0.H_EC.CGOC))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGOD, RefOf (\_SB.PCI0.LPC0.H_EC.CGOD))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGOE, RefOf (\_SB.PCI0.LPC0.H_EC.CGOE))
                \_SB.PCI0.LPC0.H_EC.ECWT (MGOF, RefOf (\_SB.PCI0.LPC0.H_EC.CGOF))
                \_SB.PCI0.LPC0.H_EC.ECWT (CTL0, RefOf (\_SB.PCI0.LPC0.H_EC.MTL0))
                \_SB.PCI0.LPC0.H_EC.ECWT (CTL1, RefOf (\_SB.PCI0.LPC0.H_EC.MTL1))
                \_SB.PCI0.LPC0.H_EC.ECWT (CTL2, RefOf (\_SB.PCI0.LPC0.H_EC.MTL2))
                \_SB.PCI0.LPC0.H_EC.ECWT (CTL3, RefOf (\_SB.PCI0.LPC0.H_EC.MTL3))
                \_SB.PCI0.LPC0.H_EC.ECWT (CTL4, RefOf (\_SB.PCI0.LPC0.H_EC.MTL4))
                \_SB.PCI0.LPC0.H_EC.ECWT (CTL5, RefOf (\_SB.PCI0.LPC0.H_EC.MTL5))
                \_SB.PCI0.LPC0.H_EC.ECWT (CTL6, RefOf (\_SB.PCI0.LPC0.H_EC.MTL6))
                \_SB.PCI0.LPC0.H_EC.ECWT (0xE0, RefOf (\_SB.PCI0.LPC0.H_EC.CCD1))
                Return (Zero)
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
                {
                    If ((ToInteger (Arg2) == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x0F                                             // .
                        })
                    }
                    ElseIf ((ToInteger (Arg2) == One))
                    {
                        IO80 = 0xA0
                        ECWR ()
                        IO80 = 0xA1
                    }
                    ElseIf ((ToInteger (Arg2) == 0x02))
                    {
                        IO80 = 0xA2
                        ECRD ()
                        IO80 = 0xA3
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Return (Zero)
            }
        }
    }
}

