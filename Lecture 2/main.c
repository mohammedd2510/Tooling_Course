/**
 ******************************************************************************
 * @file           : main.c
 * @author         : Auto-generated by STM32CubeIDE
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2024 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */

#include "RCC_interface.h"
#include "SYSTICK_interface.h"
#include "GPIO_interface.h"
//#include "my_pic.h"

// ----------------------------------------------------------------------------
u32 counter;

int main(void)
{

	RCC_voidEnablePeripheralClock(RCC_AHB,RCC_AHB_GPIOAEN);
	GPIO_voidSetPinMode(GPIO_PORTA,GPIO_PIN0,GPIO_OUTPUT_PIN_MODE);


	while(1)
	{
		GPIO_voidSetPinValue(GPIO_PORTA,GPIO_PIN0,GPIO_HIGH);
		MSysTick_voidSetBusyWait(1000000);
		GPIO_voidSetPinValue(GPIO_PORTA,GPIO_PIN0,GPIO_LOW);
		MSysTick_voidSetBusyWait(1000000);

	}
}
