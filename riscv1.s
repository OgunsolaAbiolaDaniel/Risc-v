.data
  msg: .asciz "Hello world!" 
  # msg: .byte 'H','e','l','l','o',' ','w','o','r','l','d','!','\n'
length : .byte 0
.text
.global _start

_start : 
#TODO WRITE THE LENGTH OF THE STRING

la t0 , msg
la t1, length

li t3, 0
li t4 , 97
li t5, 122
li a6, 32

loop:
lb a2, (t0)
 beqz a2, endloop
 #change to capital letters 
 # check if its capital letter 
 blt a2,t4 ,next
 bgt a2, t5, next
sub a2,a2,a6
sb a2,(t0)
 next: nop


 addi t3,t3,1
 addi t0,t0,1
 j loop
 
 
endloop:
    sb t3, 0(t1)      # store length

    li a0, 1          # file descriptor 1 = stdout
    la a1, msg        # address of the string
    mv a2, t3         # length (you already counted it in t3!)
    li a7, 64         # write syscall
    ecall

    li a0, 0          # exit status
    li a7, 93         # exit syscall
    ecall