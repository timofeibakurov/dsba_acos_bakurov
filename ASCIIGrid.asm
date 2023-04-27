.macro printline(%cells, %char1, %char2)
li a7, 11
li a0, %char1
ecall

li t0, 0
while:
 beq t0, %cells, end
 addi t0, t0, 1
 li a0, %char2
 ecall
 li a0, %char1
 ecall
 j while
end:
li a0, '\n'
ecall
.end_macro
main:
 li a7, 5
 ecall
 mv t1, a0
 
 li a7, 5
 ecall
 mv t2, a0
 
 printline(t1, '+', '-')
 
 li t4, 0
 while:
  beq t2, t4, end
  addi t4, t4, 1
  printline(t1, '|', ' ')
  printline(t1, '+', '-')
  j while
 end: