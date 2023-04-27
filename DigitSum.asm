main:
    li a7, 5
    
    ecall
    mv t0, a0
    
    li t1, 0
    li t2, 10
    li t3, -1
    
while:
    beqz t0, end_while
    rem t4, t0, t2
    add t1, t1, t4
    div t0, t0, t2
    j while

end_while:
    bltz t1, change_sign
    j end
    
change_sign:
    mul t1, t1, t3
    
end:   
    li a7, 1
    mv a0, t1
    ecall