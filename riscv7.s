# given 2 arrays the sum of the two arrays to be in a vector using functions


.data
	vector1: .word -1, 5, 2, 4, 6
	vector2: .word 1, 2, 3, 4, 5
	vector_res: .space 20
	#length: .byte 5 # number of integers in the vector  .--- get this from the function 
	
.text
.global _start
_start:
	la a0,vector1    # a0 points to the current element of vector 1
	la a1, vector2   # a1 points to the current element of vector 2
	la a2, vector_res   # a3 points to the current element of vector_res
 	
	sub a3, a2, a1  # a3 holds the size of the vector which will be multiplied by 4 
 	
 	call sum_vec
 	
 	
	# syscall to write a number
	# li a0, value 
	li a7, 1
	ecall

# exit(value)			
    # li a0, value	# exit status: max   
	li a7, 93	# syscall number for exit
    ecall
    

# a0: vector1's address
# a1: vector2's address
# a2: vector_res's address
# return to a0 
sum_vec:
	
	    # the size of the vector which is multiplied by 4
loop: 	
          # a5 to store the vec_result address
	beqz a3,endloop
	lw t4, 0(a0) 	 # t4 vector1[i]
	lw t5, 0(a1)	# t5 vector2[i]	
	add t6, t4, t5	# t6 hold the sum of the two vectors -- vector1[i] + vector2[i]
	sw t6, 0(a2) 	# store the value to memory
	#now we advance 
	addi a0 , a0, 4
	addi a1,a1, 4
	addi a2,a2,4
	#decrement our counter by 4 
	addi a3,a3,-4	
	j loop
endloop:
	
	ret	

 
    
    