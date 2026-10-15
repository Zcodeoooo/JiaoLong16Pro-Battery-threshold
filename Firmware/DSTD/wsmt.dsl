/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/wsmt.dat, Mon Oct  5 18:48:45 2026
 *
 * ACPI Data Table [WSMT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "WSMT"    [Windows SMM Security Mitigations Table]
[004h 0004   4]                 Table Length : 00000028
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 11
[00Ah 0010   6]                       Oem ID : "INSYDE"
[010h 0016   8]                 Oem Table ID : "EDK2    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "ACPI"
[020h 0032   4]        Asl Compiler Revision : 00040000

[024h 0036   4]             Protection Flags : 00000007
                          FIXED_COMM_BUFFERS : 1
           COMM_BUFFER_NESTED_PTR_PROTECTION : 1
                  SYSTEM_RESOURCE_PROTECTION : 1

Raw Table Data: Length 40 (0x28)

    0000: 57 53 4D 54 28 00 00 00 01 11 49 4E 53 59 44 45  // WSMT(.....INSYDE
    0010: 45 44 4B 32 20 20 20 20 01 00 00 00 41 43 50 49  // EDK2    ....ACPI
    0020: 00 00 04 00 07 00 00 00                          // ........
