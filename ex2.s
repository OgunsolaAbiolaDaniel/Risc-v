.data
    var1:   .word -35 # example values (try with different values)
    var2:   .word 10
    maxval: .word 0  # must contain the max value between var1 and var2

.text
.global _start
_start:

    lw a0, var1
    lw a1,var2
    call max
    sw a0,maxval,t4
    
    # syscall to write an integer
    # li a0, value
    li a7, 1
    ecall
    
    # exit(int status)
    li a0, 0          # exit status
    li a7, 93         # syscall number for exit
    ecall

# a0: first argument
# a1: second argument
# a0: return value
max:  

    bge a0,a1,maxend
    mv a0,a1
 maxend:
    ret             # ja ra

