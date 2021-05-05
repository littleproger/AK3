.global lab4 
.syntax unified 
#define X1 #18 
#define X2 #-9 
#define X3 #23 
#define X4 #11 
lab4: 
push {lr} 
mov r0, X1 
mov r1, #0 
mov r2, X2 
mov r3, #0xFFFFFFFF 
mov r4, X3 
mov r5, #0 
mov r6, X4
mov r7, #0 
bl calc 
pop {pc} 
calc: 
push {lr} 
orr r0, r2 // X1|X2 
orr r1, r3 
eors r0, #0xFFFFFFFF // not(X1|X2) 
eor r1, #0xFFFFFFFF 
lsrs r0, #2 // not(X1|X2)/4 
lsr r1, #2 
adds r4, #1 // 1+X3 
add r5, #1 
adds r4, r6 // 1+X3+X4 
add r5, r7 
mov r6, #2 
muls r4, r6 // 2*(1+X3+X4) 
mul r5, r6 
orr r0, r4 // X1|X2 
orr r1, r5 
bl task2 
pop {pc} 
push {lr}
bvc step2 
ror r0, #1 
step2: 
cmp r0, #0 // r0==0 
bne step3 
beq step4 
step3: 
mov r1, #0b0001111110101110 
step4: 
mov r2, #0b0001111110101110 
add r0, r2 
step5: 
and r3,r1,#0b100000000000000000000000
and r4,r1,#0b010000000000000000000000
lsl r4, #1 
cmp r3, r4 
beq step7 
step6: 
ror r0, #1 
step7: 
bvs finalyze // если переполнение 
push {r0} 
push {r1} 
pop {r1} 
pop {r0} 
task2: 
mov r0, #1 
mov r1, #11 
mov r2, #36 
mov r3, #6 
start1: 
tag1: 
add r0, #2 
tag2: 
sub r1, #9 
tag3: 
add r0, r1
tag4: 
cmp r0, r2 
bmi tag6 // if (r0<r2) (N=1) 
tag5:
lsl r1, #2
bl start2 
tag6: 
lsl r0, #1 
tag7: 
mov r3, r1 
tag8: 
cmp r1, r3 
bvc tag3 // overflow (V=0) tag9: // else 
mov r0, r3 
start2: 
tag10: 
sub r0, 2 
tag11: 
cmp r1, r3 
beq tag13 // if (r1!=r3) (Z=0) tag12: // else 
lsr r3, #1 
tag13: 
bl start3 
// other code 
tag14: 
// other code 
tag15: 
// other code 
start3: 
tag16: 
mov r1, r2 
tag17: 
lsl r2, #1 // r2=72 
bl finalyze 
finalyze: 
pop {pc}

