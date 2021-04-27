.global lab1
.syntax unified
#define A #1
#define B #3
#define C #2

lab1:
	push {lr}
	mov r0, A
	mov r1, B
	mov r2, C

	add r3, r0, r1
	sdiv r3, r2
	mvn r2, r2
	add r3, r2
	pop {pc}
