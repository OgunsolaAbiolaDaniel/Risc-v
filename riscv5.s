#Write a program that adds the contents of two vectors and saves the result in a third one. As a starting
#point, use the following data segment and verify your code by executing in stepwise mode:
# counter, move all counter at the same time i.e increment at same time 

# buggy
.data
 vector1: .word -1, 5, 1, 1, 4
 vector2: .word 1, 3, -1, 5, 9
 vecresult: .space 20 # number of bytes for 5 integers
 length: .byte 5 # number of integers in the vector


.text 
.global_start

_start: 
la a1, vector1
la a2, vector2
la a3, vecresult

la a4 ,length
lb a4, 0(a4)

li t1 , 0 #counter

#if statement for our loop

L: bge t1, a4, END
lw t2, 0(a1)
lw t3, 0(a2)
add t4,t2,t3 # now add
sw t4, 0(a3)#now save  to vecresult 

#now to increment all 
addi a1, a1,4 
addi a2, a2, 4


addi a3,a3, 4
addi t1, t1, 1

j L

END : 
la t5 , vecresult
li a5,0 

bge a5, a4 , end
lw a6, 0(t5)
add a0, zero, a6
li a7, 1
ecall

addi t5,t5,4
addi a5, a5 ,1
end:nop 
j END

li a7 , 10 # exit syscall 
ecall 