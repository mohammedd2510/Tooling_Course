// Header Guard File
#ifndef STD_TYPES_H
#define STD_TYPES_H

// typedef new_datatype old_datatype
typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned int u32;
typedef unsigned long long int u64;

typedef signed char s8;
typedef signed short int s16;
typedef signed int s32;

typedef float f32;
typedef double f64;

typedef void (*pCallBackNotification)(void);

typedef void (*PtrFunction)(void);
#define NULL 0

#define ZERO_INIT 0

#endif
