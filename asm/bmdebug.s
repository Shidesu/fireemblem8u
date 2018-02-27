	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START DebugMenu_MapIdle
DebugMenu_MapIdle: @ 0x0801BB40
	push {lr}
	adds r0, r1, #0
	movs r1, #7
	movs r2, #2
	bl sub_801C65C
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_START DebugMenu_MapEffect
DebugMenu_MapEffect: @ 0x0801BB54
	push {r4, lr}
	adds r4, r1, #0
	bl sub_80311F0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_801C650
	ldr r4, _0801BB90  @ gUnknown_0202BCF0
	strb r0, [r4, #0xe]
	ldr r0, _0801BB94  @ gUnknown_03001780
	ldrb r0, [r0]
	strb r0, [r4, #0x1b]
	bl sub_8031214
	bl nullsub_9
	adds r4, #0x4a
	ldrb r1, [r4]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801BB90: .4byte gUnknown_0202BCF0
_0801BB94: .4byte gUnknown_03001780

	THUMB_FUNC_START sub_801BB98
sub_801BB98: @ 0x0801BB98
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl sub_80AEC94
	adds r4, r0, #0
	adds r6, r5, #0
	adds r6, #0x3c
	movs r0, #0
	strb r0, [r6]
	bl sub_8002258
	movs r1, #0
	cmp r1, r4
	bge _0801BBCC
	cmp r0, #0
	bne _0801BBBC
	strb r1, [r6]
	b _0801BBCC
_0801BBBC:
	adds r1, #1
	cmp r1, r4
	bge _0801BBCC
	cmp r0, r1
	bne _0801BBBC
	adds r0, r5, #0
	adds r0, #0x3c
	strb r1, [r0]
_0801BBCC:
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl Text_Clear
	ldr r1, _0801BC14  @ gUnknown_08A20E74
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r1, #0xc
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BC18  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BC14: .4byte gUnknown_08A20E74
_0801BC18: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START sub_801BC1C
sub_801BC1C: @ 0x0801BC1C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _0801BCC0  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801BC38
	adds r1, r6, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801BC38:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	adds r5, r6, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801BC4E
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_0801BC4E:
	adds r1, r5, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801BC5C
	movs r0, #0
	strb r0, [r1]
_0801BC5C:
	ldr r7, _0801BCC4  @ gUnknown_08A20E74
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldr r0, [r0]
	cmp r0, #0
	bge _0801BC72
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0801BC72:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0801BCB8
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl Text_Clear
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	adds r1, r7, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertString
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BCC8  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
_0801BCB8:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BCC0: .4byte gKeyStatusPtr
_0801BCC4: .4byte gUnknown_08A20E74
_0801BCC8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START sub_801BCCC
sub_801BCCC: @ 0x0801BCCC
	push {lr}
	bl EndMenu
	movs r0, #0
	bl DeleteFaceByIndex
	bl ClearBG0BG1
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_START DebugMapMenu_DisplayInfoDraw
DebugMapMenu_DisplayInfoDraw: @ 0x0801BCE4
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _0801BD4C  @ gUnknown_0859AA5C
	bl Proc_Find
	adds r4, r0, #0
	adds r6, r5, #0
	adds r6, #0x34
	adds r0, r6, #0
	bl Text_Clear
	ldr r0, [r5, #0x30]
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertString
	ldr r1, _0801BD50  @ gUnknown_0859AA7C
	adds r4, #0x66
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BD54  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r6, #0
	bl Text_Draw
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BD4C: .4byte gUnknown_0859AA5C
_0801BD50: .4byte gUnknown_0859AA7C
_0801BD54: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START DebugMapMenu_DisplayInfoIdle
DebugMapMenu_DisplayInfoIdle: @ 0x0801BD58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801BD98  @ gUnknown_0859AA5C
	bl Proc_Find
	adds r2, r0, #0
	ldr r0, _0801BD9C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	cmp r0, #0
	beq _0801BD90
	adds r2, #0x66
	ldrh r0, [r2]
	movs r1, #1
	eors r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl DebugMapMenu_DisplayInfoDraw
	movs r0, #1
	negs r0, r0
	movs r1, #9
	bl SetupDebugFontForOBJ
_0801BD90:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BD98: .4byte gUnknown_0859AA5C
_0801BD9C: .4byte gKeyStatusPtr

	THUMB_FUNC_START DebugMapMenu_DisplayInfoEffect
DebugMapMenu_DisplayInfoEffect: @ 0x0801BDA0
	movs r0, #0
	bx lr

	THUMB_FUNC_START DebugMenu_WeatherDraw
DebugMenu_WeatherDraw: @ 0x0801BDA4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r1, _0801BE1C  @ gUnknown_080D7A6C
	mov r0, sp
	movs r2, #0xe
	bl memcpy
	ldr r0, _0801BE20  @ gUnknown_0859AA5C
	bl Proc_Find
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, [r5, #0x30]
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertString
	ldr r0, [r6, #0x58]
	movs r1, #7
	bl __modsi3
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BE24  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801BE1C: .4byte gUnknown_080D7A6C
_0801BE20: .4byte gUnknown_0859AA5C
_0801BE24: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START DebugMenu_WeatherIdle
DebugMenu_WeatherIdle: @ 0x0801BE28
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0801BE94  @ gUnknown_0859AA5C
	bl Proc_Find
	adds r4, r0, #0
	ldr r5, _0801BE98  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801BE4A
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
_0801BE4A:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801BE5C
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
_0801BE5C:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	bge _0801BE66
	movs r0, #6
	str r0, [r4, #0x58]
_0801BE66:
	ldr r0, [r4, #0x58]
	cmp r0, #6
	ble _0801BE70
	movs r0, #0
	str r0, [r4, #0x58]
_0801BE70:
	adds r0, r6, #0
	adds r1, r7, #0
	bl DebugMenu_WeatherDraw
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0801BEF2
	ldr r0, [r4, #0x58]
	cmp r0, #6
	bhi _0801BEF2
	lsls r0, r0, #2
	ldr r1, _0801BE9C  @ _0801BEA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801BE94: .4byte gUnknown_0859AA5C
_0801BE98: .4byte gKeyStatusPtr
_0801BE9C: .4byte _0801BEA0
_0801BEA0: @ jump table
	.4byte _0801BEBC @ case 0
	.4byte _0801BEC4 @ case 1
	.4byte _0801BECC @ case 2
	.4byte _0801BED4 @ case 3
	.4byte _0801BEDC @ case 4
	.4byte _0801BEE4 @ case 5
	.4byte _0801BEEC @ case 6
_0801BEBC:
	movs r0, #0
	bl SetupWeather
	b _0801BEF2
_0801BEC4:
	movs r0, #6
	bl SetupWeather
	b _0801BEF2
_0801BECC:
	movs r0, #1
	bl SetupWeather
	b _0801BEF2
_0801BED4:
	movs r0, #2
	bl SetupWeather
	b _0801BEF2
_0801BEDC:
	movs r0, #4
	bl SetupWeather
	b _0801BEF2
_0801BEE4:
	movs r0, #3
	bl SetupWeather
	b _0801BEF2
_0801BEEC:
	movs r0, #5
	bl SetupWeather
_0801BEF2:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START DebugMenu_WeatherEffect
DebugMenu_WeatherEffect: @ 0x0801BEFC
	movs r0, #0
	bx lr

	THUMB_FUNC_START DebugMenu_ClearDraw
DebugMenu_ClearDraw: @ 0x0801BF00
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, [r5, #0x30]
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertString
	movs r0, #0xd7
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #2
	bl Text_InsertString
	bl sub_80A4BB0
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BF68  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801BF68: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START DebugMenu_ClearIdle
DebugMenu_ClearIdle: @ 0x0801BF6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r4, _0801BFEC  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0801C008
	bl sub_80A4BB0
	adds r5, r0, #0
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801BF9A
	cmp r5, #0
	blt _0801BF9A
	subs r5, #1
_0801BF9A:
	ldr r0, _0801BFEC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801BFAE
	cmp r5, #0xb
	bgt _0801BFAE
	adds r5, #1
_0801BFAE:
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
	add r1, sp, #0x14
	movs r2, #0
	mov r0, sp
	adds r0, #0x1f
_0801BFBC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0801BFBC
	movs r4, #0
	cmp r4, r5
	bge _0801BFD8
_0801BFCA:
	adds r4, #1
	mov r0, sp
	adds r1, r4, #0
	bl sub_80A4BD0
	cmp r4, r5
	blt _0801BFCA
_0801BFD8:
	cmp r5, #0
	bne _0801BFF0
	mov r2, sp
	ldrb r1, [r2, #0xe]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #0xe]
	b _0801BFFA
	.align 2, 0
_0801BFEC: .4byte gKeyStatusPtr
_0801BFF0:
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #0xe]
_0801BFFA:
	mov r0, sp
	bl SaveSomeUnitStatThingUnlockIdk
	adds r0, r6, #0
	adds r1, r7, #0
	bl DebugMenu_ClearDraw
_0801C008:
	movs r0, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START DebugMenu_ClearEffect
DebugMenu_ClearEffect: @ 0x0801C014
	movs r0, #0x17
	bx lr

	THUMB_FUNC_START DebugMenu_ErasedEffect
DebugMenu_ErasedEffect: @ 0x0801C018
	push {lr}
	bl ClearBG0BG1
	ldr r0, _0801C02C  @ gUnknown_0859CFB0
	bl NewMenu_Default
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_0801C02C: .4byte gUnknown_0859CFB0

	THUMB_FUNC_START sub_801C030
sub_801C030: @ 0x0801C030
	push {lr}
	bl sub_80A4C14
	ldr r2, _0801C058  @ gUnknown_0202BCF0
	ldrb r1, [r2, #0x14]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2, #0x14]
	bl sub_8031214
	bl sub_80A4DA0
	bl SaveGame
	movs r0, #0xff
	bl SoftReset
	pop {r1}
	bx r1
	.align 2, 0
_0801C058: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_801C05C
sub_801C05C: @ 0x0801C05C
	push {r4, lr}
	ldr r1, _0801C084  @ gUnknown_03001780
	ldr r0, _0801C088  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x1b]
	strb r0, [r1]
	ldr r4, _0801C08C  @ gUnknown_02022D76
	movs r0, #0
	bl GetROMChapterStruct
	ldr r1, [r0]
	adds r0, r4, #0
	bl PrintDebugStringToBG
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801C084: .4byte gUnknown_03001780
_0801C088: .4byte gUnknown_0202BCF0
_0801C08C: .4byte gUnknown_02022D76

	THUMB_FUNC_START DEBUGONLY_Startup
DEBUGONLY_Startup: @ 0x0801C090
	push {r4, lr}
	ldr r0, _0801C0E0  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	ldr r0, _0801C0E4  @ GeneralVBlankHandler
	bl SetInterrupt_LCDVBlank
	bl sub_80311A8
	movs r0, #2
	movs r1, #0
	bl SetupDebugFontForBG
	ldr r0, _0801C0E8  @ gUnknown_080D7A7C
	bl sub_8008A24
	ldr r0, _0801C0EC  @ gUnknown_0859CFF8
	bl NewMenu_Default
	ldr r4, _0801C0F0  @ gUnknown_0202BCB0
	ldrb r2, [r4, #4]
	movs r1, #0x40
	orrs r1, r2
	strb r1, [r4, #4]
	ldr r1, _0801C0F4  @ 0x0600B000
	movs r2, #1
	negs r2, r2
	bl sub_8086BB8
	ldrb r1, [r4, #4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r4, #4]
	ldr r0, _0801C0F8  @ gUnknown_02023CE8
	bl PrintDebugBuildDateAndTime
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C0E0: .4byte SomeUpdateRoutine
_0801C0E4: .4byte GeneralVBlankHandler
_0801C0E8: .4byte gUnknown_080D7A7C
_0801C0EC: .4byte gUnknown_0859CFF8
_0801C0F0: .4byte gUnknown_0202BCB0
_0801C0F4: .4byte 0x0600B000
_0801C0F8: .4byte gUnknown_02023CE8

	THUMB_FUNC_START sub_801C0FC
sub_801C0FC: @ 0x0801C0FC
	push {lr}
	sub sp, #0x14
	ldr r0, [r0, #0x48]
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bl BG_EnableSyncByMask
	add r0, sp, #4
	movs r1, #3
	bl sub_80A2EF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801C12C
	ldr r2, [sp, #0x10]
	lsrs r0, r2, #0x10
	adds r0, r2, r0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0801C14C
_0801C12C:
	ldr r0, _0801C148  @ 0x00000103
	str r0, [sp]
	movs r0, #0
	movs r1, #0x14
	movs r2, #0x20
	movs r3, #0x50
	bl NewFace
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #2
	b _0801C182
	.align 2, 0
_0801C148: .4byte 0x00000103
_0801C14C:
	movs r0, #0xff
	ands r2, r0
	adds r0, r2, #0
	movs r1, #0x64
	bl __umodsi3
	adds r1, r0, #1
	ldr r0, _0801C194  @ 0x00000103
	str r0, [sp]
	movs r0, #0
	movs r2, #0x20
	movs r3, #0x50
	bl NewFace
	ldr r0, [sp, #0x10]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	lsrs r0, r0, #8
	movs r1, #0x64
	bl __umodsi3
	adds r1, r0, #1
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
_0801C182:
	movs r2, #0xd0
	movs r3, #0x50
	bl NewFace
	movs r0, #0
	add sp, #0x14
	pop {r1}
	bx r1
	.align 2, 0
_0801C194: .4byte 0x00000103

	THUMB_FUNC_START sub_801C198
sub_801C198: @ 0x0801C198
	push {lr}
	movs r0, #0
	bl DeleteFaceByIndex
	movs r0, #1
	bl DeleteFaceByIndex
	ldr r2, _0801C1D4  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _0801C1D8  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	pop {r1}
	bx r1
	.align 2, 0
_0801C1D4: .4byte gLCDControlBuffer
_0801C1D8: .4byte gPaletteBuffer

	THUMB_FUNC_START sub_801C1DC
sub_801C1DC: @ 0x0801C1DC
	push {lr}
	bl sub_8000D28
	bl InitRN
	bl ClearUnits
	movs r3, #1
	negs r3, r3
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_80A4E70
	ldr r0, _0801C21C  @ 0x0000026A
	bl GetStringFromIndex
	bl sub_80314EC
	ldr r1, _0801C220  @ gUnknown_0202BCF0
	movs r0, #1
	strb r0, [r1, #0xe]
	movs r0, #0
	bl SaveGame
	bl sub_8031214
	bl sub_8009FD4
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
_0801C21C: .4byte 0x0000026A
_0801C220: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_801C224
sub_801C224: @ 0x0801C224
	push {lr}
	adds r3, r1, #0
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, #2
	adds r0, #0x2d
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r2, #0xb
	adds r0, r3, #0
	bl sub_801C65C
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_801C248
sub_801C248: @ 0x0801C248
	push {r4, lr}
	adds r4, r1, #0
	bl sub_8000D28
	bl InitRN
	bl ClearUnits
	ldr r0, _0801C278  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C27C
	movs r3, #1
	negs r3, r3
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl sub_80A4E70
	b _0801C28A
	.align 2, 0
_0801C278: .4byte gKeyStatusPtr
_0801C27C:
	movs r3, #1
	negs r3, r3
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_80A4E70
_0801C28A:
	ldr r0, _0801C2C4  @ 0x0000026A
	bl GetStringFromIndex
	bl sub_80314EC
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_801C650
	ldr r1, _0801C2C8  @ gUnknown_0202BCF0
	strb r0, [r1, #0xe]
	ldr r0, _0801C2CC  @ gUnknown_03001780
	ldrb r0, [r0]
	strb r0, [r1, #0x1b]
	movs r0, #0
	bl SaveGame
	bl sub_8031214
	bl nullsub_9
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801C2C4: .4byte 0x0000026A
_0801C2C8: .4byte gUnknown_0202BCF0
_0801C2CC: .4byte gUnknown_03001780

	THUMB_FUNC_START sub_801C2D0
sub_801C2D0: @ 0x0801C2D0
	push {lr}
	ldr r0, _0801C2E0  @ gUnknown_0859D01C
	bl NewMenu_Default
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801C2E0: .4byte gUnknown_0859D01C

	THUMB_FUNC_START sub_801C2E4
sub_801C2E4: @ 0x0801C2E4
	push {lr}
	ldr r0, _0801C2F4  @ gUnknown_0859CFD4
	bl NewMenu_Default
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801C2F4: .4byte gUnknown_0859CFD4

	THUMB_FUNC_START sub_801C2F8
sub_801C2F8: @ 0x0801C2F8
	push {lr}
	movs r0, #3
	bl Make6C_savemenu2
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_801C308
sub_801C308: @ 0x0801C308
	movs r0, #2
	bx lr

	THUMB_FUNC_START sub_801C30C
sub_801C30C: @ 0x0801C30C
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	bne _0801C320
	movs r0, #4
	bl SaveSuspendedGame
	movs r0, #0x17
	b _0801C322
_0801C320:
	movs r0, #8
_0801C322:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_801C328
sub_801C328: @ 0x0801C328
	push {lr}
	movs r0, #4
	bl sub_80A5DA8
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801C33A
	movs r1, #1
_0801C33A:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_801C340
sub_801C340: @ 0x0801C340
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	beq _0801C34E
	movs r0, #8
	b _0801C368
_0801C34E:
	ldr r0, _0801C36C  @ gUnknown_0859A1F0
	bl Proc_Find
	cmp r0, #0
	beq _0801C35C
	bl sub_80311F0
_0801C35C:
	movs r0, #4
	bl LoadSuspendedGame
	bl RestartGameAndGoto8
	movs r0, #0x17
_0801C368:
	pop {r1}
	bx r1
	.align 2, 0
_0801C36C: .4byte gUnknown_0859A1F0

	THUMB_FUNC_START sub_801C370
sub_801C370: @ 0x0801C370
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	beq _0801C37E
	movs r0, #8
	b _0801C392
_0801C37E:
	ldr r0, _0801C398  @ gUnknown_0859A1F0
	bl Proc_Find
	cmp r0, #0
	beq _0801C38C
	bl sub_80311F0
_0801C38C:
	bl RestartGameAndGoto12
	movs r0, #0x17
_0801C392:
	pop {r1}
	bx r1
	.align 2, 0
_0801C398: .4byte gUnknown_0859A1F0

	THUMB_FUNC_START sub_801C39C
sub_801C39C: @ 0x0801C39C
	push {lr}
	movs r0, #3
	bl sub_80A5DA8
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801C3AE
	movs r1, #1
_0801C3AE:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_801C3B4
sub_801C3B4: @ 0x0801C3B4
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	bne _0801C3CC
	movs r0, #3
	bl LoadSuspendedGame
	bl RestartGameAndGoto8
	movs r0, #0x17
	b _0801C3CE
_0801C3CC:
	movs r0, #8
_0801C3CE:
	pop {r1}
	bx r1

	THUMB_FUNC_START DebugMenu_FogDraw
DebugMenu_FogDraw: @ 0x0801C3D4
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r5, #0
	bl Text_Clear
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertString
	ldr r2, _0801C43C  @ gUnknown_0859AA7C
	ldr r0, _0801C440  @ gUnknown_0202BCF0
	ldrb r1, [r0, #0xd]
	negs r0, r1
	orrs r0, r1
	asrs r0, r0, #0x1f
	movs r1, #4
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertString
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801C444  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801C43C: .4byte gUnknown_0859AA7C
_0801C440: .4byte gUnknown_0202BCF0
_0801C444: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START DebugMenu_FogIdle
DebugMenu_FogIdle: @ 0x0801C448
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl DoesBMXFADEExist
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C4A6
	ldr r0, _0801C480  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	cmp r0, #0
	beq _0801C4A6
	ldr r4, _0801C484  @ gUnknown_0202BCF0
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _0801C498
	bl GetChapterThing
	cmp r0, #2
	bne _0801C488
	movs r0, #3
	bl sub_801E2E0
	b _0801C49E
	.align 2, 0
_0801C480: .4byte gKeyStatusPtr
_0801C484: .4byte gUnknown_0202BCF0
_0801C488:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xc]
	bl sub_801E2E0
	b _0801C49E
_0801C498:
	movs r0, #0
	bl sub_801E2E0
_0801C49E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl DebugMenu_FogDraw
_0801C4A6:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START DebugMenu_FogEffect
DebugMenu_FogEffect: @ 0x0801C4B0
	movs r0, #0
	bx lr

	THUMB_FUNC_START sub_801C4B4
sub_801C4B4: @ 0x0801C4B4
	push {lr}
	bl NewGameControl
	movs r0, #7
	pop {r1}
	bx r1

	THUMB_FUNC_START DebugMenu_GNightEffect
DebugMenu_GNightEffect: @ 0x0801C4C0
	push {lr}
	movs r0, #0xc0
	lsls r0, r0, #2
	bl sub_8001CB0
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_START DebugChargeMenu_Draw
DebugChargeMenu_Draw: @ 0x0801C4D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r1, _0801C508  @ gUnknown_080D7A88
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r4, sp, #4
	ldr r1, _0801C50C  @ gUnknown_080D7A8C
	adds r0, r4, #0
	movs r2, #6
	bl memcpy
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r4, #0
	cmp r0, #0
	beq _0801C514
	ldr r0, _0801C510  @ gUnknown_0202BCF0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801C51C
	.align 2, 0
_0801C508: .4byte gUnknown_080D7A88
_0801C50C: .4byte gUnknown_080D7A8C
_0801C510: .4byte gUnknown_0202BCF0
_0801C514:
	ldr r0, _0801C580  @ gUnknown_0202BCF0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801C51C:
	lsrs r6, r0, #0x1e
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl Text_InsertString
	lsls r0, r6, #1
	adds r0, r7, r0
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #2
	bl Text_InsertString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801C584  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801C580: .4byte gUnknown_0202BCF0
_0801C584: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START DebugChargeMenu_Idle
DebugChargeMenu_Idle: @ 0x0801C588
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r2, _0801C5B8  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _0801C62E
	adds r0, r6, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _0801C5C0
	ldr r1, _0801C5BC  @ gUnknown_0202BCF0
	adds r0, r1, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801C5CA
	.align 2, 0
_0801C5B8: .4byte gKeyStatusPtr
_0801C5BC: .4byte gUnknown_0202BCF0
_0801C5C0:
	ldr r1, _0801C610  @ gUnknown_0202BCF0
	adds r0, r1, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801C5CA:
	lsrs r2, r0, #0x1e
	adds r3, r1, #0
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801C5DC
	subs r2, #1
_0801C5DC:
	movs r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0801C5E6
	adds r2, #1
_0801C5E6:
	cmp r2, #2
	ble _0801C5EC
	movs r2, #2
_0801C5EC:
	cmp r2, #0
	bge _0801C5F2
	movs r2, #0
_0801C5F2:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0801C614
	adds r3, #0x43
	movs r0, #3
	ands r2, r0
	lsls r2, r2, #1
	ldrb r1, [r3]
	movs r0, #7
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	b _0801C626
	.align 2, 0
_0801C610: .4byte gUnknown_0202BCF0
_0801C614:
	adds r3, #0x42
	movs r0, #3
	ands r2, r0
	lsls r2, r2, #7
	ldrh r1, [r3]
	ldr r0, _0801C638  @ 0xFFFFFE7F
	ands r0, r1
	orrs r0, r2
	strh r0, [r3]
_0801C626:
	adds r0, r7, #0
	adds r1, r6, #0
	bl DebugChargeMenu_Draw
_0801C62E:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801C638: .4byte 0xFFFFFE7F

	.align 2, 0 @ Don't pad with nop.
