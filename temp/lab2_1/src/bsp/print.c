
#include <stdarg.h>
#include "prt_typedef.h"

#define UART_0_REG_BASE 0x09000000 // pl011 设备寄存器地址
// 寄存器及其位定义参见：https://developer.arm.com/documentation/ddi0183/g/programmers-model/summary-of-registers
#define DW_UART_THR 0x00 // UARTDR(Data Register) 寄存器
#define DW_UART_FR 0x18  // UARTFR(Flag Register) 寄存器
#define DW_UART_LCR_HR 0x2c  // UARTLCR_H(Line Control Register) 寄存器
#define DW_XFIFO_NOT_FULL 0x020  // 发送缓冲区满置位
#define DW_FIFO_ENABLE 0x10 // 启用发送和接收FIFO

#define UART_BUSY_TIMEOUT   1000000
#define OS_MAX_SHOW_LEN 0x200


#define UART_REG_READ(addr)          (*(volatile U32 *)(((uintptr_t)addr)))  // 读设备寄存器
#define UART_REG_WRITE(value, addr)  (*(volatile U32 *)((uintptr_t)addr) = (U32)value) // 写设备寄存器


#define TX_REG_EMPTY_FLAG    (1 << 7)  // TXFE位（单字节模式下寄存器空）
#define enable_fifo 0 //修改此处：切换数据发送模式 1为fifo 0为单字节

U32 PRT_UartInit(void)

{

    U32 result = 0;
    U32 reg_base = UART_0_REG_BASE;

    result = UART_REG_READ((unsigned long)(reg_base + DW_UART_LCR_HR));//读取LCR寄存器
    if(enable_fifo)
    {
        result|=DW_FIFO_ENABLE;
    }
    else{
        result&=~DW_FIFO_ENABLE;
    }
    UART_REG_WRITE(result , (unsigned long)(reg_base + DW_UART_LCR_HR)); // 启用 FIFO
    //按位或,将FEN位置1或 0
  
    return OS_OK;

}

// 读 reg_base + offset 寄存器的值。 uartno 参数未使用
S32 uart_reg_read(S32 uartno, U32 offset, U32 *val)
{
    S32 ret;
    U32 reg_base = UART_0_REG_BASE;


    *val = UART_REG_READ((unsigned long)(reg_base + offset));
    return OS_OK;
}

// 通过检查 FR 寄存器的标志位确定发送缓冲是否满，满时返回1.
S32 uart_is_txfifo_full(S32 uartno)
{
    S32 ret;
    U32 usr = 0;
  
    ret = uart_reg_read(uartno, DW_UART_FR, &usr);//ret表示函数调用是否成功
    if (ret) {
       return OS_OK;
    }
    
    if(enable_fifo)
    return (usr & DW_XFIFO_NOT_FULL ); //fifo:已满时返回1
    else
    return !(usr & TX_REG_EMPTY_FLAG);//单字节:已满时返回0

}
// 往 reg_base + offset 寄存器中写入值 val。
void uart_reg_write(S32 uartno, U32 offset, U32 val)
{
    S32 ret;
    U32 reg_base = UART_0_REG_BASE;

    UART_REG_WRITE(val, (unsigned long)(reg_base + offset));
    return;
}

// 通过轮询的方式发送字符到串口
void uart_poll_send(unsigned char ch)
{

    S32 timeout = 0;
    S32 max_timeout = UART_BUSY_TIMEOUT;

    // 轮询发送缓冲区是否满
    int result = uart_is_txfifo_full(0);
    while (result) {
        timeout++;
        if (timeout >= max_timeout) {
            return;
        }
        result = uart_is_txfifo_full(0);
    }

    // 如果缓冲区没满，通过往数据寄存器写入数据发送字符到串口
    uart_reg_write(0, DW_UART_THR, (U32)(U8)ch);
    return;
}

// 轮询的方式发送字符到串口，且转义换行符
void TryPutc(unsigned char ch)
{
    uart_poll_send(ch);
    if (ch == '\n') {
        uart_poll_send('\r');
    }
}

extern int  vsnprintf_s(char *buff, int buff_size, int count, char const *fmt, va_list arg);
int TryPrintf(const char *format, va_list vaList)
{
    int len;
    char buff[OS_MAX_SHOW_LEN];
    for(int i = 0; i < OS_MAX_SHOW_LEN; i++) {
        buff[i] = 0;
    }
    char *str = buff;

    len = vsnprintf_s(buff, OS_MAX_SHOW_LEN, OS_MAX_SHOW_LEN, format, vaList);
    if (len == -1) {
        return len;
    }

    while (*str != '\0') {
        TryPutc(*str);
        str++;
    }

    return OS_OK;
}

U32 PRT_Printf(const char *format, ...)
{
    va_list vaList;
    S32 count;

    va_start(vaList, format);
    count = TryPrintf(format, vaList);
    va_end(vaList);

    return count;
}
