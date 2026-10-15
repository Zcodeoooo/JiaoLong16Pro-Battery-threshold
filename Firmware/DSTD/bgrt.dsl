/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/bgrt.dat, Mon Oct  5 18:48:44 2026
 *
 * ACPI Data Table [BGRT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "BGRT"    [Boot Graphics Resource Table]
[004h 0004   4]                 Table Length : 00000038
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 09
[00Ah 0010   6]                       Oem ID : "INSYDE"
[010h 0016   8]                 Oem Table ID : "EDK2    "
[018h 0024   4]                 Oem Revision : 00000002
[01Ch 0028   4]              Asl Compiler ID : "ACPI"
[020h 0032   4]        Asl Compiler Revision : 00040000

[024h 0036   2]                      Version : 0001
[026h 0038   1]       Status (decoded below) : 01
                                   Displayed : 1
                          Orientation Offset : 0
[027h 0039   1]                   Image Type : 00
[028h 0040   8]                Image Address : 00000000B999A018
[030h 0048   4]                Image OffsetX : 0000037F
[034h 0052   4]                Image OffsetY : 0000018B

Raw Table Data: Length 56 (0x38)

    0000: 42 47 52 54 38 00 00 00 01 09 49 4E 53 59 44 45  // BGRT8.....INSYDE
    0010: 45 44 4B 32 20 20 20 20 02 00 00 00 41 43 50 49  // EDK2    ....ACPI
    0020: 00 00 04 00 01 00 01 00 18 A0 99 B9 00 00 00 00  // ................
    0030: 7F 03 00 00 8B 01 00 00                          // ........
