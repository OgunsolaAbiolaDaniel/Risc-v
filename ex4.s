
.data
  msg1: .ascii "Hello \n\0"
  msg2: .ascii "Tuesdays \n\0"
  
.text
.global _start
    
_start: 
	# syscall to write msg1
    la a0, msg1
    li a7, 4        
    ecall
    
    
    call caps  # function
    
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
caps:

loop:	lb a1, (a0)       # load the address of a1
	beqz a1, end      # check if a1 = 0 i.e null terminator
	addi a0,a0, 1     # advance to the next char
	 # recall small acii letters are between 97 and 122 +32
	# check if a1 is between 97 and 122 i.e less than 97 and greater or equal to 65
	# between 65 and 97 means capital letter so do nothing else minus
	
	li a2, 97	# 'a'
	li a3, 122	# 'z'
	
	blt a1, a2, loop     # check if a1 is less than a2(a) --do nothing
	bgt  a1, a3, loop     # check if a1 is greater than a3(z) do nothing
	addi a1, a1,-32	      # else minus 32 to get the capital  and save it to a1
	sb a1,(a0)
	 
	j loop      # now  to advance to the next char which is a byte 
end:	
	ret
	
