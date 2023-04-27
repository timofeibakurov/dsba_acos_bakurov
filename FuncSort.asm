main:
 li a2, 1 # 1
 li a7, 5
 ecall
 mv t0, a0
 li t2, 0 # counter
 mv t1, sp
 input_while:
  beq t0, t2, end_input
  addi t2, t2, 1
  ecall
  sw a0, (t1)
  
  addi t1, t1, 4
  j input_while
 end_input:
 
 sort:
  addi t1, t1, -4
  mv a0, sp # start
  mv a1, t1 # end
  
  li t2, 1 # counter
  
  mv t1, a0 # number_ind
  mv a3, a0 # max_ind
  lw t3, (t1) # first_max
  mv t4, t0 # len
  while:
   beq t4, a2, print
   beq t2, t4, swap
   
   addi t2, t2, 1
   addi t1, t1, 4
   
   lw t5, (t1)
   
   bgt t5, t3 change_max
   
   j while
  
 change_max:
  mv t3, t5
  mv a3, t1
  j while
  
 swap:
  lw t6, (a1)
  sw t6, (a3)
  sw t3, (a1)
  
  addi t4, t4, -1
  addi a1, a1, -4
  
  li t2, 1
  mv t1, a0 # number_ind
  mv a3, a0 # max_ind
  lw t3, (t1) # first_max
  j while
  
print:
 mv t1, sp
 li t2, 0
 li a7, 1
 print_while:
  beq t0, t2, end_print
  addi t2, t2, 1
  
  li a7, 1
  lw a0, (t1)
  ecall
  
  li a7, 11
  li a0, ' '
  ecall
  
  addi t1, t1, 4
  j print_while
 end_print: