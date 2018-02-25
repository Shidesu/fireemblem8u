#include "global.h"
#include "functions.h"
#include "proc.h"

void StoreIRQToIRAM();

void AgbMain()
{
    int waitCnt;
    DmaFill32(3, 0, (void *)IWRAM_START, 0x7F80); // reset the area for the IWRAM ARM section.
    CpuFastFill(0, (void *)EWRAM_START, 0x01040000);    
    waitCnt = (REG_WAITCNT != 0);
    sub_8001C5C(waitCnt);
    if(waitCnt == TRUE)
        RegisterRamReset(~2);
    REG_WAITCNT = 0x45B4;
    StoreIRQToIRAM();
    SetInterrupt_LCDVBlank(0);
    REG_DISPSTAT = 8;
    REG_IME = 1;
    ResetKeyStatus(gUnknown_0858791C);
    UpdateKeyStatus(gUnknown_0858791C);
    StoreRoutinesToIRAM();
    sub_80A2C3C();
    Proc_Initialize();
    TCS_ClearAll();
    ResetMoveunitStructs();
    SetOtherRNState(0x42D690E9);
	GetOtherRN();
    sub_8000BC8();
    sub_8000D0C();
    sub_80A7374();
    sub_80A40A8();
    m4aSoundInit();
    sub_80028D0();
    SetInterrupt_LCDVBlank(GeneralVBlankHandler);
    sub_80BC81C();
    SetSomeByte(1);
    Font_InitForUIDefault();
    NewGameControl();

    // perform the game loop.
    while(1) {
        ExecMainUpdate();
        sub_8001C78();
    };
}
