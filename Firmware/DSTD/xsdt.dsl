/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/xsdt.dat, Mon Oct  5 18:48:45 2026
 *
 * ACPI Data Table [XSDT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000   4]                    Signature : "XSDT"    [Extended System Description Table]
[004h 0004   4]                 Table Length : 00000144
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : AA
[00Ah 0010   6]                       Oem ID : "INSYDE"
[010h 0016   8]                 Oem Table ID : "EDK2    "
[018h 0024   4]                 Oem Revision : 00000002
[01Ch 0028   4]              Asl Compiler ID : "    "
[020h 0032   4]        Asl Compiler Revision : 01000013

[024h 0036   8]       ACPI Table Address   0 : 00000000CAFEC000
[02Ch 0044   8]       ACPI Table Address   1 : 00000000CAF67000
[034h 0052   8]       ACPI Table Address   2 : 00000000CAFFB000
[03Ch 0060   8]       ACPI Table Address   3 : 00000000CAFFA000
[044h 0068   8]       ACPI Table Address   4 : 00000000CAFF2000
[04Ch 0076   8]       ACPI Table Address   5 : 00000000CAFF1000
[054h 0084   8]       ACPI Table Address   6 : 00000000CAFF0000
[05Ch 0092   8]       ACPI Table Address   7 : 00000000CAFEF000
[064h 0100   8]       ACPI Table Address   8 : 00000000CAFEE000
[06Ch 0108   8]       ACPI Table Address   9 : 00000000CAFED000
[074h 0116   8]       ACPI Table Address  10 : 00000000CAFEB000
[07Ch 0124   8]       ACPI Table Address  11 : 00000000CAFEA000
[084h 0132   8]       ACPI Table Address  12 : 00000000CAFE9000
[08Ch 0140   8]       ACPI Table Address  13 : 00000000CAFE8000
[094h 0148   8]       ACPI Table Address  14 : 00000000CAFE7000
[09Ch 0156   8]       ACPI Table Address  15 : 00000000CAFDE000
[0A4h 0164   8]       ACPI Table Address  16 : 00000000CAFDB000
[0ACh 0172   8]       ACPI Table Address  17 : 00000000CAFD8000
[0B4h 0180   8]       ACPI Table Address  18 : 00000000CAFCD000
[0BCh 0188   8]       ACPI Table Address  19 : 00000000CAFCC000
[0C4h 0196   8]       ACPI Table Address  20 : 00000000CAFC1000
[0CCh 0204   8]       ACPI Table Address  21 : 00000000CAFBF000
[0D4h 0212   8]       ACPI Table Address  22 : 00000000CAFFD000
[0DCh 0220   8]       ACPI Table Address  23 : 00000000CAFE4000
[0E4h 0228   8]       ACPI Table Address  24 : 00000000CAFE3000
[0ECh 0236   8]       ACPI Table Address  25 : 00000000CAFAC000
[0F4h 0244   8]       ACPI Table Address  26 : 00000000CAFE2000
[0FCh 0252   8]       ACPI Table Address  27 : 00000000CAFE1000
[104h 0260   8]       ACPI Table Address  28 : 00000000CAFE0000
[10Ch 0268   8]       ACPI Table Address  29 : 00000000CAFA9000
[114h 0276   8]       ACPI Table Address  30 : 00000000CAFA7000
[11Ch 0284   8]       ACPI Table Address  31 : 00000000CAFDF000
[124h 0292   8]       ACPI Table Address  32 : 00000000CAFA6000
[12Ch 0300   8]       ACPI Table Address  33 : 00000000CAFA5000
[134h 0308   8]       ACPI Table Address  34 : 00000000CAFA4000
[13Ch 0316   8]       ACPI Table Address  35 : 00000000CAFA2000

Raw Table Data: Length 324 (0x144)

    0000: 58 53 44 54 44 01 00 00 01 AA 49 4E 53 59 44 45  // XSDTD.....INSYDE
    0010: 45 44 4B 32 20 20 20 20 02 00 00 00 20 20 20 20  // EDK2    ....    
    0020: 13 00 00 01 00 C0 FE CA 00 00 00 00 00 70 F6 CA  // .............p..
    0030: 00 00 00 00 00 B0 FF CA 00 00 00 00 00 A0 FF CA  // ................
    0040: 00 00 00 00 00 20 FF CA 00 00 00 00 00 10 FF CA  // ..... ..........
    0050: 00 00 00 00 00 00 FF CA 00 00 00 00 00 F0 FE CA  // ................
    0060: 00 00 00 00 00 E0 FE CA 00 00 00 00 00 D0 FE CA  // ................
    0070: 00 00 00 00 00 B0 FE CA 00 00 00 00 00 A0 FE CA  // ................
    0080: 00 00 00 00 00 90 FE CA 00 00 00 00 00 80 FE CA  // ................
    0090: 00 00 00 00 00 70 FE CA 00 00 00 00 00 E0 FD CA  // .....p..........
    00A0: 00 00 00 00 00 B0 FD CA 00 00 00 00 00 80 FD CA  // ................
    00B0: 00 00 00 00 00 D0 FC CA 00 00 00 00 00 C0 FC CA  // ................
    00C0: 00 00 00 00 00 10 FC CA 00 00 00 00 00 F0 FB CA  // ................
    00D0: 00 00 00 00 00 D0 FF CA 00 00 00 00 00 40 FE CA  // .............@..
    00E0: 00 00 00 00 00 30 FE CA 00 00 00 00 00 C0 FA CA  // .....0..........
    00F0: 00 00 00 00 00 20 FE CA 00 00 00 00 00 10 FE CA  // ..... ..........
    0100: 00 00 00 00 00 00 FE CA 00 00 00 00 00 90 FA CA  // ................
    0110: 00 00 00 00 00 70 FA CA 00 00 00 00 00 F0 FD CA  // .....p..........
    0120: 00 00 00 00 00 60 FA CA 00 00 00 00 00 50 FA CA  // .....`.......P..
    0130: 00 00 00 00 00 40 FA CA 00 00 00 00 00 20 FA CA  // .....@....... ..
    0140: 00 00 00 00                                      // ....
