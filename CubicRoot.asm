main:
 li t0, 0 # 0
 li t1, 1 # 1
 li t2, 2 # 2
 fcvt.d.w ft2, t2 # 2
 
 li a7, 7
 
 ecall
 fmv.d ft1, fa0 # input A
 
 ecall
 fmv.d ft0, fa0 # input e
 
 fcvt.d.w fs1, t0 # left
 fmv.d fs2, ft1 # right
 
while:
 fadd.d fs3, fs1, fs2
 fdiv.d fs3, fs3, ft2 # middle
 
 fmul.d fs5, fs3, fs3 # middle^2
 fmul.d fs5, fs5, fs3 # middle^3
 
 fsub.d fs4, fs5, ft1 # middle^3 - A
 fabs.d fs4, fs4 # mod of (middle^3 - A)
 
 fle.d a1, fs4, ft0 # a1 = mod of (middle^ - A) <= e
 
 beq a1, t1, print_root
 
 flt.d a1, ft1, fs5 # a1 = A < middle^3
 
 beq a1, t1, A_less # right = middle
 beq a1, t0, B_less
 
A_less:
 fmv.d fs2, fs3
 j while

B_less:
 fmv.d fs1, fs3
 j while

print_root:
 li a7, 3
 fmv.d fa0, fs3
 ecall

 li a7, 11
 li a0, '\n'
 ecall