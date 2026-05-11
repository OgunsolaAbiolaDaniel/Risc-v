.data 
var1: .word 35
var2: .word 10
result: .word  0

.text 
.global _start

_start:
la t0, var1
la t1, var2
la a3, result

lw t0,0(t0)
lw t1,0(t1)

add t4 , t0, t1
sw t4, 0(a3)

la a4, result
lw a4, 0(a4) 


mv a0,t4
li a7, 1
ecall


 li a7, 10       # exit
  ecall
