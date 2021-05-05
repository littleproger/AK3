.syntax unified
.cpu cortex-m4
//.fpu softvfp
.thumb

#define A #2
#define B #2
#define C #2

// Global memory locations.
.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
     .word __stack_start
     .word __kernel_reset__+1
     .size vtable_kernel, .-vtable_kernel

.section .rodata
     data: .asciz "kernel started!\n"
        final: .asciz "Value in register #7: "
        ent: .asciz "ENTER"
.section .text

__kernel_reset__:
    ldr r0, =data
      bl dbgput_line

     // calculate
      mov r0, A
      mov r1, B
      mov r2, C
      add r3, r0, r1
      mov r8, 2
      sdiv r4, r3, r8
      add r7, r4, 2
        
      ldr r0, =final
      bl dbgput
      mov r0, r7
      bl dbgput_num

     end:
     b end
