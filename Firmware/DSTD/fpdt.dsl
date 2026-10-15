/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/fpdt.dat, Mon Oct  5 18:48:44 2026
 *
 * ACPI Data Table [FPDT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "FPDT"    [Firmware Performance Data Table]
[004h 0004   4]                 Table Length : 00000044
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 24
[00Ah 0010   6]                       Oem ID : "INSYDE"
[010h 0016   8]                 Oem Table ID : "EDK2    "
[018h 0024   4]                 Oem Revision : 00000002
[01Ch 0028   4]              Asl Compiler ID : "ACPI"
[020h 0032   4]        Asl Compiler Revision : 00040000


[024h 0036   2]                Subtable Type : 0000
[026h 0038   1]                       Length : 10
[027h 0039   1]                     Revision : 01
[028h 0040   4]                     Reserved : 00000000
[02Ch 0044   8]     FPDT Boot Record Address : 00000000C1300000

[034h 0052   2]                Subtable Type : 0001
[036h 0054   1]                       Length : 10
[037h 0055   1]                     Revision : 01
[038h 0056   4]                     Reserved : 00000000
[03Ch 0060   8]          S3PT Record Address : 00000000C12FF000

Raw Table Data: Length 68 (0x44)

    0000: 46 50 44 54 44 00 00 00 01 24 49 4E 53 59 44 45  // FPDTD....$INSYDE
    0010: 45 44 4B 32 20 20 20 20 02 00 00 00 41 43 50 49  // EDK2    ....ACPI
    0020: 00 00 04 00 00 00 10 01 00 00 00 00 00 00 30 C1  // ..............0.
    0030: 00 00 00 00 01 00 10 01 00 00 00 00 00 F0 2F C1  // ............../.
    0040: 00 00 00 00                                      // ....
