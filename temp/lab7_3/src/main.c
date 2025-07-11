#include "prt_typedef.h"
#include "prt_tick.h"
#include "prt_task.h"
#include "prt_sem.h"

extern U32 PRT_Printf(const char *format, ...);
extern void PRT_UartInit(void);
extern U32 OsActivate(void);
extern U32 OsTskInit(void);
extern U32 OsSemInit(void);


static SemHandle sem_sync;


volatile U32 counter = 0;
void Test1TaskEntry()
{
    for (int i = 0; i < 10000; i++) {
        U32 temp = counter;
        temp++;
        counter = temp;
         int delay_time = 10000;  // 根据自己机器计算能力不同调整该值
        while(delay_time>0){
            PRT_TickGetCount();  //消耗时间，防止延时代码被编译器优化
            delay_time--;
        }
    }
    PRT_Printf("Task 1 done, counter = %u\n", counter);
}

void Test2TaskEntry()
{
     for (int i = 0; i < 10000; i++) {
        U32 temp = counter;
        temp++;
        counter = temp;
         int delay_time = 10000;  // 根据自己机器计算能力不同调整该值
        while(delay_time>0){
            PRT_TickGetCount();  //消耗时间，防止延时代码被编译器优化
            delay_time--;
        }
    }
    PRT_Printf("Task 2 done, counter = %u\n", counter);
}

S32 main(void)
{
    // 任务模块初始化
    OsTskInit();
    OsSemInit(); // 参见demos/ascend310b/config/prt_config.c 系统初始化注册表

    PRT_UartInit();

    PRT_Printf("            _       _ _____      _             _             _   _ _   _ _   _           \n");
    PRT_Printf("  _ __ ___ (_)_ __ (_) ____|   _| | ___ _ __  | |__  _   _  | | | | \\ | | | | | ___ _ __ \n");
    PRT_Printf(" | '_ ` _ \\| | '_ \\| |  _|| | | | |/ _ \\ '__| | '_ \\| | | | | |_| |  \\| | | | |/ _ \\ '__|\n");
    PRT_Printf(" | | | | | | | | | | | |__| |_| | |  __/ |    | |_) | |_| | |  _  | |\\  | |_| |  __/ |   \n");
    PRT_Printf(" |_| |_| |_|_|_| |_|_|_____\\__,_|_|\\___|_|    |_.__/ \\__, | |_| |_|_| \\_|\\___/ \\___|_|   \n");
    PRT_Printf("                                                     |___/                               \n");

    PRT_Printf("ctr-a h: print help of qemu emulator. ctr-a x: quit emulator.\n\n");

    U32 ret;
    ret = PRT_SemCreate(0, &sem_sync);
    if (ret != OS_OK) {
        PRT_Printf("failed to create synchronization sem\n");
        return 1;
    }

    struct TskInitParam param = {0};

    // task 1
    // param.stackAddr = 0;
    param.taskEntry = (TskEntryFunc)Test1TaskEntry;
    param.taskPrio = 30;
    // param.name = "Test1Task";
    param.stackSize = 0x1000; //固定4096，参见prt_task_init.c的OsMemAllocAlign

    TskHandle tskHandle1;
    ret = PRT_TaskCreate(&tskHandle1, &param);
    if (ret) {
        return ret;
    }

    ret = PRT_TaskResume(tskHandle1);
    if (ret) {
        return ret;
    }

    // task 2
    // param.stackAddr = 0;
    param.taskEntry = (TskEntryFunc)Test2TaskEntry;
    param.taskPrio = 30;
    // param.name = "Test2Task";
    param.stackSize = 0x1000; //固定4096，参见prt_task_init.c的OsMemAllocAlign

    TskHandle tskHandle2;
    ret = PRT_TaskCreate(&tskHandle2, &param);
    if (ret) {
        return ret;
    }

    ret = PRT_TaskResume(tskHandle2);
    if (ret) {
        return ret;
    }

    // 启动调度
    OsActivate();

    // while(1);
    return 0;

}
