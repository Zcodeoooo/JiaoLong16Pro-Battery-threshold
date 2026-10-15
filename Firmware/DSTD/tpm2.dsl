/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/tpm2.dat, Mon Oct  5 18:48:44 2026
 *
 * ACPI Data Table [TPM2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "TPM2"    [Trusted Platform Module hardware interface Table]
[004h 0004   4]                 Table Length : 00000034
[008h 0008   1]                     Revision : 04
[009h 0009   1]                     Checksum : FB
[00Ah 0010   6]                       Oem ID : "INSYDE"
[010h 0016   8]                 Oem Table ID : "EDK2    "
[018h 0024   4]                 Oem Revision : 00000002
[01Ch 0028   4]              Asl Compiler ID : "ACPI"
[020h 0032   4]        Asl Compiler Revision : 00040000

[024h 0036   2]               Platform Class : 0000
[026h 0038   2]                     Reserved : 0000
[028h 0040   8]              Control Address : 00000000FD210510
[030h 0048   4]                 Start Method : 02 [ACPI Start Method]

/**** ACPI table terminates in the middle of a data structure! (dump table) */

Raw Table Data: Length 52 (0x34)

    0000: 54 50 4D 32 34 00 00 00 04 FB 49 4E 53 59 44 45  // TPM24.....INSYDE
    0010: 45 44 4B 32 20 20 20 20 02 00 00 00 41 43 50 49  // EDK2    ....ACPI
    0020: 00 00 04 00 00 00 00 00 10 05 21 FD 00 00 00 00  // ..........!.....
    0030: 02 00 00 00                                      // ....
