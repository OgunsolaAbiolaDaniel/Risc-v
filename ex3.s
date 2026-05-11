
.data
	vector: .word -1, 5
	length: .byte 2 # number of integers in the vector
	major:	.word 0 # must contain the biggest of all elements in vector

.text
.global _start
_start:
	la a0,vector     # a0 points to the current element
 	lbu a1,length    # get vector length
 	call max_vec
 	sw a0,major,t4   # store major
 	
	# syscall to write a number
	# li a0, value 
	li a7, 1
	ecall

# exit(value)			
    # li a0, value	# exit status: max   
	li a7, 93	# syscall number for exit
    ecall
    

# a0: vector's address
# a1: number of integers in the vector
# a0: returns the max element in the vector
max_vec:
	
	lw a2,0(a0)    # set a2 as the current major
loop:
	addi a1,a1,-1  # decrement the counter
	beqz a1,endloop
	addi a0,a0,4
	lw a3,0(a0)    # the current element to be compared with major a2
	ble a3,a2,loop
	# means the current element(a3) is larger than the current major (a2)
	mv a2,a3      # set the max value as the current element
	j loop
endloop:
	mv a0, a2
	ret	

 
    
    
