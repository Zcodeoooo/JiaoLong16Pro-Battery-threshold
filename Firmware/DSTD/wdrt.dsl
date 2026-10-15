/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/wdrt.dat, Mon Oct  5 18:48:45 2026
 *
 * ACPI Data Table [WDRT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "WDRT"    [Watchdog Resource Table]
[004h 0004   4]                 Table Length : 00000047
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 5E
[00Ah 0010   6]                       Oem ID : "INSYDE"
[010h 0016   8]                 Oem Table ID : "EDK2    "
[018h 0024   4]                 Oem Revision : 00000002
[01Ch 0028   4]              Asl Compiler ID : "ACPI"
[020h 0032   4]        Asl Compiler Revision : 00040000


[024h 0036  12]             Control Register : [Generic Address Structure]
[024h 0036   1]                     Space ID : 00 [SystemMemory]
[025h 0037   1]                    Bit Width : 20
[026h 0038   1]                   Bit Offset : 00
[027h 0039   1]         Encoded Access Width : 03 [DWord Access:32]
[028h 0040   8]                      Address : 00000000FEB00000

[030h 0048  12]               Count Register : [Generic Address Structure]
[030h 0048   1]                     Space ID : 00 [SystemMemory]
[031h 0049   1]                    Bit Width : 20
[032h 0050   1]                   Bit Offset : 00
[033h 0051   1]         Encoded Access Width : 03 [DWord Access:32]
[034h 0052   8]                      Address : 00000000FEB00004

[03Ch 0060   2]                PCI Device ID : FFFF
[03Eh 0062   2]                PCI Vendor ID : FFFF
[040h 0064   1]                      PCI Bus : 00
[041h 0065   1]                   PCI Device : 00
[042h 0066   1]                 PCI Function : 00
[043h 0067   1]                  PCI Segment : 00
[044h 0068   2]                    Max Count : 03FF
[046h 0070   1]                Counter Units : 00

Raw Table Data: Length 71 (0x47)

    0000: 57 44 52 54 47 00 00 00 01 5E 49 4E 53 59 44 45  // WDRTG....^INSYDE
    0010: 45 44 4B 32 20 20 20 20 02 00 00 00 41 43 50 49  // EDK2    ....ACPI
    0020: 00 00 04 00 00 20 00 03 00 00 B0 FE 00 00 00 00  // ..... ..........
    0030: 00 20 00 03 04 00 B0 FE 00 00 00 00 FF FF FF FF  // . ..............
    0040: 00 00 00 00 FF 03 00                             // .......
