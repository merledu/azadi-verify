li a0,0x400c0000
li t1,0 
sw t1,0x10(a0)
li t2,1 
sw t2,0x10(a0)
li t3,1 
sw t3,0x10(a0)
li s8,-4  
sw s8,0x10(a0)
mul t4,t2,t2 
mul t5,t1,t3 
mul t6,t5,s8 
add s7,t4,t6 
blt s7,t0,norealsol
beq s7,t0,onesolution
bge s7,t0,twosolutions
norealsol: 
addi s7,t0,-2
sw s7,0x10(a0)
lw s6,0xc(a0)
beq t0,t0,end
onesolution:
addi s7,t0,1
sw s7,0x10(a0)
lw s6,0xc(a0)
beq t0,t0,end
twosolutions:
addi s7,t0,2
sw s7,0x10(a0)
lw s6,0xc(a0)
end:
nop