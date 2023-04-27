.macro check(%a, %b, %c)
li t1, 0
li t2, 0
li t3, 0

add t1, %a, %b
add t1, t1, %c
beqz t1, return_0

add t1, %a, %b
add t2, %b, %c
add t3, %c, %a

bgt %a, t2, return_2
bgt %b, t3, return_2
bgt %c, t1, return_2

li t0, 1
j end

return_2:
 li t0, 2
 j end
return_0:
 li t0, 0
 j end
end:
.end_macro

main:
 li t0, 3
 li t5, 1
 li t6, 1
 while:
  li a7, 5
  ecall
  mv a1, a0
 
  ecall
  mv a2, a0
 
  ecall
  mv a3, a0
 
  j check
  
  print:
  beqz t0, end
  
  beq t0, t5, print_Y
  beq t0, t6, print_N
  
  print_N:
   li a7, 11
   li a0, 'N'
   ecall
   li a0, '\n'
   ecall
   j while
  print_Y:
   li a7, 11
   li a0, 'Y'
   ecall
   li a0, '\n'
   ecall
   j while
check: 
li t1, 0
li t2, 0
li t3, 0

add t1, a1, a2
add t1, t1, a3
beqz t1, return_0

add t1, a1, a2
add t2, a2, a3
add t3, a3, a1

bgt a1, t2, return_2
bgt a2, t3, return_2
bgt a3, t1, return_2

li t0, 1
j print

return_2:
 li t0, 2
 j print
return_0:
 li t0, 0
 j print

 end: