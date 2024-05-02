	.cpu cortex-m4
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"preprocessor.c"
	.text
	.data
	.align	2
	.type	var2, %object
	.size	var2, 4
var2:
	.word	10
	.global	var3
	.bss
	.align	2
	.type	var3, %object
	.size	var3, 4
var3:
	.space	4
	.global	var4
	.data
	.align	2
	.type	var4, %object
	.size	var4, 4
var4:
	.word	10
	.text
	.align	1
	.global	main
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r3, .L3
	movs	r2, #2
	str	r2, [r3]
	movs	r1, #3
	movs	r0, #2
	bl	add
	str	r0, [r7, #4]
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	var
	.size	main, .-main
	.align	1
	.global	add
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add, %function
add:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	add	r3, r3, r2
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	add, .-add
	.ident	"GCC: (GNU Arm Embedded Toolchain 10-2020-q4-major) 10.2.1 20201103 (release)"
