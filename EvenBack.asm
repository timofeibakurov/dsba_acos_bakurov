.macro push(%reg)
 addi sp, sp, -4
 sw %reg, 0(sp)
.end_macro

.macro pop(%reg)
 lw %reg, 0(sp)
 addi sp, sp, 4
.end_macro 

li a7, 5
ecall
mv t0, a0

li t1, 1
li t2, 2
li t3, 3
li t6, 0

beqz t0, end

while:
 beqz t0, print
 
 li a7, 5
 ecall
 mv t4, a0
 
 addi t0, t0, -1
 
 rem t5, t4, t2
 
 beqz t5, add_el
 
 j while
add_el:
 addi t6, t6, 1
 push(t4)
 j while
print:
 blez t6, end
   addi t6, t6, -1
  
   li a7, 1
   pop(a0)
   ecall
   
     li a7, 11
     li a0, 10
     ecall
  
   j print
end: