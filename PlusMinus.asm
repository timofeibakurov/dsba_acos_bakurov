for:
   li   a7, 5
   ecall
   mv   t1, a0
   mv   t0, zero
   li t2, 2
   li t5, 0
next:
   beq  t0, t1, end_for
   rem t3, t0, t2
   li a7, 5
   ecall
   mv t4, a0
   if_0:
    bnez t3, else
    add t5, t5, t4
    j    end_if
   else:
    sub t5, t5, t4
   end_if:
    
   addi t0, t0, 1
   j    next
end_for:
 li a7, 1
 mv a0, t5
 ecall