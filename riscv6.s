
.data
  msg1: .ascii "Hell123453o \n\0"
  msg2: .ascii "Tuesdays \n\0"
  
.text
.global _start
    
_start: 
	# syscall to write msg1
    la a0, msg1
    li a7, 4        
    ecall
    
    
    call replace  # function
    
    # syscall to write msg2
    la a0, msg2
    li a7, 4        
    ecall
    
    call caps

	# exit system call
    li a0, 0         # exit status
    li a7, 93 
    ecall       
   
# a0 has the address of the string 
replace:

loop:	
	lb a1, (a0)       # load the address of a1
	beqz a1, end      # check if a1 = 0 i.e null terminator
	addi a0,a0, 1     # advance to the next char
	 # recall small acii letters are between 97 and 122 +32
	# check if a1 is between 97 and 122 i.e less than 97 and greater or equal to 65
	# between 65 and 97 means capital letter so do nothing else minus
	
	li a2, 48	# '0'
	li a3, 57	# '9'
	li a4, 42	#'*'
	blt a1, a2, loop     # check if a1 is less than a2(a) --do nothing
	bgt  a1, a3, loop     # check if a1 is greater than a3() do nothing
	mv a1, a4     	  # else move a4(*) to a1			#replace with * 
	sb a1,(a0)
	 
	j loop      # now  to advance to the next char which is a byte 
end:	
	ret
	
