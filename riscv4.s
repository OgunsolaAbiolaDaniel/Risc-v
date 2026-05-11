# Adapt your code in the previous example to write a new program that calculates the biggest integer in
# the vector and leaves the result in a variable named major. 


.data

 vector: .word -1, 5, 1, 1, 4

 length: .byte 5 # number of integers in the vector
  major: .word 0 
 

.text 
 
.global main

main: 
la t0 , vector
la t1, length
lb t1, 0(t1) #length
la t2, major # max
lw a3, 0(t0) # arr[0]-- current-max
addi t0, t0, 4
li a2, 1 #counter

L: 
	bge a2 , t1, ENDLOOP
	lw t3, 0(t0)

	blt t3, a3 ,next
	add a3,zero ,t3

	next : nop

	addi t0, t0, 4
	addi a2, a2, 1
		j L 

ENDLOOP:
sw a3, 0(t2)


la a4, major
lw a4, 0(a4)

mv a0 , a4
li a7 , 1
ecall 


li a7 , 10
ecall
 