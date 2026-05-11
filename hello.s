.data
  msg: .asciz "Hello world! how are you today gj  kyhk kyiu yiu\n" 
  # msg: .byte 'H','e','l','l','o',' ','w','o','r','l','d','!','\n'

.text
.global _start

_start:
    # code for the system call “write(int fd, const void *buf, size_t count)”:
    li a0, 1          # file descriptor (stdout is represented by code 1)
    la a1, msg        # message’s address
    mv a3, a1
whileloop:
    lb t1,(a3)
    beqz t1,EL
    addi a3, a3,1
    j whileloop
     
 EL:
 sub a2,a3,a1
#  li a2, 13         # message’s length
li a7, 64       # syscall number for the write operation
    ecall
    
    # code for the system call “exit(int status)”:
    li a0, 0          # exit status
    li a7, 93         # syscall number for exiting the program
    ecall
 
 
 
 
    