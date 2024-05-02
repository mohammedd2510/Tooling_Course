/*
******************************************************************************
**
** @file        : STM32F401CCU6_LinkerScript.ld
**
** @author      : Eng. Mohamed Osama
**
** @brief       : Linker script for STM32F401CCU6 Device from STM32F4 series
**                      256KBytes FLASH
**                      64KBytes RAM
**
**                Set heap size, stack size and stack location according
**                to application requirements.
**
**  Target      :  STM32F401CCU6
**
*******************************************************************************
*/

/* Highest address of the user mode stack */
_estack = ORIGIN(RAM) + LENGTH(RAM); /* end of "RAM" Ram type memory */
_Min_Heap_Size  = 0x200;             /* Required amount of heap */
_Min_Stack_Size = 0x400;             /* Required amount of stack */

/* Memories definition -> Label_Name(AttributeList) : ORIGIN = StartMemoryAddress,   LENGTH = MemoryLength */
MEMORY
{
    RAM     (xrw)   : ORIGIN = 0x20000000,      LENGTH = 64K
    FLASH   (rx)    : ORIGIN = 0x08000000,      LENGTH = 256K
}

/* Sections */

SECTIONS
{
    /* The startup code into "FLASH" Rom type memory */
    .isr_vectors :
    {
        . = ALIGN(4);
        KEEP(*(.isr_vectors))     /* Interrupt vectors */
        /* 
         * This section is here for convenience, to store the
         * startup code at the beginning of the flash area, hoping that
         * this will increase the readability of the listing.
         */
        KEEP(*(.after_vectors))   /* Startup code and ISR */
        . = ALIGN(4);
    } > FLASH
    /* .text section, The program code and other data into "FLASH" Rom type memory */
    .text :
    {
        . = ALIGN(4);
        *(.text)           /* .text sections (code) */
        *(.text*)          /* .text* sections (code) */
        *(.init)           /* .init sections */
        *(.fini)           /* .fini sections */
        . = ALIGN(4);
        _etext = .;        /* define a global symbols at end of code */
    } >FLASH
    /* Constant data into "FLASH" Rom type memory */
    .rodata :
    {
       . = ALIGN(4);
        *(.rodata)         /* .rodata sections (constants, strings, etc.) */
        *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
        . = ALIGN(4);
    } >FLASH

    /* Used by the startup to initialize data */
    _sidata = LOADADDR(.data);

      /* Initialized data sections into "RAM" Ram type memory */
    .data :
    {

        . = ALIGN(4);
        _sdata = . ;       /* create a global symbol at data start */
        *(.data)           /* .data sections */
        *(.data*)          /* .data* sections */

        . = ALIGN(4);
        _edata = .;        /* define a global symbol at data end */

    } > RAM AT> FLASH

      /* Uninitialized data section into "RAM" Ram type memory */
    .bss :
    {
        . = ALIGN(4);
        /* This is used by the startup in order to initialize the .bss section */
        _sbss = .;         /* create a global symbol at bss start */
        __bss_start__ = _sbss;
        *(.bss)            /* .bss sections */
        *(.bss*)           /* .bss* sections */
        . = ALIGN(4);
        _ebss = .;         /* define a global symbol at bss end */
        __bss_end__ = _ebss;
        end = .;
    } > RAM
   
    /* User_heap_stack section, used to check that there is enough "RAM" Ram  type memory left */
  ._user_heap_stack :
  {
    . = ALIGN(8);
    . = . + _Min_Heap_Size;
    . = . + _Min_Stack_Size;
    . = ALIGN(8);
  } >RAM

}