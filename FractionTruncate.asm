main:
 li t4, 1
 li t6, 10
 
 li a7, 5
 
 ecall
 mv t1, a0 # a
 
 ecall
 mv t2, a0 # b
 
 ecall 
 mv t0, a0 # n
 
 div a0, t1, t2
 
 li a7, 1
 ecall
 
 li a7, 11
 li a0, '.'
 ecall
li t5, 0 # counter
n_while:
 beq t5, t0, end_n_while
 addi t5, t5, 1
 
 mul t4, t4, t6
 
 j n_while
 
end_n_while:
 
 div a5, t1, t2
 beqz a5, continue
 rem t1, t1, t2
 
continue:
 fcvt.d.w ft1, t1 # a
 fcvt.d.w ft2, t2 # b
 fcvt.d.w ft4, t4 # 10^n
 fdiv.d ft3, ft1, ft2
 fmul.d ft3, ft3, ft4
 
 fcvt.w.d a0, ft3
 
 li a7, 1
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall