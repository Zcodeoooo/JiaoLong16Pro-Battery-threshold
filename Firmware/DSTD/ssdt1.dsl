/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of C:/Users/48069/Xiasl/ACPI Tables/ssdt1.dat, Mon Oct  5 18:48:44 2026
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00007F51 (32593)
 *     Revision         0x02
 *     Checksum         0xF6
 *     OEM ID           "INSYDE"
 *     OEM Table ID     "EDK2    "
 *     OEM Revision     0x00000002 (2)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 2, "INSYDE", "EDK2    ", 0x00000002)
{
    Scope (\_SB)
    {
        Name (AGRB, 0xF0000000)
        Name (ADBG, Buffer (0x0100){})
        Mutex (AM00, 0x00)
        Name (ADAT, Buffer (0x0520)
        {
            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0020 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x07,  // ........
            /* 0028 */  0x00, 0xFF, 0xFF, 0x00, 0x03, 0x01, 0x01, 0x00,  // ........
            /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01,  // ........
            /* 0038 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0040 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0048 */  0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00,  // ........
            /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01,  // ........
            /* 0060 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0070 */  0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x13,  // ........
            /* 0078 */  0x10, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x01, 0x00,  // ........
            /* 0080 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01,  // ........
            /* 0088 */  0x00, 0x00, 0x01, 0x14, 0x17, 0xFF, 0xFF, 0x01,  // ........
            /* 0090 */  0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0098 */  0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00,  // ........
            /* 00A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00A8 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01,  // ........
            /* 00B0 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00C0 */  0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x1A,  // ........
            /* 00C8 */  0x1A, 0xFF, 0xFF, 0x04, 0x00, 0x02, 0x02, 0x00,  // ........
            /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
            /* 00D8 */  0x00, 0x00, 0x00, 0x1B, 0x1B, 0xFF, 0xFF, 0x05,  // ........
            /* 00E0 */  0x00, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00E8 */  0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00,  // ........
            /* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00F8 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01,  // ........
            /* 0100 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0108 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0110 */  0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00,  // ........
            /* 0118 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0120 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0128 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0130 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0138 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0140 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0148 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0150 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0158 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0160 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0168 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0170 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0178 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0180 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0188 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0190 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0198 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0200 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0208 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0210 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0218 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0220 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0228 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0230 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0238 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0240 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0248 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0250 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0258 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0260 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0268 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0270 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0278 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0280 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0288 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0290 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0298 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 02F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0300 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0308 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0310 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0318 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0320 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0328 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0330 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0338 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0340 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0348 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0350 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0358 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0360 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0368 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0370 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0378 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0380 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0388 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0390 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0398 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 03F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0400 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0408 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0410 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0418 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0420 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0428 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0430 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0438 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0440 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0448 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0450 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0458 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0460 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0468 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0470 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0478 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0480 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0488 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0490 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0498 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 04F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0500 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0508 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0510 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0518 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
        })
        OperationRegion (A001, SystemIO, 0x80, 0x04)
        Field (A001, DWordAcc, NoLock, Preserve)
        {
            A002,   32
        }

        OperationRegion (A003, SystemIO, 0x80, 0x02)
        Field (A003, WordAcc, NoLock, Preserve)
        {
            A004,   16
        }

        OperationRegion (A005, SystemIO, 0x80, One)
        Field (A005, ByteAcc, NoLock, Preserve)
        {
            A006,   8
        }

        Method (A007, 1, NotSerialized)
        {
            A002 = (Arg0 | 0xB0000000)
        }

        Method (ALIB, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                A007 (0xAA80)
                CreateWordField (Arg1, Zero, A020)
                CreateWordField (Arg1, 0x02, A021)
                CreateDWordField (Arg1, 0x04, A022)
                Local0 = Buffer (0x0100){}
                CreateWordField (Local0, Zero, A023)
                A023 = A020 /* \_SB_.ALIB.A020 */
                CreateWordField (Local0, 0x02, A024)
                A024 = A021 /* \_SB_.ALIB.A021 */
                CreateDWordField (Local0, 0x04, A025)
                A025 = A022 /* \_SB_.ALIB.A022 */
                A025 &= ~0x0F
                If ((DerefOf (\_SB.ADAT [Zero]) > Zero))
                {
                    Local1 = 0x0F
                }
                Else
                {
                    Local1 = One
                }

                A025 |= Local1
                A007 (0xAA81)
                Return (Local0)
            }

            If ((Arg0 == One))
            {
                A007 (0xAA82)
                Local0 = DerefOf (Arg1 [0x02])
                Local1 = A026 (Local0)
                A007 (0xAA83)
                Return (Local1)
            }

            If ((Arg0 == 0x02))
            {
                A007 (0xAA84)
                Local0 = Buffer (0x0100)
                    {
                         0x03, 0x00, 0x00                                 // ...
                    }
                A007 (0xAA85)
                Return (Local0)
            }

            If ((Arg0 == 0x03))
            {
                A007 (0xAA86)
                Local0 = Buffer (0x0100)
                    {
                         0x03, 0x00, 0x00                                 // ...
                    }
                A007 (0xAA87)
                Return (Local0)
            }

            If ((Arg0 == 0x06))
            {
                A007 (0xAA88)
                Local0 = DerefOf (Arg1 [0x04])
                Local1 = DerefOf (Arg1 [0x02])
                Local2 = A029 (Local0, Local1)
                A007 (0xAA89)
                Return (Local2)
            }

            If ((Arg0 == 0x0A))
            {
                A007 (0xAA8A)
                Local0 = DerefOf (Arg1 [0x02])
                Local1 = A030 (Local0)
                A007 (0xAA8B)
                Return (Local1)
            }

            If ((Arg0 == 0x0B))
            {
                A007 (0xAA8C)
                Local0 = DerefOf (Arg1 [0x02])
                Local1 = DerefOf (Arg1 [0x03])
                Local2 = DerefOf (Arg1 [0x04])
                Local2 |= (DerefOf (Arg1 [0x05]) << 0x08)
                Local2 |= (DerefOf (Arg1 [0x06]) << 0x10)
                Local2 |= (DerefOf (Arg1 [0x07]) << 0x18)
                Local3 = DerefOf (Arg1 [0x08])
                Local3 |= (DerefOf (Arg1 [0x09]) << 0x08)
                Local3 |= (DerefOf (Arg1 [0x0A]) << 0x10)
                Local3 |= (DerefOf (Arg1 [0x0B]) << 0x18)
                Local4 = DerefOf (Arg1 [0x0C])
                Local4 |= (DerefOf (Arg1 [0x0D]) << 0x08)
                Local4 |= (DerefOf (Arg1 [0x0E]) << 0x10)
                Local4 |= (DerefOf (Arg1 [0x0F]) << 0x18)
                Local5 = A031 (Local0, Local1, Local2, Local3, Local4)
                A007 (0xAA8D)
                Return (Local5)
            }

            If ((Arg0 == 0x0C))
            {
                A007 (0xAA8E)
                Local0 = A032 (Arg1)
                A007 (0xAA8F)
                Return (Local0)
            }

            If ((Arg0 == 0x10))
            {
                A007 (0xAA90)
                Local7 = Buffer (0x18){}
                CreateDWordField (Local7, Zero, A033)
                CreateDWordField (Local7, 0x04, A034)
                CreateDWordField (Local7, 0x08, A035)
                CreateDWordField (Local7, 0x0C, A036)
                CreateDWordField (Local7, 0x10, A037)
                CreateDWordField (Local7, 0x14, A038)
                A033 = Zero
                A034 = Zero
                A035 = Zero
                A036 = Zero
                A037 = Zero
                A038 = Zero
                A018 (0x67, Local7)
                A007 (0xAA91)
            }

            If ((Arg0 == 0x11))
            {
                A007 (0xAA92)
                Local6 = Buffer (0x18){}
                CreateDWordField (Local6, Zero, A012)
                CreateDWordField (Local6, 0x04, A013)
                CreateDWordField (Local6, 0x08, A014)
                CreateDWordField (Local6, 0x0C, A015)
                CreateDWordField (Local6, 0x10, A016)
                CreateDWordField (Local6, 0x14, A017)
                A012 = Zero
                A013 = Zero
                A014 = Zero
                A015 = Zero
                A016 = Zero
                A017 = Zero
                A018 (0x66, Local6)
                A007 (0xAA93)
            }

            If ((Arg0 == 0x12))
            {
                A007 (0xAA94)
                Local6 = Buffer (0x18){}
                CreateDWordField (Local6, Zero, A039)
                CreateDWordField (Local6, 0x04, A040)
                CreateDWordField (Local6, 0x08, A041)
                CreateDWordField (Local6, 0x0C, A042)
                CreateDWordField (Local6, 0x10, A043)
                CreateDWordField (Local6, 0x14, A044)
                A039 = Zero
                A040 = Zero
                A041 = Zero
                A042 = Zero
                A043 = Zero
                A044 = Zero
                Local5 = A045 (Arg1)
                If ((0xFF != Local5))
                {
                    A039 = Local5
                    A040 = 0x02
                    A046 (0x24, Local6)
                }

                A007 (0xAA95)
            }

            If ((Arg0 == 0x13))
            {
                A007 (0xAA96)
                Local6 = Buffer (0x18){}
                CreateDWordField (Local6, Zero, A047)
                CreateDWordField (Local6, 0x04, A048)
                CreateDWordField (Local6, 0x08, A049)
                CreateDWordField (Local6, 0x0C, A050)
                CreateDWordField (Local6, 0x10, A051)
                CreateDWordField (Local6, 0x14, A052)
                A047 = Zero
                A048 = Zero
                A049 = Zero
                A050 = Zero
                A051 = Zero
                A052 = Zero
                Local5 = A045 (Arg1)
                If ((0xFF != Local5))
                {
                    A047 = Local5
                    A048 = One
                    A046 (0x24, Local6)
                }

                A007 (0xAA97)
            }

            If ((Arg0 == 0x16))
            {
                Local6 = Buffer (0x18){}
                CreateDWordField (Local6, Zero, A053)
                CreateDWordField (Local6, 0x04, A054)
                CreateDWordField (Local6, 0x08, A055)
                CreateDWordField (Local6, 0x0C, A056)
                CreateDWordField (Local6, 0x10, A057)
                CreateDWordField (Local6, 0x14, A058)
                A053 = Arg1
                A054 = Zero
                A055 = Zero
                A056 = Zero
                A057 = Zero
                A058 = Zero
                A018 (0x6F, Local6)
            }

            If ((Arg0 == 0xAA))
            {
                A007 (0xAA98)
                Local6 = Buffer (0x18){}
                CreateDWordField (Local6, Zero, A059)
                CreateDWordField (Local6, 0x04, A060)
                CreateDWordField (Local6, 0x08, A061)
                CreateDWordField (Local6, 0x0C, A062)
                CreateDWordField (Local6, 0x10, A063)
                CreateDWordField (Local6, 0x14, A064)
                A059 = Zero
                A060 = Zero
                A061 = Zero
                A062 = Zero
                A063 = Zero
                A064 = Zero
                A065 (Arg1)
                A007 (0xAA99)
            }

            Return (Zero)
        }

        Method (A029, 2, NotSerialized)
        {
            Local0 = Zero
            While ((Local0 < 0x0B))
            {
                Local1 = A116 (Local0, Arg1)
                If ((Local1 == One))
                {
                    Local2 = A117 (Local0, Arg0)
                    Break
                }

                Local0++
            }

            Local7 = Buffer (0x0A){}
            CreateWordField (Local7, Zero, A023)
            CreateByteField (Local7, 0x02, A067)
            CreateByteField (Local7, 0x03, A118)
            A023 = 0x04
            A067 = Zero
            If ((Local2 == Zero))
            {
                A118 = Zero
            }
            Else
            {
                A118 = One
            }

            Return (Local7)
        }

        Method (A116, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A112 (Arg1))
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A112 (Arg1))
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A112 (Arg1))
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A112 (Arg1))
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A112 (Arg1))
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A112 (Arg1))
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A112 (Arg1))
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A112 (Arg1))
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A112 (Arg1))
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A112 (Arg1))
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A112 (Arg1))
            }
        }

        Method (A117, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A113 (Arg1))
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A113 (Arg1))
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A113 (Arg1))
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A113 (Arg1))
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A113 (Arg1))
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A113 (Arg1))
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A113 (Arg1))
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A113 (Arg1))
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A113 (Arg1))
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A113 (Arg1))
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A113 (Arg1))
            }
        }

        Name (AD00, Zero)
        Name (DK00, Zero)
        Method (A026, 1, NotSerialized)
        {
            AD00 = Arg0
            A011 ()
        }

        Method (A030, 1, NotSerialized)
        {
            DK00 = Arg0
        }

        Method (A031, 5, NotSerialized)
        {
        }

        Name (AP01, Zero)
        Name (AP02, Zero)
        Name (AP03, Zero)
        Name (AP05, Zero)
        Name (AP0B, 0xFF)
        Name (AP10, Zero)
        Method (A066, 1, NotSerialized)
        {
            Local7 = Buffer (0x0100){}
            CreateWordField (Local7, Zero, A023)
            A023 = 0x03
            CreateByteField (Local7, 0x02, A067)
            A067 = One
            If ((DerefOf (\_SB.ADAT [Zero]) == One))
            {
                A067 = 0x02
                Return (Local7)
            }

            If ((DerefOf (\_SB.ADAT [Zero]) == Zero))
            {
                A067 = One
                Return (Local7)
            }

            A068 (Arg0)
            If ((AP05 != One))
            {
                Return (Local7)
            }

            A069 ()
            A067 = 0x02
            Return (Local7)
        }

        Method (A070, 0, NotSerialized)
        {
            If ((DerefOf (\_SB.ADAT [Zero]) <= One))
            {
                Return (Zero)
            }

            If ((AP05 != One))
            {
                Return (Zero)
            }

            A069 ()
        }

        Method (A071, 1, NotSerialized)
        {
            If ((Arg0 == 0x03))
            {
                AP01 = Zero
            }
        }

        Method (A072, 1, NotSerialized)
        {
            AP10 = One
        }

        Method (A073, 1, NotSerialized)
        {
            AP05 = Arg0
            If ((DerefOf (\_SB.ADAT [Zero]) <= One))
            {
                Return (Zero)
            }

            Local1 = AP0B /* \_SB_.AP0B */
            If ((AP05 == Zero))
            {
                Local0 = Zero
                While ((Local0 < 0x0B))
                {
                    A074 (Local0)
                    Local0++
                }

                AP0B = Zero
            }

            A069 ()
            AP0B = Local1
            Local7 = Buffer (0x0100){}
            Local7 [Zero] = 0x03
            Local7 [One] = Zero
            Local7 [0x02] = Zero
            Return (Local7)
        }

        Method (A075, 0, NotSerialized)
        {
            If ((AP0B != 0xFF))
            {
                Return (AP0B) /* \_SB_.AP0B */
            }

            Return (AD00) /* \_SB_.AD00 */
        }

        Method (A068, 1, NotSerialized)
        {
            CreateWordField (Arg0, 0x02, AP06)
            CreateWordField (Arg0, 0x04, AP07)
            CreateWordField (Arg0, 0x06, AP08)
            CreateByteField (Arg0, 0x08, AP09)
            CreateByteField (Arg0, 0x09, AP0A)
            Local0 = Zero
            While ((Local0 < 0x0B))
            {
                If ((A076 (Local0, AP06) == One))
                {
                    If (((AP07 & AP08) == One))
                    {
                        Local1 = A077 (Local0)
                        A078 (Local0, Local1)
                    }
                    Else
                    {
                        A078 (Local0, AP0A)
                    }

                    Break
                }

                Local0++
            }
        }

        Method (A079, 0, NotSerialized)
        {
            AP02 = One
            Local0 = Zero
            While ((Local0 < 0x0B))
            {
                Local1 = A080 (Local0)
                If ((Local1 > AP02))
                {
                    AP02 = Local1
                }

                Local0++
            }
        }

        Method (A081, 0, NotSerialized)
        {
            AP03 = Zero
            Local0 = Zero
            While ((Local0 < 0x0B))
            {
                Local1 = A082 (Local0)
                If ((Local1 > AP03))
                {
                    AP03 = Local1
                }

                Local0++
            }
        }

        Method (A069, 0, NotSerialized)
        {
            A081 ()
            A079 ()
            If ((AP02 != AP01))
            {
                A019 (AP02, AP01)
            }

            If ((AP02 > AP01))
            {
                AP01 = AP02 /* \_SB_.AP02 */
            }

            Local0 = Zero
            While ((Local0 < 0x0B))
            {
                Local1 = A080 (Local0)
                Local2 = A083 (Local0)
                If ((Local1 != Local2))
                {
                    A084 (Local0, Local1)
                }
                ElseIf ((AP10 == One))
                {
                    A084 (Local0, Local1)
                }

                Local0++
            }

            If ((AP02 < AP01))
            {
                AP01 = AP02 /* \_SB_.AP02 */
            }
            ElseIf ((AP10 == One))
            {
                AP01 = AP02 /* \_SB_.AP02 */
            }

            AP10 = Zero
        }

        Method (A084, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A085 (Arg1))
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A085 (Arg1))
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A085 (Arg1))
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A085 (Arg1))
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A085 (Arg1))
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A085 (Arg1))
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A085 (Arg1))
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A085 (Arg1))
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A085 (Arg1))
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A085 (Arg1))
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A085 (Arg1))
            }
        }

        Method (A083, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A086 ())
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A086 ())
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A086 ())
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A086 ())
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A086 ())
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A086 ())
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A086 ())
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A086 ())
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A086 ())
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A086 ())
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A086 ())
            }
        }

        Method (A080, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A087 ())
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A087 ())
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A087 ())
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A087 ())
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A087 ())
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A087 ())
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A087 ())
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A087 ())
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A087 ())
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A087 ())
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A087 ())
            }
        }

        Method (A082, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A088 ())
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A088 ())
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A088 ())
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A088 ())
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A088 ())
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A088 ())
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A088 ())
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A088 ())
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A088 ())
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A088 ())
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A088 ())
            }
        }

        Method (A077, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A089 ())
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A089 ())
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A089 ())
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A089 ())
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A089 ())
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A089 ())
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A089 ())
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A089 ())
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A089 ())
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A089 ())
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A089 ())
            }
        }

        Method (A078, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A090 (Arg1))
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A090 (Arg1))
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A090 (Arg1))
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A090 (Arg1))
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A090 (Arg1))
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A090 (Arg1))
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A090 (Arg1))
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A090 (Arg1))
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A090 (Arg1))
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A090 (Arg1))
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A090 (Arg1))
            }
        }

        Method (A076, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A091 (Arg1))
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A091 (Arg1))
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A091 (Arg1))
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A091 (Arg1))
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A091 (Arg1))
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A091 (Arg1))
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A091 (Arg1))
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A091 (Arg1))
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A091 (Arg1))
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A091 (Arg1))
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A091 (Arg1))
            }
        }

        Method (A074, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A092 ())
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A092 ())
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A092 ())
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A092 ())
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A092 ())
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A092 ())
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A092 ())
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A092 ())
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A092 ())
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A092 ())
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A092 ())
            }
        }

        OperationRegion (A161, SystemMemory, AGRB, 0x1000)
        Field (A161, DWordAcc, Lock, Preserve)
        {
            Offset (0xA0), 
            A162,   32
        }

        BankField (A161, A162, 0x03B10530, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A146,   32
        }

        BankField (A161, A162, 0x03B1057C, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A139,   32
        }

        BankField (A161, A162, 0x03B109C4, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A140,   32
        }

        BankField (A161, A162, 0x03B109C8, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A141,   32
        }

        BankField (A161, A162, 0x03B109CC, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A142,   32
        }

        BankField (A161, A162, 0x03B109D0, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A143,   32
        }

        BankField (A161, A162, 0x03B109D4, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A144,   32
        }

        BankField (A161, A162, 0x03B109D8, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A145,   32
        }

        BankField (A161, A162, 0x13B00084, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A121,   32
        }

        BankField (A161, A162, 0x11140280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A122,   32
        }

        BankField (A161, A162, 0x11141280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A123,   32
        }

        BankField (A161, A162, 0x11142280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A124,   32
        }

        BankField (A161, A162, 0x11143280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A125,   32
        }

        BankField (A161, A162, 0x11240280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A126,   32
        }

        BankField (A161, A162, 0x11241280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A127,   32
        }

        BankField (A161, A162, 0x11242280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A128,   32
        }

        BankField (A161, A162, 0x11143280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A129,   32
        }

        BankField (A161, A162, 0x11144280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A130,   32
        }

        BankField (A161, A162, 0x11145280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A131,   32
        }

        BankField (A161, A162, 0x11146280, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A132,   32
        }

        BankField (A161, A162, 0x0C910554, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A160,   32
        }

        BankField (A161, A162, 0x0C9109C8, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A153,   32
        }

        BankField (A161, A162, 0x0C9109CC, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A154,   32
        }

        BankField (A161, A162, 0x0C9109D0, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A155,   32
        }

        BankField (A161, A162, 0x0C9109D4, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A156,   32
        }

        BankField (A161, A162, 0x0C9109D8, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A157,   32
        }

        BankField (A161, A162, 0x0C9109DC, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A158,   32
        }

        BankField (A161, A162, 0x0C9109E0, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A159,   32
        }

        BankField (A161, A162, 0x11140294, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A168,   32
        }

        BankField (A161, A162, 0x11141294, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A169,   32
        }

        BankField (A161, A162, 0x11142294, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A170,   32
        }

        BankField (A161, A162, 0x11143294, DWordAcc, Lock, Preserve)
        {
            Offset (0xA4), 
            A171,   32
        }

        Method (A119, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A100 (Arg1))
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A100 (Arg1))
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A100 (Arg1))
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A100 (Arg1))
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A100 (Arg1))
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A100 (Arg1))
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A100 (Arg1))
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A100 (Arg1))
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A100 (Arg1))
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A100 (Arg1))
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A100 (Arg1))
            }
        }

        Method (A120, 2, NotSerialized)
        {
            Acquire (\_SB.AM00, 0xFFFF)
            If ((Arg1 == One))
            {
                If ((Arg0 == Zero))
                {
                    Local0 = 0x00190300
                }

                If ((Arg0 == One))
                {
                    Local0 = 0x001A0300
                }

                If ((Arg0 == 0x02))
                {
                    Local0 = 0x001B0300
                }

                If ((Arg0 == 0x03))
                {
                    Local0 = 0x001C0300
                }

                If ((Arg0 == 0x04))
                {
                    Local0 = 0x001D0300
                }

                If ((Arg0 == 0x05))
                {
                    Local0 = 0x001E0300
                }

                If ((Arg0 == 0x06))
                {
                    Local0 = 0x001F0300
                }

                If ((Arg0 == 0x07))
                {
                    Local0 = 0x00090300
                }

                If ((Arg0 == 0x08))
                {
                    Local0 = 0x000A0300
                }

                If ((Arg0 == 0x09))
                {
                    Local0 = 0x000B0300
                }

                If ((Arg0 == 0x0A))
                {
                    Local0 = 0x000C0300
                }

                Local1 = A121 /* \_SB_.A121 */
                Local1 &= 0xFF00FCFF
                A121 = (Local0 | Local1)
                Local1 = A121 /* \_SB_.A121 */
                A121 = (0xFFFFFDFF & Local1)
            }
            ElseIf ((Arg1 == Zero))
            {
                If ((Arg0 == Zero))
                {
                    Local1 = A122 /* \_SB_.A122 */
                    A122 = (0x00400000 | Local1)
                    Local1 = A122 /* \_SB_.A122 */
                    A122 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == One))
                {
                    Local1 = A123 /* \_SB_.A123 */
                    A123 = (0x00400000 | Local1)
                    Local1 = A123 /* \_SB_.A123 */
                    A123 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == 0x02))
                {
                    Local1 = A124 /* \_SB_.A124 */
                    A124 = (0x00400000 | Local1)
                    Local1 = A124 /* \_SB_.A124 */
                    A124 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == 0x03))
                {
                    Local1 = A125 /* \_SB_.A125 */
                    A125 = (0x00400000 | Local1)
                    Local1 = A125 /* \_SB_.A125 */
                    A125 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == 0x04))
                {
                    Local1 = A126 /* \_SB_.A126 */
                    A126 = (0x00400000 | Local1)
                    Local1 = A126 /* \_SB_.A126 */
                    A126 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == 0x05))
                {
                    Local1 = A127 /* \_SB_.A127 */
                    A127 = (0x00400000 | Local1)
                    Local1 = A127 /* \_SB_.A127 */
                    A127 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == 0x06))
                {
                    Local1 = A128 /* \_SB_.A128 */
                    A128 = (0x00400000 | Local1)
                    Local1 = A128 /* \_SB_.A128 */
                    A128 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == 0x07))
                {
                    Local1 = A129 /* \_SB_.A129 */
                    A129 = (0x00400000 | Local1)
                    Local1 = A129 /* \_SB_.A129 */
                    A129 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == 0x08))
                {
                    Local1 = A130 /* \_SB_.A130 */
                    A130 = (0x00400000 | Local1)
                    Local1 = A130 /* \_SB_.A130 */
                    A130 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == 0x09))
                {
                    Local1 = A131 /* \_SB_.A131 */
                    A131 = (0x00400000 | Local1)
                    Local1 = A131 /* \_SB_.A131 */
                    A131 = (0xFFBFFFFF & Local1)
                }

                If ((Arg0 == 0x0A))
                {
                    Local1 = A132 /* \_SB_.A132 */
                    A132 = (0x00400000 | Local1)
                    Local1 = A132 /* \_SB_.A132 */
                    A132 = (0xFFBFFFFF & Local1)
                }
            }

            Release (\_SB.AM00)
        }

        Method (A010, 2, NotSerialized)
        {
            Local0 = Zero
            While ((Local0 < 0x0B))
            {
                Local1 = A119 (Local0, Arg1)
                If ((Local1 == One))
                {
                    A120 (Local0, Arg1)
                    Break
                }

                Local0++
            }
        }

        Method (A045, 1, NotSerialized)
        {
            Local0 = 0xFF
            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR0.ABR0.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR0.ABR1.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR0.ABR2.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR0.ABR3.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR1.ABR4.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR1.ABR5.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR1.ABR6.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR1.ABR7.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR1.ABR8.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR1.ABR9.A104 (Arg0)
            }

            If ((0xFF == Local0))
            {
                Local0 = \_SB.AWR1.ABRA.A104 (Arg0)
            }

            Return (Local0)
        }

        Method (A018, 2, Serialized)
        {
            Acquire (\_SB.AM00, 0xFFFF)
            CreateDWordField (Arg1, Zero, A133)
            CreateDWordField (Arg1, 0x04, A134)
            CreateDWordField (Arg1, 0x08, A135)
            CreateDWordField (Arg1, 0x0C, A136)
            CreateDWordField (Arg1, 0x10, A137)
            CreateDWordField (Arg1, 0x14, A138)
            A139 = Zero
            While ((A139 != Zero)){}
            A140 = A133 /* \_SB_.A018.A133 */
            A141 = A134 /* \_SB_.A018.A134 */
            A142 = A135 /* \_SB_.A018.A135 */
            A143 = A136 /* \_SB_.A018.A136 */
            A144 = A137 /* \_SB_.A018.A137 */
            A145 = A138 /* \_SB_.A018.A138 */
            A146 = Arg0
            While ((A139 == Zero)){}
            Release (\_SB.AM00)
        }

        Method (A046, 2, Serialized)
        {
            Acquire (\_SB.AM00, 0xFFFF)
            CreateDWordField (Arg1, Zero, A147)
            CreateDWordField (Arg1, 0x04, A148)
            CreateDWordField (Arg1, 0x08, A149)
            CreateDWordField (Arg1, 0x0C, A150)
            CreateDWordField (Arg1, 0x10, A151)
            CreateDWordField (Arg1, 0x14, A152)
            Local0 = (0x80000000 & A153) /* \_SB_.A153 */
            While ((Local0 == Zero))
            {
                Local0 = (0x80000000 & A153) /* \_SB_.A153 */
            }

            A154 = A147 /* \_SB_.A046.A147 */
            A155 = A148 /* \_SB_.A046.A148 */
            A156 = A149 /* \_SB_.A046.A149 */
            A157 = A150 /* \_SB_.A046.A150 */
            A158 = A151 /* \_SB_.A046.A151 */
            A159 = A152 /* \_SB_.A046.A152 */
            Local1 = (Arg0 & 0xFF)
            Local1 <<= 0x08
            A153 = Local1
            A160 = 0xFFFFFFFF
            Local0 = (0x80000000 & A153) /* \_SB_.A153 */
            While ((Local0 == Zero))
            {
                Local0 = (0x80000000 & A153) /* \_SB_.A153 */
            }

            Release (\_SB.AM00)
        }

        Method (AMNR, 1, NotSerialized)
        {
            Acquire (\_SB.AM00, 0xFFFF)
            BankField (A161, A162, Arg0, DWordAcc, NoLock, Preserve)
            {
                Offset (0xBC), 
                A163,   32
            }

            Release (\_SB.AM00)
            Return (A163) /* \_SB_.AMNR.A163 */
        }

        Method (AMNW, 2, NotSerialized)
        {
            Acquire (\_SB.AM00, 0xFFFF)
            BankField (A161, A162, Arg0, DWordAcc, NoLock, Preserve)
            {
                Offset (0xBC), 
                A164,   32
            }

            A164 = Arg1
            Release (\_SB.AM00)
        }

        Method (A032, 1, Serialized)
        {
            CreateWordField (Arg0, Zero, A165)
            Local7 = Buffer (0x18){}
            CreateDWordField (Local7, Zero, A012)
            CreateDWordField (Local7, 0x04, A013)
            CreateDWordField (Local7, 0x08, A014)
            CreateDWordField (Local7, 0x0C, A015)
            CreateDWordField (Local7, 0x10, A016)
            CreateDWordField (Local7, 0x14, A017)
            Local0 = 0x02
            While ((Local0 < A165))
            {
                Local1 = DerefOf (Arg0 [Local0])
                Local0++
                Local2 = DerefOf (Arg0 [Local0])
                Local0++
                Local2 |= (DerefOf (Arg0 [Local0]) << 0x08)
                Local0++
                Local2 |= (DerefOf (Arg0 [Local0]) << 0x10)
                Local0++
                Local2 |= (DerefOf (Arg0 [Local0]) << 0x18)
                Local0++
                A012 = Zero
                A013 = Zero
                A014 = Zero
                A015 = Zero
                A016 = Zero
                A017 = Zero
                If ((Local1 == One))
                {
                    A012 = Local2
                    A018 (0x4E, Local7)
                }

                If ((Local1 == 0x03))
                {
                    A012 = Local2
                    A018 (0x3F, Local7)
                }

                If ((Local1 == 0x04))
                {
                    A012 = Local2
                    A018 (0x3E, Local7)
                }

                If ((Local1 == 0x05))
                {
                    A012 = Local2
                    A018 (0x4F, Local7)
                }

                If ((Local1 == 0x06))
                {
                    A012 = Local2
                    A018 (0x3E, Local7)
                }

                If ((Local1 == 0x07))
                {
                    A012 = Local2
                    A018 (0x5F, Local7)
                }

                If ((Local1 == 0x08))
                {
                    A012 = Local2
                    A018 (0x61, Local7)
                }

                If ((Local1 == 0x0B))
                {
                    A012 = Local2
                    A018 (0x3C, Local7)
                }

                If ((Local1 == 0x0C))
                {
                    A012 = Local2
                    A018 (0x3D, Local7)
                }

                If ((Local1 == 0x10))
                {
                    A012 = Local2
                    A018 (0x3F, Local7)
                }

                If ((Local1 == 0x11))
                {
                    A012 = Local2
                    A018 (0x2F, Local7)
                }

                If ((Local1 == 0x13))
                {
                    A012 = Local2
                    A018 (0x60, Local7)
                }

                If ((Local1 == 0x20))
                {
                    A012 = Local2
                    A018 (0x50, Local7)
                }

                If ((Local1 == 0x21))
                {
                    A012 = Local2
                    A018 (0x51, Local7)
                }

                If ((Local1 == 0x22))
                {
                    A012 = Local2
                    A018 (0x52, Local7)
                }

                If ((Local1 == 0x23))
                {
                    A012 = Local2
                    A018 (0x53, Local7)
                }

                If ((Local1 == 0x24))
                {
                    A012 = Local2
                    A018 (0x54, Local7)
                }

                If ((Local1 == 0x25))
                {
                    A012 = Local2
                    A018 (0x55, Local7)
                }

                If ((Local1 == 0x26))
                {
                    A012 = Local2
                    A018 (0x56, Local7)
                }

                If ((Local1 == 0x27))
                {
                    A012 = Local2
                    A018 (0x57, Local7)
                }

                If ((Local1 == 0x28))
                {
                    A012 = Local2
                    A018 (0x58, Local7)
                }

                If ((Local1 == 0x29))
                {
                    A012 = Local2
                    A018 (0x59, Local7)
                }

                If ((Local1 == 0x2A))
                {
                    A012 = Local2
                    A018 (0x5A, Local7)
                }

                If ((Local1 == 0x2B))
                {
                    A012 = Local2
                    A018 (0x5B, Local7)
                }

                If ((Local1 == 0x2C))
                {
                    A012 = Local2
                    A018 (0x5C, Local7)
                }

                If ((Local1 == 0x2D))
                {
                    A012 = Local2
                    A018 (0x5D, Local7)
                }

                If ((Local1 == 0x2E))
                {
                    A012 = Local2
                    A018 (0x5E, Local7)
                }

                If ((Local1 == 0x30))
                {
                    A012 = Local2
                    A018 (0x6B, Local7)
                    Local3 = Buffer (0x08){}
                    CreateDWordField (Local3, Zero, A166)
                    CreateDWordField (Local3, 0x04, A167)
                    A166 = A140 /* \_SB_.A140 */
                    A167 = A141 /* \_SB_.A141 */
                    Return (Local3)
                }

                If ((Local1 == 0x31))
                {
                    A012 = Local2
                    A018 (0x6C, Local7)
                }

                If ((Local1 == 0x32))
                {
                    A012 = Local2
                    A018 (0x6D, Local7)
                }
            }
        }

        Device (AWR0)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, 0x8B)  // _UID: Unique ID
            Device (ABR0)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x80)  // _UID: Unique ID
                Name (AB12, 0x20)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR0.ABR0.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR0.ABR0.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR0.ABR0.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR0.ABR0.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR0.ABR0.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR0.ABR0.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR0.ABR0.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR0.ABR0.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR0.ABR0.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR0.ABR0.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR0.ABR0.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR0.ABR0.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR0.ABR0.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }

            Device (ABR1)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x81)  // _UID: Unique ID
                Name (AB12, 0x34)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR0.ABR1.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR0.ABR1.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR0.ABR1.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR0.ABR1.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR0.ABR1.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR0.ABR1.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR0.ABR1.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR0.ABR1.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR0.ABR1.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR0.ABR1.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR0.ABR1.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR0.ABR1.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR0.ABR1.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }

            Device (ABR2)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x82)  // _UID: Unique ID
                Name (AB12, 0x48)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR0.ABR2.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR0.ABR2.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR0.ABR2.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR0.ABR2.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR0.ABR2.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR0.ABR2.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR0.ABR2.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR0.ABR2.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR0.ABR2.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR0.ABR2.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR0.ABR2.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR0.ABR2.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR0.ABR2.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }

            Device (ABR3)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x83)  // _UID: Unique ID
                Name (AB12, 0x5C)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR0.ABR3.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR0.ABR3.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR0.ABR3.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR0.ABR3.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR0.ABR3.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR0.ABR3.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR0.ABR3.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR0.ABR3.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR0.ABR3.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR0.ABR3.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR0.ABR3.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR0.ABR3.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR0.ABR3.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }
        }

        Device (AWR1)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, 0x8C)  // _UID: Unique ID
            Device (ABR4)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x84)  // _UID: Unique ID
                Name (AB12, 0x70)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR1.ABR4.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR1.ABR4.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR1.ABR4.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR1.ABR4.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR1.ABR4.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR1.ABR4.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR1.ABR4.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR1.ABR4.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR1.ABR4.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR1.ABR4.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR1.ABR4.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR1.ABR4.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR1.ABR4.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }

            Device (ABR5)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x85)  // _UID: Unique ID
                Name (AB12, 0x84)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR1.ABR5.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR1.ABR5.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR1.ABR5.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR1.ABR5.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR1.ABR5.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR1.ABR5.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR1.ABR5.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR1.ABR5.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR1.ABR5.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR1.ABR5.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR1.ABR5.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR1.ABR5.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR1.ABR5.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }

            Device (ABR6)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x86)  // _UID: Unique ID
                Name (AB12, 0x98)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR1.ABR6.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR1.ABR6.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR1.ABR6.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR1.ABR6.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR1.ABR6.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR1.ABR6.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR1.ABR6.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR1.ABR6.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR1.ABR6.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR1.ABR6.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR1.ABR6.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR1.ABR6.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR1.ABR6.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }

            Device (ABR7)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x87)  // _UID: Unique ID
                Name (AB12, 0xAC)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR1.ABR7.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR1.ABR7.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR1.ABR7.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR1.ABR7.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR1.ABR7.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR1.ABR7.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR1.ABR7.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR1.ABR7.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR1.ABR7.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR1.ABR7.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR1.ABR7.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR1.ABR7.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR1.ABR7.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }

            Device (ABR8)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x88)  // _UID: Unique ID
                Name (AB12, 0xC0)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR1.ABR8.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR1.ABR8.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR1.ABR8.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR1.ABR8.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR1.ABR8.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR1.ABR8.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR1.ABR8.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR1.ABR8.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR1.ABR8.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR1.ABR8.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR1.ABR8.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR1.ABR8.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR1.ABR8.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }

            Device (ABR9)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x89)  // _UID: Unique ID
                Name (AB12, 0xD4)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR1.ABR9.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR1.ABR9.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR1.ABR9.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR1.ABR9.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR1.ABR9.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR1.ABR9.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR1.ABR9.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR1.ABR9.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR1.ABR9.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR1.ABR9.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR1.ABR9.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR1.ABR9.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR1.ABR9.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }

            Device (ABRA)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x8A)  // _UID: Unique ID
                Name (AB12, 0xE8)
                Name (AB00, Zero)
                Name (AB01, Zero)
                Name (AB0E, Zero)
                Name (AB02, Zero)
                Name (AB03, Zero)
                Name (AB04, Zero)
                Name (AB05, Zero)
                Name (AB06, Zero)
                Name (AB07, Zero)
                Name (AB08, Zero)
                Name (AB09, Zero)
                Name (AB0A, Zero)
                Name (AB0B, Zero)
                Name (AB0C, Zero)
                Name (AB0D, Zero)
                OperationRegion (A105, SystemMemory, (AGRB + ((DerefOf (\_SB.ADAT [(AB12 + 0x0D)]
                    ) << 0x0F) | (DerefOf (\_SB.ADAT [(AB12 + 0x0E)]) << 0x0C
                    ))), 0x1000)
                Field (A105, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    Offset (0x19), 
                    A098,   8, 
                    A099,   8, 
                    Offset (0x68), 
                    A106,   2, 
                        ,   2, 
                    A107,   1, 
                    A108,   1, 
                    Offset (0x6A), 
                        ,   11, 
                    A109,   1, 
                    Offset (0x88), 
                    A110,   4, 
                        ,   1, 
                    A111,   1
                }

                Name (AB10, Zero)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    AB00 = DerefOf (\_SB.ADAT [(AB12 + Zero)])
                    AB0E = DerefOf (\_SB.ADAT [(AB12 + One)])
                    AB01 = DerefOf (\_SB.ADAT [(AB12 + 0x02)])
                    AB02 = DerefOf (\_SB.ADAT [(AB12 + 0x03)])
                    AB03 = DerefOf (\_SB.ADAT [(AB12 + 0x04)])
                    AB04 = DerefOf (\_SB.ADAT [(AB12 + 0x05)])
                    AB05 = DerefOf (\_SB.ADAT [(AB12 + 0x06)])
                    AB06 = DerefOf (\_SB.ADAT [(AB12 + 0x07)])
                    AB07 = DerefOf (\_SB.ADAT [(AB12 + 0x08)])
                    AB08 = DerefOf (\_SB.ADAT [(AB12 + 0x09)])
                    AB09 = DerefOf (\_SB.ADAT [(AB12 + 0x0A)])
                    AB0A = DerefOf (\_SB.ADAT [(AB12 + 0x0B)])
                    AB0B = DerefOf (\_SB.ADAT [(AB12 + 0x0C)])
                    AB0C = DerefOf (\_SB.ADAT [(AB12 + 0x0D)])
                    AB0D = DerefOf (\_SB.ADAT [(AB12 + 0x0E)])
                }

                Method (A093, 0, NotSerialized)
                {
                    Local0 = A075 ()
                    If ((Local0 == One))
                    {
                        Return (AB01) /* \_SB_.AWR1.ABRA.AB01 */
                    }

                    If ((Local0 == Zero))
                    {
                        Return (AB0E) /* \_SB_.AWR1.ABRA.AB0E */
                    }
                }

                Method (A088, 0, NotSerialized)
                {
                    If ((AB10 != Zero))
                    {
                        If ((AB10 == One))
                        {
                            Return (One)
                        }
                    }

                    Return (Zero)
                }

                Method (A094, 0, NotSerialized)
                {
                    If ((AB05 != Zero))
                    {
                        Return (AB05) /* \_SB_.AWR1.ABRA.AB05 */
                    }

                    If ((AB10 > One))
                    {
                        Return ((AB10 - One))
                    }

                    Return (Zero)
                }

                Method (A087, 0, NotSerialized)
                {
                    If ((\_SB.AP05 == Zero))
                    {
                        If ((AB05 != Zero))
                        {
                            Return (AB05) /* \_SB_.AWR1.ABRA.AB05 */
                        }

                        Return (AB0E) /* \_SB_.AWR1.ABRA.AB0E */
                    }

                    Local0 = A094 ()
                    If ((Local0 != Zero))
                    {
                        If ((Local0 > AB00))
                        {
                            Return (AB00) /* \_SB_.AWR1.ABRA.AB00 */
                        }
                        Else
                        {
                            Return (Local0)
                        }
                    }

                    Local0 = A093 ()
                    If ((\_SB.AP03 != Zero))
                    {
                        If ((\_SB.AP03 < Local0))
                        {
                            Return (\_SB.AP03)
                        }
                    }

                    Return (Local0)
                }

                Method (A086, 0, NotSerialized)
                {
                    Return (AB02) /* \_SB_.AWR1.ABRA.AB02 */
                }

                Method (A089, 0, NotSerialized)
                {
                    Return (AB00) /* \_SB_.AWR1.ABRA.AB00 */
                }

                Method (A085, 1, NotSerialized)
                {
                    AB02 = Arg0
                    A095 (Arg0)
                    If ((AB10 != Zero)){}
                    Else
                    {
                    }

                    A096 (Zero)
                    Name (A097, Zero)
                    A096 (One)
                }

                Method (A090, 1, NotSerialized)
                {
                    AB10 = Arg0
                }

                Method (A091, 1, NotSerialized)
                {
                    Local0 = (Arg0 >> 0x08)
                    If (((Local0 >= A098) && (Local0 <= A099)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A100, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (A092, 0, NotSerialized)
                {
                    AB10 = Zero
                }

                Method (A095, 1, NotSerialized)
                {
                    If ((Arg0 >= 0x02)){}
                    If ((Arg0 >= 0x03)){}
                    If ((Arg0 == One))
                    {
                        If ((AB04 == One)){}
                    }
                    Else
                    {
                    }
                }

                Method (A101, 1, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = A102 (Local0, Zero)
                    Local2 = A102 (Local0, 0x08)
                    If ((Local1 != 0xFFFFFFFF))
                    {
                        Local3 = ((Local1 >> 0x10) & 0xFFFF)
                        Local1 &= 0xFFFF
                        Local2 = ((Local2 >> 0x18) & 0xFF)
                        If ((Local2 == 0x03))
                        {
                            If (((Local1 == 0x1002) || (Local1 == 0x1022)))
                            {
                                Local0 = 0x10
                                While ((Local0 < 0x30))
                                {
                                    Local4 = A102 (Zero, Local0)
                                    Local5 = Zero
                                    If ((((Local4 & 0x09) == Zero) && (Local4 != Zero)))
                                    {
                                        If (((Local4 & 0x06) == 0x04))
                                        {
                                            Local0 += 0x04
                                            Local5 = A102 (Zero, Local0)
                                        }

                                        If ((Arg0 != Zero))
                                        {
                                            A103 (0x63, (Local4 & 0xFFFFFFF0), Zero)
                                            A103 (0x64, Local5, Zero)
                                            A103 (0x67, Zero, Zero)
                                            A103 (0x66, Zero, Zero)
                                            Break
                                        }
                                        Else
                                        {
                                            A103 (0x67, Zero, Zero)
                                            Break
                                        }
                                    }
                                    ElseIf (((Local4 & 0x06) == 0x04))
                                    {
                                        Local0 += 0x04
                                    }

                                    Local0 += 0x04
                                }
                            }
                        }
                    }
                }

                Method (A104, 1, NotSerialized)
                {
                    Local0 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == Local0))
                    {
                        If ((AB06 > AB07))
                        {
                            Return (AB07) /* \_SB_.AWR1.ABRA.AB07 */
                        }
                        Else
                        {
                            Return (AB06) /* \_SB_.AWR1.ABRA.AB06 */
                        }
                    }

                    Return (0xFF)
                }

                Method (A115, 2, NotSerialized)
                {
                    If ((A102 (Arg0, Zero) == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Local0 = A102 (Arg0, 0x34)
                    While (One)
                    {
                        Local1 = A102 (Arg0, (Local0 & 0xFF))
                        If (((Local1 & 0xFF) == Arg1))
                        {
                            Return ((Local0 & 0xFF))
                        }

                        Local0 = ((Local1 >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            Return (Local0)
                        }
                    }
                }

                Name (AESP, Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (A096, 1, NotSerialized)
                {
                    Local0 = Zero
                    If ((A102 (Local0, Zero) != 0xFFFFFFFF))
                    {
                        Local1 = (A102 (Local0, 0x08) & 0x80)
                        If ((Local1 == 0x80))
                        {
                            Local7 = 0x07
                        }
                        Else
                        {
                            Local7 = Zero
                        }

                        While ((Local0 <= Local7))
                        {
                            Local1 = A115 (Local0, 0x10)
                            If ((Local1 == Zero))
                            {
                                Local0++
                                Continue
                            }

                            If ((Arg0 == Zero))
                            {
                                Local2 = A102 (Local0, (Local1 + 0x10))
                                A114 (Local0, (Local1 + 0x10), (Local2 & ~0x03))
                                AESP [Local0] = Local2
                            }
                            Else
                            {
                                Local2 = DerefOf (AESP [Local0])
                                A114 (Local0, (Local1 + 0x10), Local2)
                            }

                            Local0++
                        }
                    }
                    Else
                    {
                    }
                }

                Method (A114, 3, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    ADRR = Arg2
                }

                Method (A102, 2, Serialized)
                {
                    Local0 = (AGRB + (A099 << 0x14))
                    Local0 += (Arg0 << 0x0C)
                    Local0 += Arg1
                    OperationRegion (ADRB, SystemMemory, Local0, 0x04)
                    Field (ADRB, DWordAcc, NoLock, Preserve)
                    {
                        ADRR,   32
                    }

                    Return (ADRR) /* \_SB_.AWR1.ABRA.A102.ADRR */
                }

                Method (A112, 1, NotSerialized)
                {
                    If ((AB0B != One))
                    {
                        Return (Zero)
                    }

                    Return (A100 (Arg0))
                }

                Method (A113, 1, NotSerialized)
                {
                    Name (A097, Zero)
                    Local2 = Zero
                    A097 = A106 /* \_SB_.AWR1.ABRA.A106 */
                    Local1 = (AB0D | (AB0C << 0x03))
                    If ((Arg0 == One))
                    {
                        A107 = Zero
                        Local0 = One
                    }
                    Else
                    {
                        A096 (Zero)
                        Local0 = A102 (Zero, 0x04)
                        If ((Local0 != 0xFFFFFFFF))
                        {
                            A114 (Zero, 0x04, (Local0 & ~0x04))
                            Local0 = A102 (One, 0x04)
                            If ((Local0 != 0xFFFFFFFF))
                            {
                                A114 (One, 0x04, (Local0 & ~0x04))
                            }
                        }

                        Local2 = Zero
                        A107 = One
                        Local0 = 0x05
                    }

                    A106 = Zero
                    While ((Local0 != 0x08))
                    {
                        If ((Local0 == One))
                        {
                            Local2 = One
                            Local0 = 0x08
                        }

                        If ((Local0 == 0x05))
                        {
                            A102 (Zero, Zero)
                            AB05 = Zero
                            AB04 = Zero
                            AB10 = Zero
                            Local2 = Zero
                            Local0 = 0x08
                        }
                    }

                    A106 = A097 /* \_SB_.AWR1.ABRA.A113.A097 */
                    If ((A097 != Zero))
                    {
                        A096 (One)
                    }

                    Return (Local2)
                }
            }
        }

        Method (A172, 1, Serialized)
        {
            If ((DerefOf (\_SB.ADAT [0x08]) == One))
            {
                Local0 = Zero
                While ((Local0 < 0x0B))
                {
                    A173 (Local0, Arg0)
                    Local0++
                }
            }
        }

        Method (A103, 3, NotSerialized)
        {
            Local7 = Buffer (0x18){}
            CreateDWordField (Local7, Zero, A012)
            CreateDWordField (Local7, 0x04, A013)
            CreateDWordField (Local7, 0x08, A014)
            CreateDWordField (Local7, 0x0C, A015)
            CreateDWordField (Local7, 0x10, A016)
            CreateDWordField (Local7, 0x14, A017)
            A012 = Arg1
            A013 = Arg2
            A018 (Arg0, Local7)
        }

        Method (A173, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Return (\_SB.AWR0.ABR0.A101 (Arg1))
            }

            If ((Arg0 == One))
            {
                Return (\_SB.AWR0.ABR1.A101 (Arg1))
            }

            If ((Arg0 == 0x02))
            {
                Return (\_SB.AWR0.ABR2.A101 (Arg1))
            }

            If ((Arg0 == 0x03))
            {
                Return (\_SB.AWR0.ABR3.A101 (Arg1))
            }

            If ((Arg0 == 0x04))
            {
                Return (\_SB.AWR1.ABR4.A101 (Arg1))
            }

            If ((Arg0 == 0x05))
            {
                Return (\_SB.AWR1.ABR5.A101 (Arg1))
            }

            If ((Arg0 == 0x06))
            {
                Return (\_SB.AWR1.ABR6.A101 (Arg1))
            }

            If ((Arg0 == 0x07))
            {
                Return (\_SB.AWR1.ABR7.A101 (Arg1))
            }

            If ((Arg0 == 0x08))
            {
                Return (\_SB.AWR1.ABR8.A101 (Arg1))
            }

            If ((Arg0 == 0x09))
            {
                Return (\_SB.AWR1.ABR9.A101 (Arg1))
            }

            If ((Arg0 == 0x0A))
            {
                Return (\_SB.AWR1.ABRA.A101 (Arg1))
            }
        }

        Method (A065, 1, Serialized)
        {
            Local0 = Zero
            Local6 = DerefOf (Arg0 [Local0])
            Local7 = Buffer (0x18){}
            CreateDWordField (Local7, Zero, A012)
            CreateDWordField (Local7, 0x04, A013)
            CreateDWordField (Local7, 0x08, A014)
            CreateDWordField (Local7, 0x0C, A015)
            CreateDWordField (Local7, 0x10, A016)
            CreateDWordField (Local7, 0x14, A017)
            Local0 = 0x02
            Local1 = DerefOf (Arg0 [Local0])
            Local0++
            Local2 = DerefOf (Arg0 [Local0])
            Local0++
            Local2 |= (DerefOf (Arg0 [Local0]) << 0x08)
            A012 = Zero
            A013 = Zero
            A014 = Zero
            A015 = Zero
            A016 = Zero
            A017 = Zero
            If ((Local1 == Zero))
            {
                A012 = Local2
                A172 (Zero)
            }

            If ((Local1 == One))
            {
                A012 = Local2
                A172 (One)
            }

            If ((Local1 == 0x02))
            {
                A012 = Local2
                A018 (0x66, Local7)
            }

            If ((Local1 == 0x03))
            {
                A012 = Local2
                A018 (0x67, Local7)
            }
        }

        Name (A008, One)
        Name (A009, Zero)
        Method (APTS, 1, NotSerialized)
        {
            If ((Arg0 == 0x03)){}
        }

        Method (AWAK, 1, NotSerialized)
        {
            If ((Arg0 == 0x03)){}
        }

        Method (APPM, 1, NotSerialized)
        {
            Local0 = DerefOf (Arg0 [0x04])
            Local1 = DerefOf (Arg0 [0x02])
            A010 (Local0, Local1)
        }

        Method (A011, 0, NotSerialized)
        {
            Local7 = Buffer (0x18){}
            CreateDWordField (Local7, Zero, A012)
            CreateDWordField (Local7, 0x04, A013)
            CreateDWordField (Local7, 0x08, A014)
            CreateDWordField (Local7, 0x0C, A015)
            CreateDWordField (Local7, 0x10, A016)
            CreateDWordField (Local7, 0x14, A017)
            A012 = Zero
            A013 = Zero
            A014 = Zero
            A015 = Zero
            A016 = Zero
            A017 = Zero
            If ((AD00 == Zero))
            {
                A018 (0x68, Local7)
            }
            Else
            {
                A018 (0x69, Local7)
            }
        }

        Method (A019, 2, NotSerialized)
        {
        }
    }
}

