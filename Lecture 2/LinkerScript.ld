/*
******************************************************************************
**
** @file        : LinkerScript.ld
**
** @author      : Eng.Mohamed Osama
**
** @brief       : Linker script for STM32F401CCUx Device from STM32F4 series
**                      256KBytes FLASH
**                      64KBytes RAM
**
**                Set heap size, stack size and stack location according
**                to application requirements.
**
**                Set memory bank area and size if external memory is used
**
**  Target      : STMicroelectronics STM32
**
**
******************************************************************************
*/
/* Highest address of the user mode stack */
_estack = ORIGIN(SRAM) + LENGTH(SRAM); /* end of "RAM" Ram type memory */
_Min_Heap_Size  = 0x200;             /* Required amount of heap */
_Min_Stack_Size = 0x400;             /* Required amount of stack */

ENTRY(Reset_Handler)
MEMORY 
{
    FLASH(rx): ORIGIN = 0x08000000, LENGTH = 256K
    SRAM (rxw): ORIGIN = 0x20000000 , LENGTH = 64K
}
SECTIONS
{
    .isr_vector :
    {
        KEEP(*(.isr_vector))
        KEEP(*(.isr_vector*))
        /* 
         * This section is here for convenience, to store the
         * startup code at the beginning of the flash area, hoping that
         * this will increase the readability of the listing.
         */
        KEEP(*(.after_vectors))   /* Startup code and ISR */        
    }> FLASH
    .text :
    {
        . = ALIGN(4);
        s_text = .;
        *(.text)
        *(.text*)
        . = ALIGN(4);
        e_text = .;  
    }> FLASH
    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
    }> FLASH
    _sidata = LOADADDR(.data);
    .data :
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    }> SRAM AT > FLASH
    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(.bss*)
        . = ALIGN(4);
        _ebss = .;
    }> SRAM
    .user_heap_stack :
    {
        . = ALIGN(8);
        . = . + _Min_Heap_Size;
        . = . + _Min_Stack_Size;
        . = ALIGN(8);
    }> SRAM   
}