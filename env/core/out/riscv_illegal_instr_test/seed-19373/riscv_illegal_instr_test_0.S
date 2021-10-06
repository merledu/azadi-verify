.section .text
.globl _start
.option norvc
j debug_rom
j debug_exception
.align 7
.option rvc
_start:
h0_start:
                  li x23, 0x40001106
                  csrw 0x301, x23
kernel_sp:        
                  la x21, kernel_stack_end

trap_vec_init:    
                  la x23, mtvec_handler
                  ori x23, x23, 1
                  csrw 0x305, x23 # MTVEC

pmp_setup:        
                  la x22, main
                  srli x22, x22, 2
                  csrw 0x3b0, x22
                  la x22, main
                  li x23, 0x11111111
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3b1, x22
                  la x22, main
                  li x23, 0x22222222
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3b2, x22
                  la x22, main
                  li x23, 0x33333333
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3b3, x22
                  li x22, 0xf0f0f0f
                  csrw 0x3a0, x22
                  la x22, main
                  li x23, 0x44444444
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3b4, x22
                  la x22, main
                  li x23, 0x55555555
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3b5, x22
                  la x22, main
                  li x23, 0x66666666
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3b6, x22
                  la x22, main
                  li x23, 0x77777777
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3b7, x22
                  li x22, 0xf0f0f0f
                  csrw 0x3a1, x22
                  la x22, main
                  li x23, 0x88888888
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3b8, x22
                  la x22, main
                  li x23, 0x99999999
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3b9, x22
                  la x22, main
                  li x23, 0xaaaaaaaa
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3ba, x22
                  la x22, main
                  li x23, 0xbbbbbbbb
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3bb, x22
                  li x22, 0xf0f0f0f
                  csrw 0x3a2, x22
                  la x22, main
                  li x23, 0xcccccccc
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3bc, x22
                  la x22, main
                  li x23, 0xdddddddd
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3bd, x22
                  la x22, main
                  li x23, 0xeeeeeeee
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3be, x22
                  la x22, main
                  li x23, 0xffffffff
                  add x22, x22, x23
                  srli x22, x22, 2
                  csrw 0x3bf, x22
                  li x22, 0xf0f0f0f
                  csrw 0x3a3, x22

mepc_setup:       
                  la x23, init
                  csrw 0x341, x23

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_user_mode:   
                  li x23, 0x0
                  csrw 0x300, x23 # MSTATUS
                  li x23, 0x0
                  csrw 0x304, x23 # MIE
                  mret
init:             
                  li x0, 0x0
                  li x1, 0xa
                  li x2, 0xf07e0315
                  ...
                  li x31, 0x0
                  la x25, user_stack_end
                  j main
mmode_intr_vector_1:
                  1: addi x25, x25, -124
                  sw  x1, 4(x25)
.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .region_0,"aw",@progbits;
region_0:
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
...
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.section .region_1,"aw",@progbits;
region_1:
.word 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f
...
.word 0xe0e1e2e3, 0xe4e5e6e7, 0xe8e9eaeb, 0xecedeeef, 0xf0f1f2f3, 0xf4f5f6f7, 0xf8f9fafb, 0xfcfdfeff
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 4999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
ebreak_handler:   
                  csrr  x23, 0x341
                  addi  x23, x23, 4
                  csrw  0x341, x23
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  ...
                  lw  x31, 124(x25)
                  addi x25, x25, 124
                  mret

illegal_instr_handler:
                  csrr  x23, 0x341
                  addi  x23, x23, 4
                  csrw  0x341, x23
                  lw  x1, 4(x25)
                  ...
                  lw  x31, 124(x25)
                  addi x25, x25, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x23, 0x300 # MSTATUS;
                  csrr  x23, 0x304 # MIE;
                  csrr  x23, 0x344 # MIP;
                  csrrc x23, 0x344, x23 # MIP;
                  lw  x1, 4(x25)
                  ...
                  lw  x31, 124(x25)
                  addi x25, x25, 124
                  mret;

kernel_instr_end: nop
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 3999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0