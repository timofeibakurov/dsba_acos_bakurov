main:
  li a7, 5
  ecall
  mv t0, a0
  mv s0, a0
  mv s1, sp
while:
  beqz t0, end
  li a7, 5
  ecall
  mv t1, sp
while_nested:
  beq t1, s1, end_nested
  lw t3, (t1)
  beq a0, t3, duplicate
  addi t1, t1, 4
  j while_nested
end_nested:
  addi sp, sp, -4
  sw a0, (sp)
duplicate:
  addi t0, t0, -1
  j while
end:
  mv t1, s1
print_for:
  beq t1, sp, end_print
  addi t1, t1, -4
  lw a0, (t1)
  li a7, 1
  ecall
  li a7, 11
  li a0, '\n'
  ecall
  j print_for
end_print:
  mv sp, s1