#Write a program in RISC-V assembly language that adds the elements of a vector. As a starting point,

#use the following data segment, and verify your code by executing in stepwise mode:

.data

 vector: .word -1, 5, 1, 1, 4

 length: .byte 5 # number of integers in the vector

 sum: .word 0 # must contain the sum of all elements in vector
 
 
 .text
 .global main
 main: 
 
la t0, vector
la t1, length
lb t1, 0(t1)
la t2, sum 
lw a4, 0(t2)#sum value
li a2, 0 # counter 

loop : bge a2,t1,endloop 
lw t3, 0(t0)# vector[i]

add a4 , a4 , t3,# put in a4(sum) = a4 + vector [i]
addi t0 , t0, 4 # increment the memaddress for vector[i+1]
addi a2, a2, 1 # increment counter;
j loop
endloop : 
sw a4, 0(t2)


la t6, sum
lw, t6,0(t6)
   
 mv a0,t6 #the add the number to be printed here 
 li a7, 1 
 ecall 
 
 li a7 , 10
 ecall