.data
    vector: .word -1, 5, 1, 1, 4
    length: .byte 5 # number of integers in the vector
    sum:    .word 0  # must contain the sum of all elements in vector
    max : .word 0 #to store the maximum
.text
.global _start

_start:
   la t0, vector # vector address
   la t1, length
   lb t1, 0(t1)#val of length = 5
   la t2, max # max address
   lw a3,0(t0)   # maxvalue
   addi t0,t0,4 #to set it to the next 
 
   li a4, 1 	#counter
   
   FORLOOP : 
  	 bge  a4, t1, endloop
  	 lw t3, 0(t0)
  	 
  IFCOND:
  	 bge a3,t3, next
  	 add a3,zero, t3
  	
  	 next : nop
  	 addi t0,t0,4
  	addi a4, a4, 1	
  	j FORLOOP 
   
   endloop :
   sw a3,0(t2)
   
    
   
   
 
 
 
   
   
   
   
   
   
   
   

    # code for the system call exit(int status):
    li a0, 0          # exit status
    li a7, 93         # syscall number for exiting the program
    ecall
    
