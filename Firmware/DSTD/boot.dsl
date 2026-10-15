/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/boot.dat, Mon Oct  5 18:48:44 2026
 *
 * ACPI Data Table [BOOT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "BOOT"    [Simple Boot Flag Table]
[004h 0004   4]                 Table Length : 00000028
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : EA
[00Ah 0010   6]                       Oem ID : "INSYDE"
[010h 0016   8]                 Oem Table ID : "EDK2    "
[018h 0024   4]                 Oem Revision : 00000002
[01Ch 0028   4]              Asl Compiler ID : "ACPI"
[020h 0032   4]        Asl Compiler Revision : 00040000

[024h 0036   1]          Boot Register Index : 44
[025h 0037   3]                     Reserved : 000000

Raw Table Data: Length 40 (0x28)

    0000: 42 4F 4F 54 28 00 00 00 01 EA 49 4E 53 59 44 45  // BOOT(.....INSYDE
    0010: 45 44 4B 32 20 20 20 20 02 00 00 00 41 43 50 49  // EDK2    ....ACPI
    0020: 00 00 04 00 44 00 00 00                          // ....D...
