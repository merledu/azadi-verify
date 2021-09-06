.section .text
.globl _start
.option norvc
j debug_rom
j debug_exception
.align 7
.option rvc
_start:
h0_start:
                  li x16, 0x40001106
                  csrw 0x301, x16
kernel_sp:        
                  la x24, kernel_stack_end

trap_vec_init:    
                  la x16, mtvec_handler
                  ori x16, x16, 1
                  csrw 0x305, x16 # MTVEC

pmp_setup:        
                  la x21, main
                  srli x21, x21, 2
                  csrw 0x3b0, x21
                  la x21, main
                  li x16, 0x11111111
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3b1, x21
                  la x21, main
                  li x16, 0x22222222
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3b2, x21
                  la x21, main
                  li x16, 0x33333333
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3b3, x21
                  li x21, 0xf0f0f0f
                  csrw 0x3a0, x21
                  la x21, main
                  li x16, 0x44444444
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3b4, x21
                  la x21, main
                  li x16, 0x55555555
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3b5, x21
                  la x21, main
                  li x16, 0x66666666
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3b6, x21
                  la x21, main
                  li x16, 0x77777777
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3b7, x21
                  li x21, 0xf0f0f0f
                  csrw 0x3a1, x21
                  la x21, main
                  li x16, 0x88888888
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3b8, x21
                  la x21, main
                  li x16, 0x99999999
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3b9, x21
                  la x21, main
                  li x16, 0xaaaaaaaa
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3ba, x21
                  la x21, main
                  li x16, 0xbbbbbbbb
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3bb, x21
                  li x21, 0xf0f0f0f
                  csrw 0x3a2, x21
                  la x21, main
                  li x16, 0xcccccccc
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3bc, x21
                  la x21, main
                  li x16, 0xdddddddd
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3bd, x21
                  la x21, main
                  li x16, 0xeeeeeeee
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3be, x21
                  la x21, main
                  li x16, 0xffffffff
                  add x21, x21, x16
                  srli x21, x21, 2
                  csrw 0x3bf, x21
                  li x21, 0xf0f0f0f
                  csrw 0x3a3, x21

mepc_setup:       
                  la x16, init
                  csrw 0x341, x16

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x16, 0x1800
                  csrw 0x300, x16 # MSTATUS
                  li x16, 0x0
                  csrw 0x304, x16 # MIE
                  mret
init:             
                  li x0, 0xf43ed7ac
                  li x1, 0xfacc315d
                  li x3, 0x4f7720fb
                  li x4, 0x0
                  li x5, 0x1
                  li x6, 0x0
                  li x7, 0x80000000
                  li x8, 0xa814ea48
                  li x9, 0xd0c2c910
                  li x10, 0xf4831ea4
                  li x11, 0x80000000
                  li x12, 0x7a121b02
                  li x13, 0xb79aae4a
                  li x14, 0xf430a5a2
                  li x15, 0x0
                  li x16, 0x80000000
                  li x17, 0xf0be0d74
                  li x18, 0x0
                  li x19, 0xab24525
                  li x20, 0x80000000
                  li x21, 0x38dd1cca
                  li x22, 0xf060db0e
                  li x23, 0xfdb7dcdd
                  li x25, 0xb
                  li x26, 0x0
                  li x27, 0x9d23fe17
                  li x28, 0xd
                  li x29, 0xe
                  li x30, 0x90e30068
                  li x31, 0xf940733b
                  la x2, user_stack_end
                  j main
mmode_intr_vector_1:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_2:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_3:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_4:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_5:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_6:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_7:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_8:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_9:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_10:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_11:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_12:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_13:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_14:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_15:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_16:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_17:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_18:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_19:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_20:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_21:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_22:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_23:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_24:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_25:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_26:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_27:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_28:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_29:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_30:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_31:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x342 # MCAUSE
                  srli x16, x16, 0x1f
                  beqz x16, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

.align           8
mtvec_handler:    
                  .option norvc;
                  j mmode_exception_handler
                  j mmode_intr_vector_1
                  j mmode_intr_vector_2
                  j mmode_intr_vector_3
                  j mmode_intr_vector_4
                  j mmode_intr_vector_5
                  j mmode_intr_vector_6
                  j mmode_intr_vector_7
                  j mmode_intr_vector_8
                  j mmode_intr_vector_9
                  j mmode_intr_vector_10
                  j mmode_intr_vector_11
                  j mmode_intr_vector_12
                  j mmode_intr_vector_13
                  j mmode_intr_vector_14
                  j mmode_intr_vector_15
                  j mmode_intr_vector_16
                  j mmode_intr_vector_17
                  j mmode_intr_vector_18
                  j mmode_intr_vector_19
                  j mmode_intr_vector_20
                  j mmode_intr_vector_21
                  j mmode_intr_vector_22
                  j mmode_intr_vector_23
                  j mmode_intr_vector_24
                  j mmode_intr_vector_25
                  j mmode_intr_vector_26
                  j mmode_intr_vector_27
                  j mmode_intr_vector_28
                  j mmode_intr_vector_29
                  j mmode_intr_vector_30
                  j mmode_intr_vector_31
                  .option rvc;

mmode_exception_handler:
                  1: addi x2, x2, -124
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  csrr x16, 0x341 # MEPC
                  csrr x16, 0x342 # MCAUSE
                  li x13, 0x3 # BREAKPOINT
                  beq x16, x13, ebreak_handler
                  li x13, 0x8 # ECALL_UMODE
                  beq x16, x13, ecall_handler
                  li x13, 0x9 # ECALL_SMODE
                  beq x16, x13, ecall_handler
                  li x13, 0xb # ECALL_MMODE
                  beq x16, x13, ecall_handler
                  li x13, 0x1
                  beq x16, x13, instr_fault_handler
                  li x13, 0x5
                  beq x16, x13, load_fault_handler
                  li x13, 0x7
                  beq x16, x13, store_fault_handler
                  li x13, 0xc
                  beq x16, x13, pt_fault_handler
                  li x13, 0xd
                  beq x16, x13, pt_fault_handler
                  li x13, 0xf
                  beq x16, x13, pt_fault_handler
                  li x13, 0x2 # ILLEGAL_INSTRUCTION
                  beq x16, x13, illegal_instr_handler
                  csrr x13, 0x343 # MTVAL
                  1: la x21, test_done
                  jalr x1, x21, 0

ecall_handler:    
                  la x16, _start
                  sw x0, 0(x16)
                  sw x1, 4(x16)
                  sw x2, 8(x16)
                  sw x3, 12(x16)
                  sw x4, 16(x16)
                  sw x5, 20(x16)
                  sw x6, 24(x16)
                  sw x7, 28(x16)
                  sw x8, 32(x16)
                  sw x9, 36(x16)
                  sw x10, 40(x16)
                  sw x11, 44(x16)
                  sw x12, 48(x16)
                  sw x13, 52(x16)
                  sw x14, 56(x16)
                  sw x15, 60(x16)
                  sw x16, 64(x16)
                  sw x17, 68(x16)
                  sw x18, 72(x16)
                  sw x19, 76(x16)
                  sw x20, 80(x16)
                  sw x21, 84(x16)
                  sw x22, 88(x16)
                  sw x23, 92(x16)
                  sw x24, 96(x16)
                  sw x25, 100(x16)
                  sw x26, 104(x16)
                  sw x27, 108(x16)
                  sw x28, 112(x16)
                  sw x29, 116(x16)
                  sw x30, 120(x16)
                  sw x31, 124(x16)
                  la x21, write_tohost
                  jalr x0, x21, 0

instr_fault_handler:
                  li x16, 0
                  csrw 0x340, x16
                  li x25, 0
                  0: csrr x16, 0x340
                  mv x21, x16
                  li x21, 0
                  beq x16, x21, 1f
                  li x21, 1
                  beq x16, x21, 2f
                  li x21, 2
                  beq x16, x21, 3f
                  li x21, 3
                  beq x16, x21, 4f
                  li x21, 4
                  beq x16, x21, 5f
                  li x21, 5
                  beq x16, x21, 6f
                  li x21, 6
                  beq x16, x21, 7f
                  li x21, 7
                  beq x16, x21, 8f
                  li x21, 8
                  beq x16, x21, 9f
                  li x21, 9
                  beq x16, x21, 10f
                  li x21, 10
                  beq x16, x21, 11f
                  li x21, 11
                  beq x16, x21, 12f
                  li x21, 12
                  beq x16, x21, 13f
                  li x21, 13
                  beq x16, x21, 14f
                  li x21, 14
                  beq x16, x21, 15f
                  li x21, 15
                  beq x16, x21, 16f
                  1: csrr x13, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  2: csrr x13, 0x3b1
                  csrr x17, 0x3a0
                  j 17f
                  3: csrr x13, 0x3b2
                  csrr x17, 0x3a0
                  j 17f
                  4: csrr x13, 0x3b3
                  csrr x17, 0x3a0
                  j 17f
                  5: csrr x13, 0x3b4
                  csrr x17, 0x3a1
                  j 17f
                  6: csrr x13, 0x3b5
                  csrr x17, 0x3a1
                  j 17f
                  7: csrr x13, 0x3b6
                  csrr x17, 0x3a1
                  j 17f
                  8: csrr x13, 0x3b7
                  csrr x17, 0x3a1
                  j 17f
                  9: csrr x13, 0x3b8
                  csrr x17, 0x3a2
                  j 17f
                  10: csrr x13, 0x3b9
                  csrr x17, 0x3a2
                  j 17f
                  11: csrr x13, 0x3ba
                  csrr x17, 0x3a2
                  j 17f
                  12: csrr x13, 0x3bb
                  csrr x17, 0x3a2
                  j 17f
                  13: csrr x13, 0x3bc
                  csrr x17, 0x3a3
                  j 17f
                  14: csrr x13, 0x3bd
                  csrr x17, 0x3a3
                  j 17f
                  15: csrr x13, 0x3be
                  csrr x17, 0x3a3
                  j 17f
                  16: csrr x13, 0x3bf
                  csrr x17, 0x3a3
                  j 17f
                  17: li x5, 4
                  csrr x16, 0x340
                  slli x16, x16, 30
                  srli x16, x16, 30
                  sub x21, x5, x16
                  addi x21, x21, -1
                  slli x21, x21, 3
                  sll x5, x17, x21
                  slli x16, x16, 3
                  add x21, x21, x16
                  srl x5, x5, x21
                  slli x21, x5, 27
                  srli x21, x21, 30
                  beqz x21, 20f
                  li x16, 1
                  beq x21, x16, 21f
                  li x16, 2
                  beq x21, x16, 25f
                  li x16, 3
                  beq x21, x16, 27f
                  la x16, test_done
                  jalr x0, x16, 0
                  18: csrr x16, 0x340
                  mv x25, x13
                  addi x16, x16, 1
                  csrw 0x340, x16
                  li x13, 16
                  ble x13, x16, 19f
                  j 0b
                  19: la x16, test_done
                  jalr x0, x16, 0
                  20: j 18b
                  21: csrr x16, 0x340
                  csrr x21, 0x343
                  srli x21, x21, 2
                  bnez x16, 22f
                  bltz x21, 18b
                  j 23f
                  22: bgtu x25, x21, 18b
                  23: bleu x13, x21, 18b
                  andi x21, x5, 128
                  beqz x21, 24f
                  la x16, test_done
                  jalr x0, x16, 0
                  24: j 29f
                  25: csrr x16, 0x343
                  srli x16, x16, 2
                  slli x21, x13, 2
                  srli x21, x21, 2
                  bne x16, x21, 18b
                  andi x21, x5, 128
                  beqz x21, 26f
                  la x16, test_done
                  jalr x0, x16, 0
                  26: j 29f
                  27: csrr x16, 0x343
                  srli x16, x16, 2
                  srli x16, x16, 0
                  slli x16, x16, 0
                  slli x21, x13, 2
                  srli x21, x21, 2
                  srli x21, x21, 0
                  slli x21, x21, 0
                  bne x16, x21, 18b
                  andi x21, x5, 128
                  beqz x21, 29f
                  la x16, test_done
                  jalr x0, x16, 0
                  28: j 29f
                  29: ori x5, x5, 4
                  csrr x16, 0x340
                  li x21, 30
                  sll x16, x16, x21
                  srl x16, x16, x21
                  slli x21, x16, 3
                  sll x5, x5, x21
                  or x17, x17, x5
                  csrr x16, 0x340
                  srli x16, x16, 2
                  beqz x16, 30f
                  li x21, 1
                  beq x16, x21, 31f
                  li x21, 2
                  beq x16, x21, 32f
                  li x21, 3
                  beq x16, x21, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 124
                  mret

load_fault_handler:
                  li x16, 0
                  csrw 0x340, x16
                  li x25, 0
                  0: csrr x16, 0x340
                  mv x21, x16
                  li x21, 0
                  beq x16, x21, 1f
                  li x21, 1
                  beq x16, x21, 2f
                  li x21, 2
                  beq x16, x21, 3f
                  li x21, 3
                  beq x16, x21, 4f
                  li x21, 4
                  beq x16, x21, 5f
                  li x21, 5
                  beq x16, x21, 6f
                  li x21, 6
                  beq x16, x21, 7f
                  li x21, 7
                  beq x16, x21, 8f
                  li x21, 8
                  beq x16, x21, 9f
                  li x21, 9
                  beq x16, x21, 10f
                  li x21, 10
                  beq x16, x21, 11f
                  li x21, 11
                  beq x16, x21, 12f
                  li x21, 12
                  beq x16, x21, 13f
                  li x21, 13
                  beq x16, x21, 14f
                  li x21, 14
                  beq x16, x21, 15f
                  li x21, 15
                  beq x16, x21, 16f
                  1: csrr x13, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  2: csrr x13, 0x3b1
                  csrr x17, 0x3a0
                  j 17f
                  3: csrr x13, 0x3b2
                  csrr x17, 0x3a0
                  j 17f
                  4: csrr x13, 0x3b3
                  csrr x17, 0x3a0
                  j 17f
                  5: csrr x13, 0x3b4
                  csrr x17, 0x3a1
                  j 17f
                  6: csrr x13, 0x3b5
                  csrr x17, 0x3a1
                  j 17f
                  7: csrr x13, 0x3b6
                  csrr x17, 0x3a1
                  j 17f
                  8: csrr x13, 0x3b7
                  csrr x17, 0x3a1
                  j 17f
                  9: csrr x13, 0x3b8
                  csrr x17, 0x3a2
                  j 17f
                  10: csrr x13, 0x3b9
                  csrr x17, 0x3a2
                  j 17f
                  11: csrr x13, 0x3ba
                  csrr x17, 0x3a2
                  j 17f
                  12: csrr x13, 0x3bb
                  csrr x17, 0x3a2
                  j 17f
                  13: csrr x13, 0x3bc
                  csrr x17, 0x3a3
                  j 17f
                  14: csrr x13, 0x3bd
                  csrr x17, 0x3a3
                  j 17f
                  15: csrr x13, 0x3be
                  csrr x17, 0x3a3
                  j 17f
                  16: csrr x13, 0x3bf
                  csrr x17, 0x3a3
                  j 17f
                  17: li x5, 4
                  csrr x16, 0x340
                  slli x16, x16, 30
                  srli x16, x16, 30
                  sub x21, x5, x16
                  addi x21, x21, -1
                  slli x21, x21, 3
                  sll x5, x17, x21
                  slli x16, x16, 3
                  add x21, x21, x16
                  srl x5, x5, x21
                  slli x21, x5, 27
                  srli x21, x21, 30
                  beqz x21, 20f
                  li x16, 1
                  beq x21, x16, 21f
                  li x16, 2
                  beq x21, x16, 25f
                  li x16, 3
                  beq x21, x16, 27f
                  la x16, test_done
                  jalr x0, x16, 0
                  18: csrr x16, 0x340
                  mv x25, x13
                  addi x16, x16, 1
                  csrw 0x340, x16
                  li x13, 16
                  ble x13, x16, 19f
                  j 0b
                  19: la x16, test_done
                  jalr x0, x16, 0
                  20: j 18b
                  21: csrr x16, 0x340
                  csrr x21, 0x343
                  srli x21, x21, 2
                  bnez x16, 22f
                  bltz x21, 18b
                  j 23f
                  22: bgtu x25, x21, 18b
                  23: bleu x13, x21, 18b
                  andi x21, x5, 128
                  beqz x21, 24f
                  la x16, test_done
                  jalr x0, x16, 0
                  24: j 29f
                  25: csrr x16, 0x343
                  srli x16, x16, 2
                  slli x21, x13, 2
                  srli x21, x21, 2
                  bne x16, x21, 18b
                  andi x21, x5, 128
                  beqz x21, 26f
                  la x16, test_done
                  jalr x0, x16, 0
                  26: j 29f
                  27: csrr x16, 0x343
                  srli x16, x16, 2
                  srli x16, x16, 0
                  slli x16, x16, 0
                  slli x21, x13, 2
                  srli x21, x21, 2
                  srli x21, x21, 0
                  slli x21, x21, 0
                  bne x16, x21, 18b
                  andi x21, x5, 128
                  beqz x21, 29f
                  la x16, test_done
                  jalr x0, x16, 0
                  28: j 29f
                  29: ori x5, x5, 1
                  csrr x16, 0x340
                  li x21, 30
                  sll x16, x16, x21
                  srl x16, x16, x21
                  slli x21, x16, 3
                  sll x5, x5, x21
                  or x17, x17, x5
                  csrr x16, 0x340
                  srli x16, x16, 2
                  beqz x16, 30f
                  li x21, 1
                  beq x16, x21, 31f
                  li x21, 2
                  beq x16, x21, 32f
                  li x21, 3
                  beq x16, x21, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 124
                  mret

store_fault_handler:
                  li x16, 0
                  csrw 0x340, x16
                  li x25, 0
                  0: csrr x16, 0x340
                  mv x21, x16
                  li x21, 0
                  beq x16, x21, 1f
                  li x21, 1
                  beq x16, x21, 2f
                  li x21, 2
                  beq x16, x21, 3f
                  li x21, 3
                  beq x16, x21, 4f
                  li x21, 4
                  beq x16, x21, 5f
                  li x21, 5
                  beq x16, x21, 6f
                  li x21, 6
                  beq x16, x21, 7f
                  li x21, 7
                  beq x16, x21, 8f
                  li x21, 8
                  beq x16, x21, 9f
                  li x21, 9
                  beq x16, x21, 10f
                  li x21, 10
                  beq x16, x21, 11f
                  li x21, 11
                  beq x16, x21, 12f
                  li x21, 12
                  beq x16, x21, 13f
                  li x21, 13
                  beq x16, x21, 14f
                  li x21, 14
                  beq x16, x21, 15f
                  li x21, 15
                  beq x16, x21, 16f
                  1: csrr x13, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  2: csrr x13, 0x3b1
                  csrr x17, 0x3a0
                  j 17f
                  3: csrr x13, 0x3b2
                  csrr x17, 0x3a0
                  j 17f
                  4: csrr x13, 0x3b3
                  csrr x17, 0x3a0
                  j 17f
                  5: csrr x13, 0x3b4
                  csrr x17, 0x3a1
                  j 17f
                  6: csrr x13, 0x3b5
                  csrr x17, 0x3a1
                  j 17f
                  7: csrr x13, 0x3b6
                  csrr x17, 0x3a1
                  j 17f
                  8: csrr x13, 0x3b7
                  csrr x17, 0x3a1
                  j 17f
                  9: csrr x13, 0x3b8
                  csrr x17, 0x3a2
                  j 17f
                  10: csrr x13, 0x3b9
                  csrr x17, 0x3a2
                  j 17f
                  11: csrr x13, 0x3ba
                  csrr x17, 0x3a2
                  j 17f
                  12: csrr x13, 0x3bb
                  csrr x17, 0x3a2
                  j 17f
                  13: csrr x13, 0x3bc
                  csrr x17, 0x3a3
                  j 17f
                  14: csrr x13, 0x3bd
                  csrr x17, 0x3a3
                  j 17f
                  15: csrr x13, 0x3be
                  csrr x17, 0x3a3
                  j 17f
                  16: csrr x13, 0x3bf
                  csrr x17, 0x3a3
                  j 17f
                  17: li x5, 4
                  csrr x16, 0x340
                  slli x16, x16, 30
                  srli x16, x16, 30
                  sub x21, x5, x16
                  addi x21, x21, -1
                  slli x21, x21, 3
                  sll x5, x17, x21
                  slli x16, x16, 3
                  add x21, x21, x16
                  srl x5, x5, x21
                  slli x21, x5, 27
                  srli x21, x21, 30
                  beqz x21, 20f
                  li x16, 1
                  beq x21, x16, 21f
                  li x16, 2
                  beq x21, x16, 25f
                  li x16, 3
                  beq x21, x16, 27f
                  la x16, test_done
                  jalr x0, x16, 0
                  18: csrr x16, 0x340
                  mv x25, x13
                  addi x16, x16, 1
                  csrw 0x340, x16
                  li x13, 16
                  ble x13, x16, 19f
                  j 0b
                  19: la x16, test_done
                  jalr x0, x16, 0
                  20: j 18b
                  21: csrr x16, 0x340
                  csrr x21, 0x343
                  srli x21, x21, 2
                  bnez x16, 22f
                  bltz x21, 18b
                  j 23f
                  22: bgtu x25, x21, 18b
                  23: bleu x13, x21, 18b
                  andi x21, x5, 128
                  beqz x21, 24f
                  la x16, test_done
                  jalr x0, x16, 0
                  24: j 29f
                  25: csrr x16, 0x343
                  srli x16, x16, 2
                  slli x21, x13, 2
                  srli x21, x21, 2
                  bne x16, x21, 18b
                  andi x21, x5, 128
                  beqz x21, 26f
                  la x16, test_done
                  jalr x0, x16, 0
                  26: j 29f
                  27: csrr x16, 0x343
                  srli x16, x16, 2
                  srli x16, x16, 0
                  slli x16, x16, 0
                  slli x21, x13, 2
                  srli x21, x21, 2
                  srli x21, x21, 0
                  slli x21, x21, 0
                  bne x16, x21, 18b
                  andi x21, x5, 128
                  beqz x21, 29f
                  la x16, test_done
                  jalr x0, x16, 0
                  28: j 29f
                  29: ori x5, x5, 3
                  csrr x16, 0x340
                  li x21, 30
                  sll x16, x16, x21
                  srl x16, x16, x21
                  slli x21, x16, 3
                  sll x5, x5, x21
                  or x17, x17, x5
                  csrr x16, 0x340
                  srli x16, x16, 2
                  beqz x16, 30f
                  li x21, 1
                  beq x16, x21, 31f
                  li x21, 2
                  beq x16, x21, 32f
                  li x21, 3
                  beq x16, x21, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 124
                  mret

test_done:        
                  li gp, 1
                  ecall
.align 2
main:             c.addi     a0, -1
                  sra        s4, a6, t1
                  srai       s0, t5, 24
                  c.mv       a3, tp
                  c.and      a3, a2
                  xor        t5, a6, t6
                  xori       t5, t2, -797
                  c.slli     ra, 7
                  addi       ra, s9, 367
                  mulhsu     a6, s0, a5
                  sub        t0, t6, t6
                  nop
                  ori        a7, s4, -220
                  add        t2, s9, a1
                  srai       ra, a2, 15
                  sub        s2, gp, gp
                  c.xor      s1, a5
                  sra        a7, t6, a2
                  c.sub      a1, a0
                  c.and      a4, s1
                  c.add      a5, a1
                  c.slli     s0, 5
                  csrrw      s0, 0x340, sp
                  or         t3, t1, s11
                  mulhsu     t0, t6, t0
                  xori       zero, a3, -852
                  xor        ra, s2, s7
                  csrrsi     t2, 0x340, 30
                  addi       s11, a1, -1019
                  sra        s0, s4, t1
                  lui        a2, 120608
                  mul        a5, t2, tp
                  c.lui      t2, 1
                  srl        t1, t2, ra
                  and        s4, t3, t6
                  sub        t2, t5, zero
                  nop
                  sltu       t4, sp, zero
                  div        t2, a4, s5
                  c.andi     a5, 20
                  csrrsi     t4, 0x340, 21
                  sub        a6, t2, s3
                  srl        s10, a4, ra
                  csrrw      s2, 0x340, a6
                  lui        s3, 594436
                  c.srai     s1, 27
                  xor        s7, zero, s10
                  and        ra, s9, a3
                  or         s11, t0, t5
                  slt        ra, ra, t0
                  srli       s3, s8, 18
                  and        a1, a6, gp
                  mulh       t1, s2, a5
                  csrrw      tp, 0x340, a0
                  c.lui      t1, 14
                  mulhsu     a5, ra, t5
                  c.srai     a4, 23
                  c.nop
                  or         a1, a0, s5
                  slli       a4, a6, 19
                  addi       a4, s6, 1000
                  mulh       t5, sp, a1
                  sra        s2, a5, gp
                  csrrsi     t4, 0x340, 19
                  c.and      a4, a1
                  add        a7, t2, s10
                  slli       ra, gp, 23
                  srai       a0, tp, 2
                  andi       zero, zero, 858
                  div        t4, t1, a2
                  c.lui      tp, 21
                  c.xor      a4, a1
                  srai       t4, t0, 0
                  mulh       tp, s2, gp
                  lui        a0, 34632
                  c.nop
                  xori       s9, a4, -322
                  slti       s1, a3, 635
                  auipc      t5, 146832
                  c.mv       a0, s5
                  xori       t0, s3, -343
                  ori        s6, s6, -153
                  or         s1, sp, s7
                  csrrw      s2, 0x340, a2
                  and        s3, s5, a0
                  auipc      s11, 436656
                  rem        s4, s8, s6
                  c.xor      a5, a4
                  andi       t6, a0, -513
                  csrrs      t2, 0x340, sp
                  csrrc      a7, 0x340, a6
                  srl        s10, s7, s5
                  sub        tp, s9, a4
                  csrrci     s4, 0x340, 9
                  divu       s4, a6, s5
                  rem        gp, s5, zero
                  add        a1, a3, s0
                  lui        a2, 229386
                  c.srai     a2, 11
                  rem        s7, a6, s8
                  sltiu      a3, s1, 1006
                  lui        s10, 925015
                  csrrs      t1, 0x340, s0
                  c.andi     a2, -1
                  sltiu      s3, s7, -464
                  csrrc      a5, 0x340, a0
                  csrrci     s9, 0x340, 6
                  c.srai     a3, 16
                  csrrw      s10, 0x340, a1
                  addi       a0, a6, 6
                  mul        s6, s6, t3
                  sltiu      a4, a3, 776
                  slti       a2, a2, -258
                  c.addi     s2, 1
                  slli       s1, s6, 12
                  sltiu      s10, zero, 1000
                  csrrs      a2, 0x340, s0
                  div        s2, s9, t1
                  slli       t3, t3, 13
                  lui        s10, 790658
                  mulhsu     t2, t5, s3
                  xori       a4, a3, -766
                  slli       s3, t0, 6
                  c.mv       t5, a7
                  rem        s11, a7, tp
                  c.xor      s0, a4
                  addi       s11, t1, -528
                  c.and      s1, s0
                  c.slli     t0, 2
                  c.add      a3, t4
                  mulhu      ra, gp, s9
                  sltiu      s7, s11, 240
                  sll        t0, s0, a3
                  mul        s9, tp, zero
                  c.xor      a3, a1
                  and        tp, s2, a6
                  srai       t1, t5, 18
                  remu       s4, s3, t0
                  div        s3, zero, s4
                  addi       s0, zero, 680
                  c.nop
                  slli       tp, t5, 13
                  remu       a7, a5, a6
                  sll        a3, s2, a1
                  add        t3, s0, a0
                  c.lui      a7, 17
                  c.srai     a3, 26
                  c.or       a2, a0
                  c.li       s7, 13
                  c.add      s11, a5
                  csrrsi     s7, 0x340, 7
                  c.add      t1, a6
                  srli       ra, t3, 1
                  nop
                  remu       s9, a2, s1
                  addi       s1, t4, -470
                  addi       zero, a0, -562
                  sltu       s10, ra, a4
                  c.mv       ra, t5
                  and        s1, t1, a0
                  mul        s0, s11, s7
                  csrrci     t2, 0x340, 6
                  c.srai     a3, 4
                  c.sub      s1, a2
                  div        s7, s3, s8
                  csrrwi     ra, 0x340, 9
                  c.and      a0, s1
                  sra        zero, s9, s1
                  csrrci     s0, 0x340, 0
                  srl        t1, s1, a1
                  xor        s7, a0, t1
                  c.lui      t1, 27
                  csrrs      zero, 0x340, zero
                  c.nop
                  nop
                  auipc      a1, 67587
                  mulhu      s9, s6, s1
                  slt        t3, t5, t0
                  srli       t1, t6, 11
                  sltu       s2, a7, t6
                  and        a3, a1, t3
                  c.addi     s3, 24
                  csrrw      s10, 0x340, t4
                  c.slli     tp, 21
                  c.mv       ra, s4
                  c.or       a1, a5
                  c.andi     a3, -1
                  slt        ra, a4, a0
                  c.slli     s4, 16
                  rem        ra, s6, s5
                  csrrw      t4, 0x340, s1
                  nop
                  nop
                  auipc      s3, 654233
                  srli       t5, s1, 31
                  c.xor      a5, a5
                  divu       s1, tp, s8
                  sltiu      a0, s0, 298
                  c.and      s1, a2
                  c.sub      a0, a5
                  slli       ra, t3, 23
                  c.lui      tp, 29
                  c.or       a0, s0
                  c.and      a1, s1
                  slli       s3, t1, 24
                  divu       a6, s7, s5
                  csrrwi     t5, 0x340, 30
                  xor        s2, a2, a4
                  csrrw      t2, 0x340, s1
                  srai       a3, t2, 25
                  c.andi     a4, 0
                  c.and      s1, a5
                  rem        a2, tp, s3
                  or         s4, s7, a2
                  srli       ra, a4, 12
                  div        a4, t5, s9
                  auipc      gp, 154731
                  c.xor      a1, a2
                  csrrsi     s11, 0x340, 28
                  slti       t5, zero, 244
                  c.addi     a3, -1
                  c.add      gp, a7
                  c.srai     s0, 21
                  c.nop
                  csrrwi     s10, 0x340, 11
                  rem        s11, s6, s8
                  nop
                  ori        a1, a1, 202
                  c.srai     s1, 16
                  xor        t2, s7, s2
                  srai       a3, t4, 0
                  mulh       s11, s7, tp
                  mulh       t6, a5, s8
                  auipc      a3, 665521
                  c.or       a2, a4
                  xor        tp, a4, tp
                  sltiu      a6, a5, -519
                  sll        tp, s10, s7
                  xori       s10, t3, 884
                  c.mv       t1, a0
                  c.srli     s0, 27
                  srl        s11, s3, s4
                  add        t4, t6, a0
                  xor        a0, tp, t3
                  srl        s1, a7, tp
                  c.andi     a5, 6
                  xor        s2, t0, a0
                  div        s11, s6, sp
                  sll        s2, a7, tp
                  add        s11, gp, a7
                  add        s3, a0, s5
                  or         zero, s0, s0
                  c.lui      tp, 2
                  sltu       a3, a4, t4
                  c.lui      t1, 1
                  c.andi     a3, 24
                  c.srli     s0, 7
                  addi       s9, a7, -9
                  add        s7, t6, s6
                  c.nop
                  mul        t2, t6, s4
                  csrrc      s2, 0x340, s10
                  sra        tp, a3, t3
                  c.xor      a4, a4
                  sltu       gp, a4, ra
                  lui        s4, 524193
                  c.addi     s2, -1
                  sll        tp, s9, t6
                  add        t0, s6, s6
                  c.add      a0, a3
                  c.or       a5, a2
                  csrrci     t4, 0x340, 5
                  csrrci     s6, 0x340, 22
                  c.sub      a5, a4
                  csrrs      t0, 0x340, s6
                  csrrci     t5, 0x340, 0
                  srai       a2, t5, 11
                  divu       s6, s10, t4
                  slt        a7, s2, a5
                  div        s2, t4, t2
                  c.addi     a0, -1
                  and        zero, tp, a2
                  mulhu      t5, s7, a5
                  sll        a4, s10, t0
                  ori        s6, t4, 153
                  sltiu      t6, t4, 779
                  slt        t6, s4, s0
                  srai       a4, s3, 25
                  auipc      ra, 96208
                  nop
                  c.and      a1, a5
                  sltu       t2, tp, s4
                  csrrci     tp, 0x340, 4
                  csrrsi     t3, 0x340, 1
                  xori       zero, s1, 455
                  and        tp, t3, s1
                  sub        s11, t5, a6
                  ori        ra, t6, 449
                  lui        s6, 587051
                  c.lui      s7, 17
                  mulh       s3, a7, t4
                  and        zero, s9, a1
                  srai       a3, t1, 5
                  mulhsu     a3, t5, s5
                  csrrci     s7, 0x340, 25
                  addi       tp, gp, -875
                  slt        a5, a2, a7
                  csrrsi     a6, 0x340, 31
                  sltu       t1, t2, t4
                  auipc      s0, 465296
                  csrrw      s0, 0x340, t0
                  mulhsu     t2, s9, t3
                  ori        t0, t0, 1015
                  csrrs      s11, 0x340, s6
                  c.slli     a1, 30
                  sltiu      s3, a5, 351
                  srai       a6, s2, 2
                  c.srli     a2, 1
                  divu       a1, s11, a4
                  c.andi     s1, -1
                  c.lui      s4, 30
                  c.srli     a3, 30
                  addi       s1, s11, 42
                  csrrsi     s4, 0x340, 15
                  c.lui      t5, 21
                  csrrs      s0, 0x340, a3
                  remu       s9, t4, s3
                  csrrc      a6, 0x340, s4
                  or         s3, gp, s4
                  andi       a6, a2, -241
                  andi       s7, s11, 385
                  csrrwi     a4, 0x340, 19
                  nop
                  c.add      ra, s9
                  or         t3, t3, s0
                  csrrwi     a4, 0x340, 4
                  c.li       t2, 2
                  slt        a4, t5, t3
                  c.add      t4, a6
                  c.mv       s6, a2
                  mulhu      s11, t5, a4
                  mul        a3, ra, s8
                  srai       s4, s5, 7
                  sltiu      t0, s11, 908
                  c.nop
                  nop
                  add        gp, a3, s1
                  c.li       gp, 17
                  c.and      a4, s1
                  c.or       s1, a2
                  mulhu      tp, a6, ra
                  c.nop
                  csrrw      t3, 0x340, a3
                  sub        tp, tp, s1
                  c.nop
                  slti       s6, s11, 766
                  sltu       s10, zero, s9
                  xor        a6, s8, s8
                  c.or       s0, a2
                  div        t3, s2, t0
                  c.lui      s4, 27
                  slti       t1, tp, -399
                  add        s11, s7, a0
                  c.srli     a4, 12
                  rem        t5, gp, a2
                  andi       s9, a7, -805
                  andi       s11, s6, 689
                  c.mv       s1, s5
                  sltu       t3, t1, gp
                  csrrwi     t6, 0x340, 25
                  rem        a1, zero, s6
                  c.andi     a3, -1
                  c.andi     a5, 28
                  addi       a4, a1, -389
                  slli       t1, a5, 22
                  c.nop
                  c.or       s1, s1
                  sltu       t1, a5, s11
                  or         a1, s6, s4
                  divu       s9, t1, s2
                  csrrsi     a6, 0x340, 2
                  c.andi     a1, 29
                  srli       gp, a1, 6
                  and        t4, s10, t5
                  srl        t0, a2, t5
                  addi       t6, s5, -280
                  and        a7, ra, t3
                  c.lui      s11, 8
                  csrrci     s6, 0x340, 28
                  slti       s1, t1, 621
                  div        s10, ra, t1
                  c.nop
                  sltiu      s11, s2, -386
                  slli       t1, a2, 17
                  csrrs      s3, 0x340, s4
                  srl        s4, a2, t1
                  nop
                  csrrwi     gp, 0x340, 11
                  c.li       s7, 4
                  div        ra, s4, tp
                  csrrci     s2, 0x340, 5
                  mulhsu     t3, a1, s6
                  c.mv       s0, s4
                  c.li       s9, -1
                  div        t6, ra, s6
                  slti       s3, t5, -545
                  mulh       gp, s1, s11
                  sltiu      a5, sp, -624
                  c.mv       a4, s2
                  slti       s7, a2, 785
                  ori        s11, a3, 380
                  srli       t0, s4, 19
                  or         ra, a5, t2
                  csrrwi     ra, 0x340, 11
                  mulh       zero, s6, s1
                  or         t6, t1, s10
                  csrrs      tp, 0x340, a2
                  ori        s10, gp, 834
                  divu       gp, t2, s7
                  c.addi     a6, 8
                  andi       t6, a1, -644
                  csrrw      a6, 0x340, t6
                  csrrci     s7, 0x340, 14
                  ori        t3, a0, 862
                  c.or       a0, a0
                  c.xor      a5, s1
                  div        a1, zero, s6
                  nop
                  or         t6, s9, t3
                  c.srli     a2, 18
                  c.mv       s0, a7
                  c.or       s1, a3
                  ori        a3, a6, -551
                  mulhu      s1, s4, sp
                  csrrc      t5, 0x340, s9
                  c.li       t4, -1
                  srl        s9, s9, tp
                  sltu       t3, ra, t4
                  ori        t4, t6, 458
                  csrrci     t1, 0x340, 19
                  sltu       t5, s5, t3
                  c.srli     a2, 30
                  c.addi     ra, 3
                  c.sub      a1, s1
                  csrrs      a3, 0x340, s11
                  slti       t1, a7, -170
                  mul        s3, a7, a3
                  c.or       a4, a3
                  c.srai     s1, 28
                  mulhu      s0, s1, t5
                  csrrsi     gp, 0x340, 5
                  c.srai     s0, 25
                  c.and      a5, a5
                  csrrci     s2, 0x340, 11
                  srli       t5, s1, 13
                  srl        a7, t0, s7
                  div        s10, s5, zero
                  csrrc      t5, 0x340, s6
                  or         t6, a3, a4
                  c.or       a1, s0
                  mul        t2, ra, t0
                  c.mv       s2, t6
                  c.addi     t0, 24
                  or         s2, gp, t6
                  srl        a2, s6, t6
                  csrrsi     s2, 0x340, 11
                  c.srli     a2, 29
                  c.xor      a5, a4
                  sub        s11, a1, sp
                  csrrw      s2, 0x340, ra
                  ori        t2, t6, 84
                  csrrwi     s4, 0x340, 25
                  csrrw      a7, 0x340, s2
                  mulh       s3, s10, t4
                  c.and      a0, a4
                  sra        ra, zero, a2
                  c.li       s4, -1
                  c.andi     a4, 2
                  ori        s0, t2, 970
                  div        t4, sp, gp
                  sltiu      t6, s8, -619
                  and        t0, a2, zero
                  div        t3, t2, s10
                  c.add      s9, gp
                  csrrc      gp, 0x340, tp
                  lui        a6, 124561
                  c.srli     a4, 31
                  addi       a5, a1, -200
                  mulhu      tp, a0, a1
                  lui        s3, 999698
                  c.nop
                  c.mv       a7, a7
                  c.nop
                  slt        a3, s8, s2
                  sltiu      gp, s0, -19
                  nop
                  c.andi     a1, 3
                  srl        t0, a1, s6
                  div        a7, s2, a1
                  sub        s1, s7, s2
                  or         t2, t0, ra
                  csrrc      s7, 0x340, a2
                  c.add      t2, a3
                  c.nop
                  c.srli     s0, 26
                  addi       s0, t5, 932
                  divu       t6, ra, t2
                  mulhu      a7, s11, s7
                  c.sub      a0, a4
                  srai       s1, s0, 13
                  mul        ra, s5, a7
                  c.add      s3, s4
                  c.xor      a2, s1
                  c.sub      a1, a0
                  sub        t1, tp, t2
                  srli       s3, ra, 19
                  add        a3, s0, a4
                  mulhu      s2, s8, a6
                  mulhsu     t5, t1, zero
                  c.srai     a3, 11
                  c.andi     a5, 15
                  remu       s0, t2, s11
                  sltu       t1, t1, t5
                  xori       t1, a3, 756
                  xor        t5, s4, t4
                  c.add      s11, tp
                  slt        a3, a0, s6
                  addi       tp, s1, 230
                  add        t2, t1, a5
                  slti       s10, t4, -542
                  sltiu      a1, s5, -343
                  srli       s9, s1, 21
                  c.li       t0, -1
                  nop
                  ori        t3, a3, 502
                  c.li       s11, -1
                  c.sub      a5, a1
                  rem        a0, ra, s4
                  lui        a0, 418976
                  rem        s2, s8, t0
                  remu       s11, s0, t1
                  c.li       tp, -1
                  mul        t3, s8, a7
                  csrrsi     t5, 0x340, 4
                  mulh       s0, s10, s7
                  csrrwi     a6, 0x340, 21
                  ori        s6, t0, 398
                  c.andi     a5, -1
                  rem        a3, s11, s6
                  sltiu      s1, a7, -180
                  c.andi     s0, 22
                  c.andi     a2, 29
                  c.nop
                  lui        t6, 606267
                  c.mv       s11, t0
                  c.lui      a5, 8
                  sll        s4, s4, s11
                  c.andi     a0, 28
                  sltiu      gp, a2, 218
                  c.andi     a1, 13
                  rem        t2, a4, a7
                  c.mv       s4, s4
                  or         t6, s1, gp
                  div        t1, s11, a4
                  addi       t4, a0, -522
                  sll        s9, t6, a0
                  ori        s1, s0, 681
                  slti       a3, t6, -329
                  c.addi     a5, -1
                  slti       a0, a7, 875
                  srai       s9, s6, 10
                  lui        t1, 272646
                  or         s4, a7, a0
                  xor        a6, sp, ra
                  andi       s9, ra, -879
                  mulhu      s4, t1, t4
                  csrrsi     t4, 0x340, 3
                  slti       zero, a6, 814
                  c.xor      a2, s0
                  c.slli     t0, 6
                  sltiu      s4, t0, 686
                  sltu       a7, s6, s5
                  mulhu      a5, t4, a3
                  xori       a7, s9, -1004
                  mulh       t0, t5, t3
                  csrrwi     s0, 0x340, 11
                  sltu       a7, t5, a4
                  auipc      s2, 437813
                  c.mv       a4, s5
                  mulh       a5, s0, t5
                  c.li       s3, -1
                  csrrs      s3, 0x340, t3
                  xori       t1, s1, -897
                  csrrs      t0, 0x340, a6
                  sll        gp, s3, tp
                  sra        a3, s1, t1
                  c.sub      a5, a4
                  lui        a4, 389389
                  c.srli     a2, 26
                  mulh       a5, s10, t1
                  c.andi     a5, 28
                  and        s11, a5, gp
                  add        a0, a6, t4
                  c.lui      s10, 4
                  sll        s0, t0, a4
                  slt        a1, sp, s10
                  mulhsu     gp, s8, s1
                  lui        s1, 744931
                  rem        t5, a0, a6
                  c.andi     a1, -1
                  auipc      t2, 899849
                  sll        a5, a3, a5
                  or         t6, s8, t1
                  mulhu      t2, a2, s0
                  lui        s11, 700641
                  andi       t6, a3, 679
                  slli       s9, t5, 1
                  c.and      a3, s0
                  csrrwi     s6, 0x340, 22
                  c.srli     a5, 10
                  c.mv       t0, a6
                  sll        a0, t0, zero
                  c.nop
                  c.sub      a5, a2
                  csrrs      t6, 0x340, s0
                  sll        gp, s11, a5
                  c.xor      s1, a1
                  mulhu      s0, t6, s4
                  mulh       t1, s11, s1
                  c.slli     gp, 28
                  slli       ra, s5, 24
                  rem        a0, t3, ra
                  slli       a6, tp, 13
                  c.li       s1, -1
                  mulhsu     t4, t4, a7
                  sll        s3, t6, a3
                  or         s6, sp, a7
                  csrrsi     t6, 0x340, 23
                  mulhu      zero, a4, t1
                  sltiu      t5, a6, -885
                  ori        a1, a0, 421
                  srli       a5, a4, 31
                  mulhsu     zero, a1, s3
                  slli       t6, ra, 27
                  c.sub      a1, a2
                  c.xor      a5, a3
                  sub        t0, s2, s9
                  slt        t3, t6, s7
                  lui        tp, 186146
                  c.or       a5, a4
                  slt        s7, s6, a6
                  c.andi     a1, 1
                  c.nop
                  csrrci     a3, 0x340, 13
                  c.srai     a0, 7
                  c.srai     a1, 8
                  c.xor      s1, a5
                  csrrs      s11, 0x340, a5
                  addi       t2, s11, -441
                  andi       t4, t0, -489
                  csrrsi     s11, 0x340, 15
                  csrrs      s0, 0x340, ra
                  srai       s6, s11, 19
                  auipc      a4, 799246
                  and        s6, s6, s3
                  c.nop
                  c.andi     s0, -1
                  csrrc      a2, 0x340, s10
                  c.addi     tp, -1
                  rem        t5, ra, s7
                  add        s9, t3, s9
                  sra        tp, t0, a3
                  or         a3, gp, t3
                  c.addi     t0, -1
                  csrrci     s4, 0x340, 0
                  mulhsu     s4, a1, ra
                  c.and      a1, s1
                  c.nop
                  slti       a4, s8, 612
                  c.srli     a5, 7
                  csrrw      t0, 0x340, s1
                  ori        t3, t6, -731
                  c.mv       a2, t3
                  xori       tp, s11, -943
                  xor        t5, t5, s4
                  mul        a6, a6, t3
                  srli       a7, a2, 16
                  csrrs      s9, 0x340, s3
                  c.slli     s6, 7
                  c.mv       s3, a3
                  nop
                  add        t4, t3, a6
                  remu       s7, zero, a3
                  srl        s0, gp, t1
                  and        t3, t5, gp
                  csrrs      a7, 0x340, s4
                  c.and      a1, s1
                  mulhu      zero, s2, t0
                  mulhu      s1, gp, s3
                  ori        t0, s1, 726
                  addi       tp, s9, -15
                  c.li       t4, 26
                  rem        a2, t6, s0
                  slti       a1, t1, 431
                  lui        t0, 414218
                  addi       s9, t1, 32
                  c.xor      a2, a4
                  slt        a2, s4, tp
                  mul        tp, t2, s0
                  c.srai     a4, 11
                  c.li       s0, -1
                  slti       t0, a2, 862
                  srai       s10, a5, 17
                  srai       s1, s10, 25
                  mulhsu     a5, s2, a3
                  sub        a2, s7, s10
                  c.nop
                  nop
                  csrrw      a7, 0x340, tp
                  csrrw      a1, 0x340, a0
                  and        t5, ra, s5
                  slti       zero, t0, -672
                  c.addi     t0, -1
                  c.andi     a5, 6
                  c.srli     s0, 18
                  csrrwi     s7, 0x340, 4
                  slt        s7, s10, a4
                  sra        s11, a3, a6
                  c.or       a2, a0
                  c.and      a3, a2
                  lui        a7, 685193
                  c.xor      a4, a0
                  c.lui      t3, 1
                  rem        t5, s5, s8
                  c.li       t3, -1
                  sltu       t5, s9, tp
                  c.add      t5, a3
                  add        a4, t6, s11
                  c.srli     a5, 19
                  csrrsi     s0, 0x340, 25
                  nop
                  c.mv       a6, t2
                  srl        s3, s3, s0
                  c.srli     a3, 1
                  divu       s9, t1, s8
                  srai       tp, a7, 18
                  c.nop
                  sltu       t0, s2, t0
                  mulh       gp, s9, a2
                  csrrs      s0, 0x340, s6
                  slt        ra, t1, sp
                  c.add      t2, s6
                  csrrw      a2, 0x340, t2
                  srl        t1, sp, s6
                  addi       s7, t0, -102
                  rem        s0, t4, s1
                  csrrw      s10, 0x340, zero
                  div        s7, a6, gp
                  srl        s4, t1, s11
                  addi       a0, a5, -132
                  c.srai     a5, 11
                  remu       a5, ra, a7
                  sub        t5, gp, a4
                  c.xor      a0, a5
                  csrrs      t2, 0x340, s7
                  csrrci     s1, 0x340, 17
                  sra        s11, s8, a5
                  lui        tp, 855391
                  c.mv       t5, a2
                  csrrs      a5, 0x340, a0
                  slt        s11, t4, s5
                  auipc      s11, 351692
                  srli       a2, s10, 11
                  c.lui      s1, 13
                  c.sub      a2, a1
                  c.li       s2, 29
                  addi       a0, s4, 448
                  xori       a4, a0, -627
                  sra        s4, s5, a0
                  csrrwi     a0, 0x340, 7
                  and        t6, a3, ra
                  c.slli     s11, 13
                  c.nop
                  c.addi     a7, 31
                  srli       t4, tp, 7
                  csrrci     s2, 0x340, 3
                  c.nop
                  mulh       s10, s0, t0
                  lui        a2, 686621
                  slli       a5, s7, 29
                  c.srli     a1, 18
                  slt        ra, s6, a5
                  c.mv       a0, t5
                  c.nop
                  slti       s2, t2, 698
                  ori        s3, s10, 79
                  and        a0, t4, a5
                  sltu       s2, a7, t4
                  c.sub      a4, a5
                  csrrsi     s6, 0x340, 5
                  nop
                  mulhsu     t1, t1, gp
                  mulhu      a2, t2, t5
                  slti       gp, a3, -871
                  c.andi     a1, 18
                  csrrwi     a3, 0x340, 16
                  sll        s3, s11, s11
                  c.add      a0, gp
                  c.mv       a4, t1
                  remu       s6, t3, t1
                  mulhsu     t6, s10, t2
                  xori       s3, a4, 825
                  csrrw      a1, 0x340, a6
                  csrrc      t0, 0x340, sp
                  xori       s10, s5, -606
                  remu       a5, t4, s4
                  c.sub      s0, a1
                  div        a7, s9, t0
                  csrrc      s6, 0x340, t1
                  c.lui      ra, 8
                  mul        tp, a7, t4
                  csrrc      s6, 0x340, t0
                  csrrs      a7, 0x340, s0
                  c.addi     t2, -1
                  auipc      s3, 479524
                  c.addi     a3, -1
                  c.li       s7, 31
                  c.andi     s0, 30
                  mul        a0, s0, t6
                  xori       t4, a4, 489
                  c.and      a2, a1
                  csrrw      s4, 0x340, t4
                  slt        s3, s3, t3
                  div        s11, t3, zero
                  mul        a4, s1, s3
                  mulhu      s2, s4, t0
                  remu       t3, s10, s6
                  ori        gp, a1, 1017
                  csrrci     s6, 0x340, 15
                  csrrw      gp, 0x340, gp
                  c.srli     a1, 17
                  c.or       s0, a5
                  csrrw      t3, 0x340, s4
                  c.andi     s1, 30
                  remu       t1, a5, a1
                  add        t1, s9, a2
                  or         s11, a6, s7
                  mulhu      t3, s3, zero
                  c.addi     a5, -1
                  mulhu      s10, tp, a6
                  c.sub      a5, a2
                  c.add      s11, s10
                  srai       a1, s3, 21
                  remu       a5, s9, tp
                  csrrsi     a1, 0x340, 11
                  c.srai     a5, 9
                  mulhu      t1, sp, ra
                  sra        ra, t6, t1
                  sra        a4, ra, s9
                  sll        t2, s9, t6
                  c.slli     s11, 18
                  c.srli     s0, 25
                  mul        a5, t5, t4
                  sltu       a1, s9, a4
                  c.slli     t6, 15
                  mulh       t4, s7, sp
                  sltiu      s2, t5, 555
                  csrrs      s4, 0x340, t4
                  c.srai     a2, 17
                  c.mv       s4, s10
                  and        s2, a4, ra
                  auipc      a2, 719464
                  c.andi     a1, 22
                  csrrs      s2, 0x340, s9
                  divu       t2, a0, s0
                  c.srli     s1, 22
                  c.or       s1, a4
                  sra        s4, a0, a7
                  csrrci     s10, 0x340, 17
                  c.li       a6, 15
                  c.sub      a4, a2
                  csrrsi     a7, 0x340, 29
                  c.srli     a2, 16
                  nop
                  mulhsu     s6, t4, t4
                  c.andi     s1, -1
                  srli       a5, s9, 3
                  or         s2, a2, t5
                  andi       zero, s11, 245
                  mul        s10, a1, a6
                  c.andi     a0, 8
                  auipc      s4, 237319
                  sub        s1, s1, s9
                  sub        t5, ra, zero
                  csrrwi     a1, 0x340, 0
                  rem        t4, s5, gp
                  csrrwi     s1, 0x340, 22
                  nop
                  csrrw      a1, 0x340, gp
                  c.sub      a4, a2
                  c.and      a5, a0
                  sra        t3, t4, zero
                  csrrs      a5, 0x340, a0
                  c.xor      a0, s0
                  c.slli     a0, 10
                  remu       t0, ra, gp
                  ori        t2, zero, 842
                  auipc      a1, 751034
                  mulhu      t1, s8, t0
                  and        s0, s3, a3
                  c.sub      a1, a2
                  ori        a4, a3, -760
                  xor        zero, t2, t3
                  sltu       a1, t4, s5
                  xor        a1, t1, s8
                  nop
                  nop
                  c.sub      a0, s0
                  rem        t5, s3, s11
                  srai       zero, s0, 31
                  slti       a6, s8, 349
                  div        t2, a3, s5
                  sub        s3, s7, s10
                  lui        s6, 166658
                  srai       s1, s5, 3
                  c.xor      a2, s1
                  rem        t5, a2, a5
                  xor        gp, a5, sp
                  sltu       a6, sp, a6
                  slli       s11, a3, 3
                  and        s0, tp, t1
                  csrrc      t4, 0x340, s11
                  and        ra, a6, s11
                  c.nop
                  andi       s1, s11, -786
                  c.add      s9, a0
                  xor        a1, sp, s5
                  div        a2, s6, a3
                  csrrci     s6, 0x340, 17
                  sltu       a2, t2, t3
                  sll        s1, s9, t0
                  srl        s10, a2, gp
                  c.addi     s9, -1
                  addi       t2, sp, -619
                  csrrw      gp, 0x340, ra
                  lui        s4, 1042776
                  remu       t3, t0, t2
                  c.nop
                  srli       t3, gp, 25
                  c.lui      s4, 12
                  c.srli     a5, 4
                  mulh       gp, tp, a5
                  sub        s7, gp, a6
                  or         a6, t0, a4
                  csrrsi     tp, 0x340, 1
                  rem        a1, s10, s8
                  c.srai     s1, 23
                  ori        a1, t3, 823
                  c.andi     a1, -1
                  csrrsi     t2, 0x340, 27
                  xor        a3, s7, zero
                  nop
                  c.xor      a1, s0
                  div        s10, a1, gp
                  addi       s9, t4, -907
                  srai       t5, t1, 10
                  auipc      a3, 416883
                  xor        a2, a2, a7
                  sll        s7, s7, a3
                  c.or       a4, s1
                  divu       a6, s5, s7
                  xori       s4, tp, -79
                  ori        s0, s0, -869
                  srai       s6, sp, 1
                  slli       a7, s5, 30
                  csrrwi     s6, 0x340, 16
                  sltu       s11, s10, s9
                  c.xor      a2, a5
                  divu       s9, s7, t5
                  c.srli     a0, 7
                  rem        t5, a6, sp
                  mulh       t5, a2, s4
                  csrrw      s9, 0x340, s9
                  add        a4, s4, s6
                  addi       a4, s7, 38
                  csrrwi     a1, 0x340, 17
                  or         a6, tp, t2
                  mulhu      t2, s11, s3
                  c.lui      a6, 20
                  mul        s9, s4, a2
                  slti       t2, t4, 520
                  slt        tp, gp, t1
                  mul        s7, a5, s5
                  mulhu      a5, t5, tp
                  xor        t5, s2, t6
                  sltiu      t5, t2, 34
                  c.or       a4, s0
                  mulhsu     s9, tp, s1
                  c.lui      t6, 1
                  sub        t2, t5, s3
                  rem        a7, tp, a7
                  nop
                  c.add      ra, s1
                  c.mv       s4, a2
                  srai       t6, t4, 2
                  slli       a5, t5, 20
                  csrrc      s2, 0x340, s7
                  srai       a5, a5, 5
                  c.slli     a0, 4
                  sra        a2, s8, a4
                  srai       s2, t3, 14
                  srl        a4, zero, s9
                  csrrwi     s10, 0x340, 1
                  sltu       a1, t0, a2
                  c.nop
                  or         t6, s10, t3
                  csrrw      gp, 0x340, a2
                  c.mv       a3, a7
                  add        s11, a0, s9
                  c.srli     a0, 12
                  c.add      s0, a7
                  c.or       a1, s1
                  slli       s10, s9, 3
                  csrrwi     s1, 0x340, 3
                  addi       t4, s8, -726
                  slti       a3, t3, -770
                  sltu       s3, s2, a6
                  slti       a1, s0, 81
                  c.srai     a2, 28
                  c.slli     t1, 18
                  sltu       a0, s11, s8
                  rem        gp, tp, t6
                  mul        a0, t3, s6
                  c.srli     a2, 27
                  c.andi     a2, 6
                  c.slli     t4, 25
                  csrrwi     a2, 0x340, 8
                  c.xor      a5, s1
                  or         t4, zero, t5
                  csrrs      t4, 0x340, s2
                  c.sub      a2, s1
                  c.lui      a1, 10
                  mulhsu     s2, s7, a5
                  c.addi     a3, 25
                  csrrsi     s0, 0x340, 12
                  mulhsu     s1, t2, t6
                  c.or       a2, s0
                  c.sub      a1, s1
                  c.add      a4, a1
                  c.li       s1, 31
                  ori        s7, a1, 160
                  c.sub      a0, a2
                  xori       s3, a2, -911
                  sll        t3, s9, a3
                  srai       a6, t3, 31
                  csrrc      t3, 0x340, t5
                  and        t0, s3, a2
                  rem        t1, a6, a0
                  csrrs      s4, 0x340, gp
                  mulh       s1, s11, t6
                  c.mv       t4, a7
                  c.sub      a0, a4
                  c.nop
                  or         a4, a4, t2
                  divu       s7, sp, t2
                  sltu       t6, t0, t6
                  slt        t2, s11, a4
                  nop
                  sltiu      zero, gp, 36
                  and        s2, s5, a7
                  add        zero, s0, a3
                  srai       tp, a4, 30
                  mul        ra, t1, a3
                  xor        t0, s9, s4
                  mulh       a3, s8, t6
                  c.or       a0, a4
                  c.srli     a5, 17
                  c.addi     s9, 31
                  c.srli     a1, 5
                  and        t3, s6, t0
                  mulhu      a0, s11, s6
                  srai       t0, a0, 27
                  lui        a7, 81226
                  slli       s2, zero, 17
                  c.addi     t0, -1
                  div        t2, a1, zero
                  and        a3, t5, t1
                  sll        t4, ra, s8
                  auipc      a5, 363106
                  c.andi     a4, 0
                  sll        ra, s2, s11
                  srl        s4, t2, a6
                  addi       a0, t1, -560
                  c.sub      a1, a4
                  csrrs      a7, 0x340, t1
                  mulhu      s7, s11, s1
                  c.add      t0, ra
                  c.add      gp, s9
                  mulh       s6, s7, a3
                  srl        s7, gp, s2
                  csrrc      a4, 0x340, s5
                  c.srai     a5, 2
                  srli       s7, t5, 15
                  addi       s10, a7, -610
                  sltiu      s10, a1, -283
                  c.srli     s1, 27
                  andi       t6, a3, -790
                  slt        t6, t4, s10
                  slt        a5, s5, s6
                  andi       t0, s0, -866
                  addi       t3, t0, 805
                  sltu       tp, s6, a7
                  and        s3, t0, gp
                  srl        s0, a0, t5
                  c.li       t6, -1
                  divu       t6, s9, a5
                  sltu       zero, s5, s3
                  auipc      s9, 636163
                  csrrsi     ra, 0x340, 21
                  mulhsu     zero, s11, s7
                  addi       a1, gp, -229
                  srl        a0, s7, s5
                  sll        s7, t0, a2
                  divu       a4, s2, s11
                  mulhu      s11, s5, a5
                  c.srli     s0, 29
                  c.srai     s0, 6
                  ori        zero, a0, 0
                  add        s0, s7, s3
                  addi       s11, a3, 488
                  csrrs      a5, 0x340, s3
                  c.srli     s0, 25
                  slli       a1, s5, 18
                  csrrs      gp, 0x340, a6
                  xori       a5, s8, 447
                  div        zero, s2, t2
                  divu       t3, s5, ra
                  c.addi     a0, 21
                  mulh       s10, s7, s7
                  add        s1, s3, s10
                  rem        t1, a2, s1
                  c.li       t1, 26
                  srli       tp, s4, 8
                  sltiu      t5, t3, 527
                  nop
                  sra        s11, s4, zero
                  c.lui      a6, 31
                  c.li       t5, 31
                  sltiu      zero, s0, 891
                  csrrs      a0, 0x340, a5
                  add        s7, s10, s9
                  srli       a2, a7, 17
                  csrrw      t3, 0x340, s2
                  divu       a7, t6, a6
                  ori        t4, s3, -284
                  sub        t5, a6, t5
                  andi       a6, s8, -871
                  c.andi     a2, 2
                  c.addi     t1, -1
                  slli       s1, t0, 24
                  c.nop
                  auipc      tp, 672948
                  ori        gp, s9, -794
                  csrrwi     s2, 0x340, 2
                  slti       ra, t0, -216
                  srai       zero, a4, 31
                  c.or       a5, a0
                  csrrwi     a2, 0x340, 3
                  srai       s0, s11, 22
                  slli       s3, s2, 26
                  mulh       t2, t1, s4
                  remu       a5, t1, t1
                  xor        a7, a4, s9
                  mulhsu     gp, t2, t0
                  mul        a7, s3, s8
                  or         a1, t1, zero
                  div        t0, s9, s7
                  slt        a1, zero, a3
                  c.add      t1, s1
                  sltiu      s11, s2, -232
                  xori       a2, a4, 491
                  add        a3, a2, t4
                  c.srli     s0, 31
                  sltu       a0, s11, t2
                  srai       s2, t6, 21
                  c.or       a2, a2
                  sll        s4, s8, s2
                  sra        t4, t0, sp
                  csrrs      a1, 0x340, t1
                  c.add      s7, a6
                  add        ra, gp, s11
                  c.li       s3, -1
                  rem        t1, s3, s1
                  sub        a6, s6, s9
                  sll        gp, t6, a5
                  c.li       s10, -1
                  srli       s9, a5, 16
                  andi       t2, t5, -411
                  slti       a0, t1, 222
                  c.and      s1, a4
                  slli       s1, a3, 23
                  xor        a6, s0, s11
                  slli       zero, s6, 5
                  csrrs      t3, 0x340, a7
                  srli       t4, s6, 9
                  srl        a2, s2, s11
                  csrrs      t3, 0x340, t1
                  sltu       s0, s11, t4
                  srai       t2, s4, 27
                  xori       gp, ra, 916
                  nop
                  csrrs      a2, 0x340, s2
                  srl        s3, a7, t4
                  c.srai     s0, 22
                  c.mv       t3, t3
                  c.nop
                  remu       a3, t4, s2
                  c.and      s0, s1
                  slt        s9, t2, s3
                  c.addi     a7, 28
                  c.addi     a1, -1
                  divu       s7, s9, t2
                  mulh       s2, a2, a6
                  mulh       s11, s4, t4
                  mulh       t1, zero, a5
                  c.mv       a6, sp
                  srli       t6, zero, 12
                  sll        tp, gp, tp
                  csrrsi     s6, 0x340, 10
                  csrrs      tp, 0x340, s7
                  sub        a3, s0, ra
                  mul        a3, a1, s5
                  sra        s1, s7, t6
                  and        s11, s4, t6
                  mulhsu     tp, s6, zero
                  c.li       s0, -1
                  sub        s3, a0, s9
                  div        t4, a2, a4
                  mulhsu     t0, a0, s10
                  slti       t3, a4, 144
                  csrrs      a6, 0x340, s4
                  sltiu      ra, s10, 823
                  c.lui      s6, 5
                  or         s7, s5, t6
                  c.srli     a3, 8
                  nop
                  divu       a6, t1, a7
                  c.and      a5, a4
                  andi       s0, s10, -6
                  sltiu      a1, t6, 66
                  addi       a1, zero, 510
                  c.slli     t5, 16
                  addi       a5, s10, -700
                  slt        s1, t0, sp
                  csrrsi     s4, 0x340, 9
                  c.add      t1, s6
                  c.addi     a0, -1
                  mulhu      a5, ra, a2
                  c.mv       t1, gp
                  sltu       a4, a7, a4
                  remu       a2, s5, zero
                  rem        t3, a7, s7
                  rem        a0, sp, t6
                  c.li       t3, 18
                  xori       t5, a6, 148
                  sra        t6, t0, gp
                  mulhu      t0, s9, s11
                  slt        zero, s6, s10
                  csrrci     s7, 0x340, 8
                  c.sub      a5, a1
                  srl        ra, s10, gp
                  c.addi     a3, 4
                  slti       s0, a2, -144
                  c.li       t0, 24
                  rem        s4, t2, t6
                  slti       s11, t5, -1006
                  srli       s10, s1, 1
                  nop
                  andi       t1, s1, 528
                  sltiu      t3, s5, 401
                  sltiu      t3, tp, 192
                  c.add      s3, t5
                  xor        s6, s4, t6
                  xori       a5, a2, 309
                  csrrs      a2, 0x340, s2
                  divu       a2, t3, a6
                  addi       a5, t0, -197
                  mulhu      a6, s9, s8
                  sltu       s6, a7, a6
                  srai       s2, t4, 15
                  lui        s6, 403066
                  c.and      s0, a3
                  mulhsu     t1, a5, s4
                  c.srai     a3, 21
                  c.or       a0, s1
                  srai       s6, tp, 18
                  csrrsi     s3, 0x340, 3
                  sub        t2, s1, s11
                  add        a4, t0, a0
                  sra        a3, t1, s2
                  addi       a1, sp, -594
                  c.mv       a3, t2
                  c.slli     s11, 21
                  div        s11, s5, s6
                  mulhsu     s11, a3, s4
                  sll        s7, a5, a1
                  srli       s10, a1, 3
                  slt        a6, s1, s4
                  c.andi     a5, -1
                  rem        s1, t0, s4
                  andi       t2, tp, -464
                  nop
                  c.add      s2, s3
                  c.srli     a1, 19
                  sra        s9, s4, t5
                  c.add      t0, a4
                  div        s7, ra, t3
                  csrrc      t4, 0x340, s2
                  nop
                  c.srai     a2, 12
                  sra        s1, a1, s4
                  c.add      t2, a7
                  sll        t0, s2, s0
                  c.li       s10, 5
                  xor        s3, s8, a7
                  c.sub      a2, a3
                  add        s10, s4, t6
                  srai       t0, a7, 17
                  srl        s9, t6, a7
                  lui        t4, 779073
                  remu       a1, s1, a7
                  c.li       s0, 14
                  csrrsi     t5, 0x340, 18
                  c.mv       a0, s0
                  c.slli     a7, 19
                  remu       s6, t3, s9
                  sltiu      t4, s8, -399
                  c.nop
                  csrrci     t4, 0x340, 1
                  srai       a0, s0, 12
                  c.and      a5, a2
                  lui        a0, 290217
                  csrrsi     a6, 0x340, 2
                  sltiu      t3, a3, -865
                  c.srai     a5, 13
                  csrrwi     s3, 0x340, 12
                  srl        ra, zero, ra
                  slti       a0, t1, 794
                  div        t3, a0, t1
                  c.sub      s0, a3
                  or         s11, t3, sp
                  sub        s4, a1, s10
                  sra        s6, ra, a5
                  xor        s7, s6, s11
                  c.addi     t0, 1
                  divu       s7, gp, t2
                  sll        a2, a5, t3
                  c.lui      a1, 28
                  mul        gp, zero, s7
                  c.li       s9, 23
                  c.addi     a0, -1
                  c.add      a2, t0
                  c.li       s10, 0
                  c.or       s1, a4
                  srai       gp, s11, 2
                  c.sub      s1, s0
                  c.sub      a1, a2
                  c.srai     a2, 6
                  srai       a0, s7, 2
                  sltu       s2, a7, sp
                  csrrc      s3, 0x340, s1
                  c.srli     a3, 29
                  c.mv       t4, tp
                  csrrsi     zero, 0x340, 9
                  csrrc      t1, 0x340, a0
                  c.and      a0, a0
                  xori       s3, s11, -589
                  ori        a3, a0, -475
                  csrrw      a3, 0x340, s5
                  c.xor      a0, s0
                  csrrw      t4, 0x340, s0
                  slt        t5, a7, a7
                  c.srli     a1, 4
                  add        s3, sp, s0
                  c.and      a5, a0
                  c.or       s1, a5
                  csrrc      s11, 0x340, ra
                  c.srli     s0, 4
                  nop
                  mulh       s6, s2, s5
                  c.mv       s1, ra
                  csrrci     s1, 0x340, 31
                  csrrwi     t0, 0x340, 31
                  csrrsi     a4, 0x340, 15
                  sra        t3, s9, s5
                  auipc      a7, 827666
                  xori       s3, a1, -45
                  div        a3, a3, t3
                  srli       s0, sp, 6
                  add        s7, s6, zero
                  rem        a6, s6, t2
                  c.srai     a2, 15
                  lui        t5, 999962
                  srl        t4, gp, sp
                  auipc      s6, 532840
                  c.mv       s0, sp
                  divu       a3, t6, t0
                  c.add      a3, a7
                  div        t0, s6, t1
                  c.slli     a7, 20
                  csrrwi     s11, 0x340, 7
                  c.slli     s9, 17
                  csrrw      a7, 0x340, ra
                  divu       ra, zero, s2
                  xor        t0, a0, s2
                  c.li       a0, 30
                  c.sub      a4, a4
                  slti       s3, s1, -334
                  c.addi     s6, 16
                  c.nop
                  c.srai     a2, 9
                  sltu       t5, t4, s10
                  c.slli     s9, 15
                  c.or       a1, a5
                  csrrsi     s3, 0x340, 13
                  lui        t1, 409850
                  c.sub      a1, s1
                  c.nop
                  srai       a7, gp, 16
                  srl        s3, a3, t1
                  sra        gp, t4, a5
                  mul        s10, a6, s1
                  xori       s0, s1, 487
                  csrrwi     t1, 0x340, 2
                  or         s0, s8, s5
                  slli       s0, tp, 24
                  csrrw      s7, 0x340, a1
                  csrrsi     ra, 0x340, 24
                  csrrw      a0, 0x340, s8
                  slt        s10, a3, a6
                  ori        t6, t3, 691
                  srl        s0, s4, s4
                  ori        t6, a4, 89
                  add        t1, s9, s3
                  divu       t3, s2, a1
                  c.mv       s6, s6
                  sltu       a0, a5, zero
                  csrrsi     t2, 0x340, 22
                  c.nop
                  nop
                  mul        t4, sp, s5
                  nop
                  ori        t3, s3, 81
                  c.addi     s0, 23
                  csrrc      s2, 0x340, t5
                  csrrc      a7, 0x340, a2
                  c.li       s0, -1
                  divu       s10, s7, s0
                  c.and      a3, a2
                  csrrwi     a2, 0x340, 16
                  csrrci     s11, 0x340, 25
                  ori        s11, tp, 990
                  andi       a1, s1, -292
                  mulhu      a4, a0, gp
                  mul        a6, t5, s11
                  sub        s1, a2, s1
                  srl        a7, ra, s8
                  csrrsi     t3, 0x340, 13
                  mulhu      a6, gp, a6
                  srli       s2, sp, 18
                  sltu       s4, gp, s8
                  slli       a5, ra, 7
                  remu       a3, s6, ra
                  c.mv       s10, s1
                  mulhu      ra, a4, s2
                  sltiu      gp, s6, -242
                  auipc      a4, 566308
                  sra        a7, a3, a4
                  slt        a5, t5, sp
                  c.sub      a5, s0
                  andi       s9, sp, 557
                  rem        a0, s9, a0
                  c.add      t5, a0
                  nop
                  c.mv       a7, t1
                  c.addi     gp, 31
                  c.and      a5, a2
                  mulhsu     s7, s5, s8
                  div        s1, a3, tp
                  andi       s11, t1, 171
                  csrrci     t0, 0x340, 27
                  remu       s2, s3, a2
                  divu       s1, a5, a2
                  c.addi     a3, -1
                  c.srli     a1, 2
                  xor        s1, s1, a1
                  c.and      a3, a5
                  csrrw      t1, 0x340, s0
                  remu       a0, tp, t4
                  andi       s1, a1, -237
                  c.srai     a0, 25
                  sltu       t6, tp, s8
                  srli       s1, a4, 2
                  mul        t0, s9, s7
                  c.add      s9, s1
                  slli       s0, tp, 9
                  rem        a0, s6, a3
                  csrrc      t5, 0x340, s11
                  csrrwi     a5, 0x340, 10
                  slli       s10, a1, 14
                  slt        a5, a0, zero
                  nop
                  c.lui      a1, 29
                  c.andi     a4, 2
                  c.slli     gp, 1
                  c.mv       s3, t3
                  remu       a4, t6, a5
                  slli       t5, s3, 19
                  c.or       a1, s1
                  lui        a2, 390888
                  mulh       s10, sp, t3
                  or         t4, a6, t1
                  c.andi     a4, 22
                  c.addi     a7, -1
                  mulhsu     a5, a6, t3
                  ori        s1, sp, -230
                  c.nop
                  slli       s9, a3, 22
                  c.nop
                  mul        a3, a1, s11
                  sll        a0, t2, s9
                  sltu       t6, a2, s2
                  divu       s6, s3, t4
                  sltu       gp, a3, a7
                  c.slli     a0, 2
                  add        t1, tp, s11
                  sll        ra, t4, s9
                  mul        t4, s0, a6
                  srl        a4, s2, s10
                  andi       t0, s10, 906
                  xori       s6, a6, 474
                  auipc      s1, 1044863
                  slt        s0, a7, t0
                  csrrci     s1, 0x340, 9
                  sltu       a0, s5, a1
                  c.or       a0, a1
                  csrrs      a6, 0x340, a7
                  c.li       s6, -1
                  rem        t3, t4, s9
                  c.lui      s0, 1
                  csrrs      a0, 0x340, a2
                  c.andi     s1, -1
                  srli       s3, s7, 2
                  c.addi     s1, 11
                  c.slli     s6, 11
                  lui        a1, 388955
                  xor        t5, t5, s6
                  remu       a4, s0, t0
                  c.srli     a4, 10
                  srli       a3, s1, 6
                  lui        s4, 284182
                  mul        s7, t4, s9
                  sub        s0, s7, s6
                  c.nop
                  c.lui      a1, 18
                  add        t2, t0, s5
                  nop
                  csrrw      s1, 0x340, s2
                  sub        s9, a0, a0
                  c.xor      a3, a5
                  c.xor      a0, a3
                  xor        a7, s8, t0
                  mul        t1, s11, t6
                  c.srai     a3, 15
                  sll        gp, zero, t0
                  mulhsu     s10, t4, s6
                  sltiu      tp, t1, -587
                  c.sub      a4, a4
                  c.or       a3, a2
                  c.and      a1, a3
                  c.or       a4, s1
                  divu       t4, t4, a7
                  c.and      a4, s0
                  nop
                  auipc      s2, 46633
                  c.nop
                  c.srai     a5, 31
                  add        tp, a0, s1
                  sll        a2, s2, tp
                  c.nop
                  andi       s9, a0, 768
                  mulhsu     a0, a5, sp
                  csrrci     ra, 0x340, 18
                  csrrs      t1, 0x340, ra
                  c.xor      a0, a4
                  c.mv       s6, sp
                  sll        tp, t0, gp
                  addi       t1, s11, -402
                  div        t4, s8, a2
                  ori        a5, s11, 635
                  c.andi     a3, -1
                  sra        gp, t6, s9
                  c.mv       s7, ra
                  mulhu      tp, a3, s9
                  rem        s3, s9, s10
                  c.and      s0, a5
                  sltu       t0, t1, s2
                  andi       gp, ra, -260
                  sltiu      t3, s10, 149
                  remu       tp, s11, tp
                  c.xor      a0, a3
                  divu       a4, s0, s0
                  auipc      t4, 795376
                  or         t1, s6, s2
                  c.slli     s11, 22
                  slli       a5, s8, 2
                  slti       a5, tp, 176
                  div        a4, s10, t4
                  addi       ra, s9, 979
                  srai       zero, t0, 7
                  and        tp, t6, t4
                  sll        a0, t4, s4
                  or         s2, s5, s0
                  auipc      a1, 771301
                  lui        a6, 20800
                  sll        a6, s3, t6
                  add        s10, a7, zero
                  slli       zero, s7, 9
                  xor        a3, zero, a6
                  sltu       t0, s11, a1
                  csrrw      t4, 0x340, a4
                  c.or       s0, a0
                  srl        a2, t4, a7
                  divu       t3, a0, a7
                  mulhu      s0, s3, a1
                  and        t1, s11, t2
                  sll        tp, s0, s11
                  mulh       t2, s8, t5
                  srl        s1, a2, a2
                  xor        t3, a0, s1
                  slt        s9, a6, a0
                  csrrs      s10, 0x340, t0
                  csrrw      a6, 0x340, zero
                  c.srli     s1, 6
                  rem        s7, t5, a1
                  rem        a3, s7, t3
                  csrrwi     tp, 0x340, 19
                  csrrw      a3, 0x340, a3
                  srl        a6, s2, a2
                  slt        t2, t6, s4
                  andi       a2, s10, 85
                  c.and      a2, a1
                  c.srli     a2, 27
                  csrrci     t4, 0x340, 30
                  srli       s6, s11, 9
                  c.li       tp, -1
                  c.add      s6, s2
                  c.nop
                  add        tp, a2, s2
                  andi       s0, a0, -338
                  xori       s2, a3, -198
                  div        s9, ra, a1
                  csrrs      s7, 0x340, a1
                  csrrs      t0, 0x340, gp
                  sltiu      s9, t2, -606
                  sub        s3, s8, a1
                  csrrci     t2, 0x340, 15
                  xor        gp, s3, s10
                  c.li       s6, -1
                  slli       s0, t6, 24
                  add        t2, a0, ra
                  addi       t4, s3, -764
                  c.addi     s9, 5
                  ori        s2, s9, -316
                  c.xor      s0, s1
                  srli       t4, s3, 25
                  sll        t5, zero, a1
                  c.and      a0, a5
                  c.add      s0, s3
                  slt        a5, a3, s2
                  c.andi     s1, 5
                  mul        a3, a1, s11
                  addi       t3, s7, -574
                  andi       s4, t0, -147
                  xori       t1, s10, -542
                  c.addi     t2, 18
                  c.xor      a3, a2
                  c.li       t4, 29
                  c.xor      s0, a3
                  c.xor      a0, a2
                  c.add      a6, tp
                  add        t6, a7, s0
                  c.lui      ra, 27
                  slli       t4, s8, 12
                  sltiu      t1, sp, 117
                  sll        ra, a3, t3
                  addi       s10, a7, 844
                  add        a2, a0, t2
                  xori       a0, t0, 1008
                  xori       ra, a1, 942
                  slli       a2, s1, 20
                  c.mv       s11, gp
                  and        t1, s0, a2
                  sltu       a4, t3, a5
                  xori       tp, ra, -636
                  c.mv       a2, t4
                  c.xor      a4, a0
                  xori       s6, s2, 1003
                  slti       s6, a3, -372
                  csrrw      t3, 0x340, s4
                  mulhsu     a7, s9, s10
                  slti       t2, t6, -1013
                  sll        ra, t6, a0
                  c.nop
                  sra        s9, t4, zero
                  rem        s0, s1, a2
                  c.slli     a4, 10
                  c.srai     a1, 30
                  rem        s3, a5, a0
                  lui        t2, 226040
                  c.nop
                  sra        tp, tp, s8
                  sub        t5, sp, t3
                  c.nop
                  rem        gp, s0, t5
                  c.sub      s1, a3
                  mul        s2, s2, a1
                  mulhu      t0, t0, a5
                  add        a1, tp, a6
                  c.xor      s0, a4
                  c.add      s0, s2
                  csrrw      a2, 0x340, t1
                  c.or       a0, a0
                  xor        a7, s1, sp
                  csrrw      t1, 0x340, s7
                  divu       gp, s7, sp
                  c.nop
                  and        t6, a6, t0
                  csrrs      a4, 0x340, t0
                  mulh       s3, a0, s3
                  sltiu      ra, s8, 974
                  mul        ra, a1, a6
                  mulhu      s1, gp, t2
                  divu       a2, s5, gp
                  c.andi     a0, -1
                  c.li       s0, 19
                  csrrc      s7, 0x340, s1
                  divu       s1, t3, a3
                  rem        s9, a5, a3
                  c.srli     a0, 18
                  c.mv       ra, t3
                  c.mv       s0, a2
                  slti       t0, t2, -348
                  csrrs      a5, 0x340, t2
                  sll        t3, s1, a4
                  c.sub      a0, s0
                  c.srai     a5, 13
                  slli       s9, t3, 20
                  mulh       tp, t0, s2
                  add        s4, s1, ra
                  mulhu      zero, ra, a1
                  mul        gp, a5, a6
                  sub        zero, tp, a3
                  addi       ra, t1, -68
                  c.add      a6, a0
                  c.and      a4, a5
                  slti       s7, a3, -71
                  addi       s4, a5, 754
                  c.srli     a5, 18
                  ori        s6, t2, 256
                  c.and      a0, a4
                  sltu       s4, s2, a3
                  xor        s11, t3, t0
                  c.and      a2, a5
                  c.slli     t1, 28
                  csrrci     t4, 0x340, 10
                  mulhsu     s7, s0, a3
                  or         s11, s8, s11
                  srai       gp, s3, 6
                  c.lui      a0, 21
                  divu       a1, a7, t4
                  divu       zero, s4, t6
                  srl        s7, a5, zero
                  ori        a3, tp, 93
                  mulhu      s9, zero, t2
                  sra        s6, s0, a5
                  c.andi     s0, 29
                  csrrsi     t5, 0x340, 31
                  c.mv       t3, s11
                  divu       tp, a5, s3
                  c.xor      a1, a5
                  sra        a6, sp, t5
                  srai       a2, t4, 19
                  slli       t6, ra, 10
                  sra        t5, s3, sp
                  srli       s3, a2, 16
                  mulhsu     a6, s1, s7
                  sltiu      gp, t4, 857
                  csrrci     s11, 0x340, 0
                  csrrc      a7, 0x340, t0
                  c.andi     a1, -1
                  sltu       t2, a1, s1
                  c.mv       s2, s7
                  mulh       s2, s5, a7
                  c.srli     a3, 7
                  remu       t1, t6, t2
                  c.srli     a1, 28
                  c.add      a0, s8
                  lui        s0, 577601
                  csrrw      s9, 0x340, s0
                  c.lui      a1, 15
                  c.slli     s7, 4
                  c.sub      s1, s1
                  csrrw      t6, 0x340, a0
                  mulhu      a4, t4, s3
                  srli       t3, s4, 29
                  ori        t3, s7, -857
                  c.sub      a3, a2
                  sltu       a1, s11, s11
                  nop
                  csrrs      t6, 0x340, t6
                  srai       s4, t4, 23
                  remu       s9, s11, a6
                  add        ra, t1, s8
                  c.srli     s1, 14
                  c.add      s4, a0
                  sltiu      tp, t5, 504
                  c.sub      a3, a4
                  sltiu      t5, s4, 981
                  csrrs      s7, 0x340, s10
                  mulhsu     a1, a7, s11
                  srl        a6, t4, s8
                  c.sub      a2, a3
                  c.li       tp, 13
                  csrrci     s1, 0x340, 6
                  xori       s2, t4, 844
                  srli       a6, t1, 18
                  and        zero, a6, s6
                  c.srli     a2, 21
                  div        zero, a3, a1
                  srli       tp, t5, 25
                  divu       a0, a6, s10
                  c.and      a4, a0
                  xori       t2, zero, 281
                  srli       t3, t2, 20
                  ori        t3, ra, 954
                  csrrs      t0, 0x340, s10
                  ori        a3, s9, -105
                  c.slli     a7, 21
                  sltiu      t6, t2, 1019
                  srl        gp, t4, sp
                  c.xor      s0, a4
                  sltiu      s1, zero, -792
                  slti       s3, zero, 847
                  ori        tp, a1, 16
                  auipc      ra, 320548
                  mul        a2, a0, a1
                  sra        s4, t4, a7
                  divu       s0, s2, a7
                  c.srli     a3, 29
                  mulhsu     s4, s5, zero
                  c.addi     a6, 21
                  sub        s2, t0, sp
                  c.lui      a6, 29
                  sll        t4, t5, sp
                  sra        t1, t1, tp
                  or         t6, gp, t6
                  srli       s0, s2, 14
                  srli       a5, s2, 15
                  auipc      a2, 1037286
                  lui        a5, 1036507
                  c.xor      s0, a2
                  remu       s9, s2, s8
                  auipc      a5, 460435
                  mulhu      a6, a7, t6
                  c.srai     a1, 3
                  mulhu      t4, t2, ra
                  c.nop
                  mulhu      t0, t1, s8
                  csrrsi     s7, 0x340, 14
                  sra        a5, s3, a6
                  sub        s0, a5, a7
                  mulh       gp, t6, s10
                  mul        t6, s4, t0
                  c.nop
                  sll        a7, sp, s4
                  and        s11, t1, t1
                  srai       s7, t6, 17
                  mul        a7, s9, s8
                  c.mv       s1, sp
                  c.srai     a5, 6
                  csrrci     s0, 0x340, 21
                  slti       t5, s4, 748
                  c.or       a2, a4
                  c.li       t2, 14
                  nop
                  c.add      t3, a7
                  auipc      t6, 541023
                  csrrwi     gp, 0x340, 13
                  c.srli     s1, 20
                  c.slli     a5, 18
                  c.srai     a5, 3
                  sltiu      t2, t2, 132
                  srl        a6, sp, ra
                  srli       s0, s6, 26
                  csrrci     s7, 0x340, 5
                  rem        t4, s0, s8
                  c.and      s1, s1
                  srai       s11, zero, 1
                  csrrs      t6, 0x340, a3
                  srli       tp, s9, 15
                  csrrw      s4, 0x340, s3
                  c.mv       t5, a1
                  nop
                  csrrw      s3, 0x340, s8
                  c.srai     s0, 28
                  c.slli     s9, 16
                  srl        a0, s10, gp
                  slt        t5, a2, s1
                  c.or       s1, a3
                  c.srli     a5, 4
                  andi       t2, gp, -6
                  csrrci     tp, 0x340, 24
                  srl        gp, s9, tp
                  csrrw      a0, 0x340, tp
                  c.add      t2, t5
                  c.andi     a0, 13
                  mulhu      ra, a1, s8
                  mulhsu     s1, t6, s4
                  slli       a3, a4, 27
                  rem        t4, s11, s3
                  divu       s4, zero, s4
                  c.nop
                  srai       tp, a7, 31
                  divu       s10, t0, ra
                  sra        t4, s8, s1
                  andi       s4, s0, 220
                  c.nop
                  sltiu      t0, t5, 584
                  sll        s1, s0, s2
                  lui        s9, 65265
                  c.srli     s0, 2
                  slti       t4, tp, -144
                  c.slli     t4, 31
                  srl        s6, t1, s0
                  csrrwi     s7, 0x340, 13
                  csrrwi     gp, 0x340, 17
                  sltu       a4, s7, s11
                  mulhu      gp, s1, s5
                  srl        a7, ra, tp
                  divu       s1, t5, s0
                  sub        s9, a4, s9
                  c.add      s3, s6
                  csrrsi     a2, 0x340, 4
                  mulhsu     a5, s2, s0
                  csrrw      a7, 0x340, a6
                  c.mv       s11, t0
                  c.slli     s1, 14
                  csrrc      s3, 0x340, t6
                  sltiu      a5, a6, 1
                  csrrs      s7, 0x340, zero
                  srai       a2, t6, 2
                  c.slli     s3, 1
                  xori       a0, a2, 429
                  sltiu      t5, zero, 562
                  c.srli     a3, 3
                  sub        a1, s1, a5
                  c.and      s0, a2
                  mulhsu     zero, t2, t6
                  auipc      tp, 227376
                  rem        t6, t3, a7
                  slli       tp, s9, 9
                  auipc      t4, 35287
                  and        a7, s11, s5
                  c.srli     s1, 22
                  divu       zero, s2, s7
                  c.mv       ra, s0
                  csrrwi     gp, 0x340, 10
                  andi       a0, a6, 211
                  srl        t6, s9, s5
                  add        a4, s11, s8
                  sub        s4, t0, s5
                  auipc      t3, 214725
                  srl        ra, t2, a7
                  mulhsu     a0, s3, s3
                  c.srai     s0, 14
                  auipc      t0, 873564
                  c.srai     a0, 13
                  slt        ra, s0, a4
                  c.srai     a2, 13
                  slt        a2, s10, a6
                  sltiu      zero, a5, -1009
                  csrrsi     t6, 0x340, 18
                  andi       s1, ra, 846
                  sra        s3, a7, s7
                  c.addi     a1, -1
                  csrrc      a3, 0x340, t4
                  sra        a2, s8, sp
                  srl        zero, s3, a4
                  c.addi     s0, -1
                  div        a4, a5, s10
                  sll        a2, a0, t1
                  csrrw      a7, 0x340, t4
                  mulhu      s6, s6, a1
                  sub        s2, s2, s9
                  c.xor      s0, a4
                  c.xor      s1, a2
                  c.slli     s7, 14
                  csrrc      s1, 0x340, gp
                  or         a7, a7, t6
                  div        tp, s8, ra
                  c.slli     t3, 26
                  c.andi     a1, 20
                  addi       a6, tp, 395
                  c.or       a1, a5
                  c.slli     t4, 7
                  srai       s9, t4, 26
                  c.nop
                  c.srli     a4, 20
                  c.or       s0, s0
                  andi       a5, ra, -700
                  mul        ra, t6, t3
                  c.nop
                  mulhu      s2, t5, t4
                  c.andi     a4, -1
                  c.andi     a0, 28
                  c.or       s1, a5
                  c.mv       a4, a5
                  addi       a2, t0, -546
                  sra        tp, s0, a5
                  auipc      t6, 352676
                  mulh       a0, s0, tp
                  sub        s6, s6, a0
                  and        t2, s9, s3
                  mulhu      s0, a4, a3
                  xor        s10, s7, s6
                  remu       t1, a1, s10
                  csrrsi     ra, 0x340, 14
                  c.nop
                  csrrs      t1, 0x340, s9
                  sub        ra, a5, sp
                  slli       s2, t3, 30
                  c.addi     a0, 1
                  c.lui      s2, 5
                  or         a1, t3, t1
                  c.sub      a5, a2
                  divu       s1, s0, t5
                  csrrwi     s11, 0x340, 10
                  auipc      tp, 319162
                  slli       t5, a6, 10
                  or         a2, s3, a5
                  add        s6, ra, a5
                  remu       s6, s2, s2
                  sub        s4, s4, a2
                  c.srli     a4, 27
                  nop
                  slti       s4, s2, -216
                  c.nop
                  ori        s4, s3, 694
                  and        a1, t0, t2
                  c.or       a4, a1
                  divu       s4, sp, zero
                  mul        a7, t3, s9
                  remu       a1, s7, a1
                  c.andi     s1, -1
                  nop
                  or         a3, s11, s11
                  mul        zero, s1, ra
                  xori       s6, s10, 684
                  srli       t3, t5, 22
                  csrrs      t1, 0x340, t2
                  csrrsi     gp, 0x340, 19
                  sub        t0, s6, s9
                  c.or       s0, a4
                  or         a3, gp, s7
                  csrrsi     a7, 0x340, 16
                  andi       t1, a1, 932
                  mulhsu     s1, t5, s11
                  c.nop
                  and        s4, s10, tp
                  slti       a6, s2, 993
                  c.nop
                  mulh       s2, t0, s6
                  sltiu      t4, s1, -542
                  srai       s9, s3, 23
                  c.andi     s1, -1
                  addi       a7, t2, -621
                  c.lui      t1, 20
                  c.srli     a1, 12
                  mulhu      t6, s10, s1
                  srai       a1, a7, 1
                  nop
                  c.lui      s0, 30
                  c.sub      s0, s1
                  divu       a6, gp, s8
                  c.xor      a4, a4
                  xor        s2, a0, a7
                  sra        a0, a4, s4
                  c.and      a2, s0
                  slti       gp, a5, 428
                  mulhsu     s6, s9, s11
                  srl        a3, s3, tp
                  c.srli     a2, 6
                  csrrwi     s3, 0x340, 3
                  csrrw      t4, 0x340, s1
                  c.addi     s10, -1
                  c.and      a5, s1
                  c.srli     a5, 3
                  andi       s9, a4, -217
                  xori       s3, s3, 361
                  c.or       s1, a3
                  c.andi     a4, 9
                  xor        s2, s1, t6
                  c.slli     t0, 30
                  sra        a7, s11, s11
                  csrrwi     ra, 0x340, 17
                  slti       a6, s6, 372
                  csrrci     s4, 0x340, 11
                  slli       ra, s2, 5
                  or         s2, s6, sp
                  csrrs      s9, 0x340, t1
                  slli       s11, sp, 26
                  add        a7, sp, s8
                  c.add      s0, s9
                  c.xor      a2, a2
                  c.slli     s0, 5
                  sra        ra, gp, a5
                  slt        t6, t6, t4
                  slti       s9, a1, 543
                  srli       s11, s1, 31
                  mulhsu     s11, tp, zero
                  ori        t0, s4, 342
                  c.sub      a0, s0
                  and        a1, s5, a6
                  remu       t5, s2, s3
                  xori       s6, a0, 59
                  c.xor      a2, a4
                  srai       t6, s1, 0
                  c.nop
                  c.add      s6, a4
                  srl        s7, s10, tp
                  c.lui      a7, 5
                  or         zero, zero, zero
                  csrrwi     s6, 0x340, 16
                  c.srai     a2, 16
                  remu       s6, t5, t0
                  c.nop
                  srli       a4, t6, 7
                  mulhu      s0, t5, sp
                  mulhu      a5, s1, a3
                  sltu       s11, s1, a4
                  csrrsi     a1, 0x340, 16
                  sra        t5, sp, s6
                  c.or       a4, a4
                  and        zero, s3, s5
                  c.srli     s0, 24
                  mul        t3, a4, a3
                  c.and      s0, a2
                  c.slli     t5, 19
                  sub        a0, s8, t5
                  lui        t5, 133449
                  c.lui      a3, 15
                  c.nop
                  remu       a0, t2, t2
                  c.and      a1, a2
                  sra        s3, s8, s3
                  srli       t0, a0, 15
                  andi       zero, s8, 584
                  add        zero, s7, s3
                  c.or       s0, a3
                  divu       t2, sp, t4
                  and        t0, s4, a4
                  c.srli     a0, 3
                  slti       s11, t2, 532
                  c.addi     s9, -1
                  c.li       t1, -1
                  add        s10, s9, s4
                  or         t1, a2, s7
                  auipc      t5, 223117
                  and        ra, s6, s7
                  addi       a2, t2, -879
                  csrrs      a0, 0x340, s5
                  nop
                  divu       t4, a7, tp
                  csrrs      t0, 0x340, gp
                  srai       t2, ra, 2
                  csrrwi     t6, 0x340, 28
                  sltu       zero, s9, zero
                  csrrw      t3, 0x340, t4
                  c.srli     a0, 4
                  csrrwi     s6, 0x340, 7
                  c.li       t5, -1
                  srli       a3, t6, 12
                  c.andi     a5, 10
                  srl        s3, s5, tp
                  csrrci     t4, 0x340, 7
                  remu       a4, s1, a3
                  add        t6, ra, s0
                  csrrci     t4, 0x340, 9
                  c.and      s0, a5
                  mulhsu     a6, s7, s1
                  slli       a0, a2, 15
                  auipc      a5, 532988
                  or         t4, s2, tp
                  slli       ra, a5, 18
                  csrrci     a1, 0x340, 6
                  div        tp, t0, zero
                  add        t1, t4, s1
                  c.or       s1, s0
                  add        a1, s5, t1
                  and        s7, s6, a4
                  addi       s4, a3, 107
                  csrrw      s3, 0x340, sp
                  c.slli     t4, 1
                  mul        s6, s2, zero
                  csrrc      tp, 0x340, gp
                  c.srai     a1, 23
                  c.addi     tp, 30
                  srai       a7, t6, 18
                  c.li       t1, -1
                  csrrs      t6, 0x340, s8
                  mulh       a6, zero, a6
                  c.lui      s4, 19
                  csrrc      s7, 0x340, a0
                  mul        s0, s1, t0
                  sra        s10, a7, t6
                  mulh       t0, t5, s3
                  c.slli     a6, 27
                  or         s4, s8, a3
                  and        s9, s1, s9
                  csrrc      zero, 0x340, s4
                  addi       t3, a0, -74
                  c.and      s1, a0
                  mulhu      a5, s6, t2
                  addi       s1, s8, -754
                  c.and      a2, a2
                  c.and      s0, a5
                  c.and      a3, a2
                  andi       s11, zero, 544
                  sub        t6, s0, ra
                  c.and      a1, s0
                  c.addi     a2, -1
                  sra        a4, s8, s4
                  srl        t2, a1, a5
                  sltiu      t4, t4, -435
                  and        a3, a1, sp
                  slt        a7, s4, s5
                  srl        a3, a4, a2
                  sltiu      s7, s8, 549
                  srli       a4, a6, 26
                  c.li       s9, 11
                  c.or       a1, a2
                  c.and      a4, a0
                  sll        t6, t0, s0
                  slti       t6, t1, -649
                  c.srli     a5, 24
                  addi       a3, s2, -320
                  auipc      a5, 112613
                  or         s10, s11, s2
                  mul        a2, s1, t1
                  mulhu      t1, s3, tp
                  c.slli     a7, 18
                  csrrwi     ra, 0x340, 30
                  c.srli     a0, 7
                  c.slli     t6, 30
                  c.nop
                  c.li       s1, 19
                  rem        s4, ra, t6
                  c.sub      a1, a2
                  csrrsi     s4, 0x340, 0
                  csrrsi     zero, 0x340, 31
                  c.andi     s1, -1
                  srai       a6, s3, 0
                  xori       t0, a2, 336
                  mulhsu     s0, s2, a4
                  csrrw      a6, 0x340, a3
                  mulh       t2, a6, t1
                  sub        a7, s4, s11
                  c.xor      s0, a0
                  sltiu      s1, s11, 747
                  c.xor      s0, s0
                  srli       t5, sp, 6
                  c.or       a0, a4
                  sltu       s0, t2, a2
                  c.andi     a5, -1
                  c.andi     a5, -1
                  add        t2, a7, ra
                  srl        s11, s2, s2
                  c.addi     a2, -1
                  and        s7, s9, s1
                  csrrwi     a3, 0x340, 29
                  c.lui      a1, 30
                  c.lui      a1, 29
                  csrrc      ra, 0x340, t5
                  sra        a2, a5, s7
                  c.srai     a2, 29
                  divu       t5, s6, s11
                  addi       a6, t3, -894
                  sltu       a5, a4, t4
                  srl        a0, t0, s6
                  c.xor      a5, a3
                  sltiu      t4, s6, -1003
                  csrrs      s1, 0x340, t3
                  div        a3, tp, s5
                  xori       s11, s11, 38
                  divu       tp, s11, a5
                  nop
                  sub        s9, a6, s5
                  sra        a4, s7, ra
                  or         s0, s10, s4
                  rem        a7, t1, s9
                  sra        a1, ra, sp
                  mul        s4, zero, a4
                  and        s10, sp, s10
                  mulh       s1, t1, s9
                  sub        t0, ra, s9
                  c.add      s2, s1
                  mulhsu     t6, a5, t6
                  srli       a2, s9, 29
                  csrrw      t1, 0x340, s9
                  csrrc      s4, 0x340, s4
                  c.and      a2, a4
                  lui        ra, 582545
                  srai       s1, s11, 17
                  div        t0, s11, a3
                  srai       a6, t5, 10
                  sltu       ra, ra, s4
                  slti       t2, s8, -321
                  srl        a3, a1, s1
                  andi       s9, s3, 886
                  csrrw      a1, 0x340, s0
                  mulh       a3, s8, a2
                  and        a1, a7, t5
                  andi       tp, t3, -390
                  c.add      s11, s8
                  csrrwi     a6, 0x340, 24
                  mulhu      a5, gp, s5
                  andi       a6, gp, -33
                  c.nop
                  mulhsu     a1, t3, t3
                  srl        s2, a7, s9
                  nop
                  c.lui      t6, 12
                  c.add      tp, s11
                  csrrwi     a6, 0x340, 9
                  csrrwi     s10, 0x340, 5
                  sltu       gp, a0, tp
                  c.li       gp, -1
                  addi       gp, s4, -590
                  c.sub      a0, a3
                  csrrci     s3, 0x340, 9
                  csrrc      t0, 0x340, s11
                  csrrc      s3, 0x340, s3
                  addi       t4, s2, 69
                  rem        s3, s7, s3
                  srli       t6, gp, 22
                  c.li       a7, -1
                  mulh       s9, a7, t3
                  c.nop
                  sltu       s2, sp, s8
                  c.li       a0, 15
                  srai       s6, s8, 20
                  slli       s6, s8, 4
                  remu       s7, s0, s8
                  xor        a4, s10, gp
                  ori        t0, s10, 725
                  sra        s11, s6, s5
                  div        zero, s4, s5
                  sltiu      s1, s11, -413
                  srai       t6, a1, 12
                  slti       a6, s1, 985
                  add        t3, tp, t4
                  csrrci     t1, 0x340, 23
                  or         a0, s9, t2
                  sltiu      a7, sp, -226
                  nop
                  divu       t0, a2, a7
                  csrrsi     s2, 0x340, 19
                  auipc      t3, 339273
                  csrrc      a2, 0x340, s3
                  mulhu      a0, a6, t2
                  csrrci     t2, 0x340, 10
                  c.addi     t5, -1
                  c.nop
                  rem        a6, s7, a3
                  sra        s0, s0, s6
                  csrrwi     s6, 0x340, 0
                  remu       s10, s5, s6
                  add        t4, s4, s5
                  add        s11, s10, gp
                  add        t0, sp, s9
                  sub        s1, t0, s11
                  divu       ra, gp, s0
                  srli       s0, a1, 12
                  c.li       s7, 20
                  sltiu      zero, gp, -895
                  c.and      s0, a0
                  lui        s11, 421033
                  srl        s4, s9, a3
                  c.srai     s0, 17
                  srai       zero, t2, 9
                  csrrs      t2, 0x340, s0
                  slti       s4, t1, -794
                  or         s0, a3, s7
                  c.nop
                  add        s10, s7, s4
                  sll        t1, a3, a5
                  mulhu      s2, t1, t5
                  c.slli     a2, 9
                  csrrw      s2, 0x340, t1
                  sll        a0, s2, a4
                  c.srli     a3, 5
                  slli       a5, s5, 29
                  add        t5, a2, s8
                  csrrc      a7, 0x340, s9
                  andi       s4, s1, 55
                  sltiu      a1, s1, 145
                  mul        s4, a2, s2
                  c.lui      a7, 20
                  csrrwi     tp, 0x340, 26
                  sltu       gp, s8, s11
                  slt        s7, s1, t1
                  srai       s0, a1, 13
                  rem        a3, a5, s9
                  csrrwi     t4, 0x340, 28
                  addi       s0, a2, -561
                  c.and      a0, a2
                  lui        s1, 60981
                  div        ra, s4, t2
                  sub        tp, s8, s9
                  mul        ra, s8, a4
                  sub        s11, t5, s6
                  c.mv       a7, t3
                  div        a2, s7, t2
                  mulh       gp, ra, s9
                  csrrc      ra, 0x340, s11
                  srl        a3, a2, s4
                  csrrc      a1, 0x340, a6
                  auipc      a4, 514831
                  csrrwi     a2, 0x340, 8
                  srl        a0, s9, a4
                  sll        a2, s5, s5
                  srl        t3, s4, a5
                  xor        s9, a5, a4
                  c.mv       s9, a1
                  xori       gp, t6, -676
                  c.srli     s0, 22
                  nop
                  csrrc      s10, 0x340, t6
                  rem        s2, s10, a3
                  mulhu      s6, s7, s9
                  c.andi     a1, -1
                  slt        t5, t4, s5
                  mulhu      ra, t0, a5
                  sltu       a6, gp, t2
                  lui        a3, 658414
                  mul        t2, s11, a0
                  c.slli     s9, 31
                  mulhu      a7, t3, s7
                  csrrs      t5, 0x340, a3
                  csrrc      s7, 0x340, tp
                  c.addi     s9, -1
                  slt        t4, gp, s5
                  srai       tp, t1, 22
                  xori       t3, s0, -757
                  remu       s11, t1, t2
                  c.xor      s1, a1
                  mul        t5, a7, a6
                  divu       t0, t0, tp
                  c.and      s1, a3
                  div        zero, a6, s11
                  c.slli     t4, 17
                  sltiu      s10, zero, -564
                  addi       a5, s9, 664
                  csrrwi     a1, 0x340, 8
                  nop
                  or         s7, zero, s8
                  sra        a2, t0, gp
                  auipc      t2, 463987
                  slti       t5, s6, 727
                  sltiu      s11, t5, 161
                  rem        s10, t4, t5
                  addi       s0, tp, 671
                  and        t0, a7, s7
                  c.lui      s7, 1
                  c.sub      s1, s1
                  slli       a2, t0, 24
                  rem        a0, t3, t4
                  c.sub      a5, a5
                  c.lui      a2, 18
                  sltu       s1, a5, a1
                  srli       a1, a1, 17
                  mul        t2, s1, s5
                  sltu       s11, ra, s6
                  slt        s10, a0, s5
                  remu       a1, s2, t1
                  ori        t6, ra, 147
                  divu       a6, s8, sp
                  remu       a5, s9, t4
                  sub        a3, a3, t1
                  mulh       s0, a2, t1
                  csrrs      t2, 0x340, t0
                  c.sub      s1, a1
                  mulhsu     zero, t5, s4
                  c.slli     s11, 27
                  c.xor      a1, a2
                  sub        s1, sp, s3
                  add        s11, t0, a6
                  addi       t3, s7, 548
                  csrrsi     s10, 0x340, 10
                  c.li       tp, -1
                  c.sub      a1, a2
                  rem        t1, t6, t2
                  mulhsu     t5, a1, a3
                  xor        a0, t5, s5
                  csrrsi     gp, 0x340, 29
                  rem        a2, s8, t4
                  c.nop
                  andi       s9, gp, -421
                  div        t0, a4, t1
                  sltiu      s11, t2, 897
                  xor        s6, a3, t2
                  ori        t1, a6, -478
                  csrrw      s1, 0x340, t4
                  c.sub      a3, a4
                  c.xor      a3, a3
                  c.xor      s0, a5
                  csrrc      a7, 0x340, a5
                  rem        s7, t2, a4
                  csrrsi     a0, 0x340, 31
                  andi       s11, s3, 892
                  lui        a6, 1013375
                  mulh       t5, gp, ra
                  sra        s10, a6, a6
                  mulhu      s0, s0, s3
                  c.andi     s0, 20
                  c.or       s1, a1
                  or         s4, t0, s2
                  c.xor      s1, a2
                  c.mv       s1, t2
                  csrrw      ra, 0x340, a1
                  mulh       s1, s7, a0
                  nop
                  c.or       a4, a2
                  c.srai     a0, 21
                  and        s10, a0, t6
                  srli       s11, a0, 17
                  ori        s11, s9, -592
                  c.andi     a0, -1
                  sub        s11, t5, gp
                  c.add      a4, sp
                  csrrw      a4, 0x340, a3
                  c.srai     a5, 2
                  lui        a6, 987455
                  and        s6, s3, s5
                  or         s1, sp, s8
                  sltiu      t0, tp, -894
                  nop
                  sll        s1, gp, s1
                  c.srli     s0, 12
                  srli       a0, s7, 23
                  slt        s1, s4, s2
                  csrrw      t4, 0x340, s8
                  slt        t4, s2, t5
                  lui        s7, 25906
                  csrrsi     t6, 0x340, 0
                  c.nop
                  sltu       t6, t1, s7
                  slli       a5, ra, 10
                  rem        s1, s0, gp
                  c.srli     a1, 5
                  sltiu      s9, t4, 790
                  csrrsi     s9, 0x340, 5
                  csrrci     t6, 0x340, 31
                  div        s4, s7, s3
                  srli       s9, s2, 7
                  slli       a2, gp, 14
                  ori        t0, gp, -325
                  c.and      a0, a2
                  c.lui      s3, 2
                  csrrsi     a1, 0x340, 6
                  c.add      t6, a4
                  andi       a2, a4, 498
                  c.or       a0, s1
                  csrrs      a6, 0x340, ra
                  csrrw      ra, 0x340, gp
                  csrrwi     s6, 0x340, 18
                  auipc      ra, 112377
                  c.andi     a4, -1
                  c.nop
                  sll        s0, s0, a1
                  srl        ra, a3, t4
                  xori       t3, s0, -670
                  c.srai     a3, 29
                  sltu       a0, s5, s10
                  remu       s9, s0, t4
                  csrrc      s0, 0x340, s8
                  divu       zero, s2, tp
                  srai       t3, a4, 5
                  xor        a7, s11, a7
                  add        a7, a0, a3
                  and        t2, a6, t6
                  c.andi     a4, -1
                  c.or       a4, a2
                  mulhu      t2, s6, s7
                  nop
                  csrrw      s10, 0x340, a2
                  auipc      s11, 869050
                  div        s7, s6, s1
                  c.srli     a1, 24
                  slt        a6, zero, s2
                  sltu       t4, a3, s7
                  csrrs      ra, 0x340, tp
                  c.srai     s1, 20
                  slli       s4, s5, 14
                  mul        t4, s11, t5
                  srl        tp, a2, s5
                  c.nop
                  remu       a3, t5, gp
                  mulhu      a2, s11, s9
                  csrrc      a1, 0x340, s8
                  andi       tp, a1, 908
                  slti       s10, s6, -743
                  csrrs      s7, 0x340, t2
                  mulhu      t2, s9, s9
                  c.srli     s1, 12
                  c.slli     a3, 15
                  c.srai     a0, 22
                  slli       t3, s8, 3
                  srai       s6, s11, 14
                  lui        a2, 1041683
                  c.or       a2, a3
                  c.sub      a5, a3
                  c.and      a5, a3
                  slli       tp, t2, 14
                  lui        tp, 827789
                  and        s6, t5, t5
                  srli       s2, a1, 5
                  csrrwi     a4, 0x340, 23
                  and        t6, a2, gp
                  addi       a4, s2, 592
                  csrrsi     t3, 0x340, 16
                  csrrwi     a6, 0x340, 11
                  auipc      s11, 156343
                  div        t0, s2, s5
                  csrrci     tp, 0x340, 24
                  c.nop
                  c.li       a6, 28
                  csrrw      t3, 0x340, t5
                  andi       t3, sp, -460
                  csrrc      s2, 0x340, t4
                  csrrc      t4, 0x340, s6
                  or         a0, ra, s9
                  csrrwi     s0, 0x340, 1
                  sltu       a1, t2, t4
                  csrrci     s3, 0x340, 22
                  slti       s9, t1, 12
                  sub        s10, a7, t0
                  sltiu      s2, s3, -334
                  mulh       a6, zero, a2
                  c.srli     a5, 31
                  csrrci     ra, 0x340, 21
                  divu       t6, s7, gp
                  remu       t0, t3, t3
                  nop
                  lui        s1, 612134
                  sra        t6, t5, s9
                  c.srli     a2, 16
                  and        s3, s8, s7
                  csrrw      s11, 0x340, a1
                  addi       s4, gp, -558
                  auipc      s7, 13724
                  c.add      s0, a5
                  or         s2, t1, s10
                  mul        a3, s10, s8
                  sltu       s7, a0, a5
                  c.addi     s7, -1
                  srli       a4, t3, 23
                  srai       s7, t5, 19
                  c.andi     a1, -1
                  c.srli     a4, 8
                  csrrc      s2, 0x340, s11
                  csrrci     s6, 0x340, 10
                  c.or       a2, s1
                  csrrc      zero, 0x340, a2
                  c.lui      a3, 2
                  xor        s4, s9, zero
                  c.add      s11, t3
                  sra        a5, s1, s3
                  c.or       a2, s0
                  c.lui      a7, 12
                  csrrs      s1, 0x340, a4
                  div        s0, s5, s10
                  c.lui      t6, 12
                  c.and      a1, a3
                  srai       ra, t6, 11
                  add        s6, t6, gp
                  sltu       s0, s6, a7
                  slli       a3, s2, 3
                  c.srai     s0, 20
                  mulhu      s11, a1, tp
                  rem        s11, a5, s7
                  csrrwi     s0, 0x340, 20
                  srai       s9, s3, 24
                  c.srai     s1, 23
                  csrrsi     a5, 0x340, 18
                  c.or       s1, a1
                  c.and      a4, a2
                  c.add      a3, a7
                  c.srai     a1, 17
                  add        a1, s4, s7
                  srli       s10, t1, 23
                  addi       t4, s7, 329
                  c.li       s9, 15
                  slti       a0, a3, -950
                  csrrci     s0, 0x340, 5
                  c.andi     a3, -1
                  c.and      a1, a3
                  c.nop
                  srli       s7, a4, 19
                  c.add      a0, a0
                  andi       tp, sp, 142
                  c.addi     t5, 21
                  c.and      a2, a3
                  remu       t0, sp, s3
                  c.and      s0, s0
                  c.addi     s2, 30
                  remu       a2, a0, sp
                  sub        s9, s1, zero
                  csrrwi     a7, 0x340, 12
                  c.srai     a2, 26
                  xori       a0, ra, 92
                  sltiu      s3, gp, -19
                  andi       a7, t6, -735
                  csrrci     t0, 0x340, 26
                  c.slli     a7, 2
                  c.xor      a3, a4
                  slt        a5, s7, s11
                  c.srli     s1, 28
                  nop
                  c.add      t5, tp
                  csrrw      s3, 0x340, a7
                  csrrwi     gp, 0x340, 14
                  slti       t3, sp, 904
                  c.srai     a5, 29
                  c.or       a4, a4
                  c.srai     a2, 9
                  c.li       s7, -1
                  xori       s3, ra, 402
                  c.add      a4, s9
                  and        a5, t0, s0
                  lui        t4, 589770
                  csrrwi     s0, 0x340, 9
                  mulh       t0, s5, s1
                  c.nop
                  mulhsu     s6, s9, s0
                  c.nop
                  c.slli     a7, 23
                  ori        s1, zero, 311
                  c.xor      a3, a4
                  csrrs      s6, 0x340, sp
                  mulhsu     s10, s3, t6
                  csrrci     s4, 0x340, 29
                  and        a2, s9, zero
                  csrrw      s0, 0x340, a5
                  c.srai     a5, 23
                  c.srli     a4, 9
                  c.and      a4, s0
                  sltiu      a4, a4, -457
                  ori        t2, s3, -298
                  sll        a2, t0, t2
                  csrrc      a6, 0x340, t5
                  sub        ra, t3, a6
                  csrrwi     s3, 0x340, 13
                  sltu       s11, a4, t0
                  csrrwi     a4, 0x340, 25
                  csrrwi     a2, 0x340, 29
                  c.slli     s9, 22
                  csrrwi     s9, 0x340, 21
                  srai       t3, t6, 27
                  c.xor      s0, a1
                  c.slli     a6, 7
                  csrrw      t0, 0x340, t4
                  andi       a2, a7, -3
                  sll        t2, t6, s6
                  c.slli     t0, 11
                  c.add      t6, t3
                  c.sub      s0, s1
                  add        s6, a2, a5
                  c.sub      a1, s0
                  or         s6, s9, s7
                  slt        zero, s10, a2
                  c.slli     t3, 29
                  mulhsu     a7, a5, a4
                  c.sub      a3, s1
                  sltu       t0, s8, s2
                  slti       a0, s5, 152
                  slti       a3, t3, -540
                  mulhu      s7, t2, t2
                  andi       s0, s7, -39
                  or         t5, s0, a3
                  nop
                  mulhsu     a4, a6, a2
                  sra        a7, t6, t2
                  c.xor      a2, s0
                  sltu       t1, a0, s2
                  sra        s6, ra, s11
                  srai       a0, s7, 24
                  nop
                  c.or       a2, a1
                  c.li       t2, 17
                  srai       s3, t1, 2
                  mulh       gp, s8, s5
                  c.lui      t3, 28
                  slti       t2, a0, 304
                  c.slli     s11, 11
                  sub        t1, a0, t6
                  sltiu      a3, s9, 890
                  csrrs      a6, 0x340, s5
                  xor        s10, s9, t6
                  c.mv       tp, t0
                  rem        t3, s6, t4
                  add        tp, a6, ra
                  sub        a0, s6, gp
                  xor        t4, a2, t0
                  csrrc      t6, 0x340, sp
                  add        t4, a1, a3
                  srl        tp, t1, a4
                  lui        t5, 1024282
                  csrrwi     t5, 0x340, 17
                  addi       gp, a0, -380
                  c.slli     t3, 26
                  sra        t5, a5, a6
                  mulhsu     t5, s11, s2
                  csrrsi     tp, 0x340, 23
                  c.lui      s3, 18
                  nop
                  c.addi     t1, 3
                  mulh       s1, s8, s3
                  nop
                  mulh       s3, t1, s7
                  c.addi     a4, -1
                  mul        t5, a5, s2
                  c.li       t6, -1
                  csrrwi     s11, 0x340, 14
                  csrrsi     gp, 0x340, 5
                  mul        s3, s5, sp
                  c.add      gp, sp
                  csrrw      a7, 0x340, s4
                  auipc      s6, 1042074
                  c.andi     a0, -1
                  sra        gp, s10, t0
                  mulhsu     a1, s3, t4
                  and        gp, s4, t5
                  c.slli     s10, 29
                  c.li       a6, -1
                  c.sub      a5, a5
                  slt        t6, a2, a3
                  csrrc      t1, 0x340, s5
                  xori       t1, s11, 1013
                  csrrci     t1, 0x340, 28
                  c.sub      a2, a2
                  xor        s6, s5, a2
                  sub        s11, t4, a1
                  c.srli     s1, 15
                  remu       t3, s6, t1
                  addi       s6, t1, 578
                  nop
                  srai       t5, tp, 0
                  lui        s9, 636952
                  csrrc      s0, 0x340, s9
                  sltiu      t0, a1, 123
                  c.mv       s4, a6
                  csrrs      t3, 0x340, s6
                  ori        a0, t4, 551
                  csrrci     a7, 0x340, 7
                  divu       t0, gp, tp
                  srli       a1, t5, 31
                  mulhu      s6, s8, a4
                  slt        t1, t3, t5
                  c.xor      a1, a0
                  slti       t2, s5, -37
                  c.li       t4, 17
                  c.mv       a4, s0
                  csrrwi     a2, 0x340, 26
                  addi       t5, a2, 82
                  sll        tp, a4, s1
                  csrrwi     s4, 0x340, 6
                  ori        s10, ra, 741
                  csrrci     a1, 0x340, 5
                  sltu       t5, a4, s3
                  c.srai     a5, 2
                  srli       s7, gp, 24
                  rem        t4, tp, t4
                  srli       a4, s7, 18
                  mulhu      t2, a3, t6
                  rem        s10, s11, s11
                  rem        a6, a0, t4
                  and        s9, t6, s4
                  mulhu      t3, t6, a3
                  srai       s1, a2, 18
                  add        zero, s5, s0
                  csrrci     a3, 0x340, 7
                  c.srli     a3, 20
                  sub        a1, s7, s5
                  ori        a1, s11, -82
                  add        s0, a2, t4
                  c.or       a5, a0
                  mulhu      a3, a3, t0
                  c.slli     a5, 27
                  sll        a3, t4, s10
                  ori        t4, t0, -465
                  add        a2, ra, s10
                  lui        tp, 301095
                  sll        s9, s9, s6
                  c.srli     a4, 23
                  mulhsu     ra, s7, s2
                  c.sub      s0, a4
                  xor        s9, a4, a4
                  c.srai     a3, 12
                  c.sub      a5, s1
                  c.xor      a2, a3
                  c.addi     t2, 29
                  c.srli     a1, 31
                  divu       a1, a4, t3
                  c.srai     a1, 17
                  c.or       a2, a3
                  c.mv       a6, a3
                  c.srli     a5, 20
                  mulh       a3, s2, a7
                  srl        s7, s9, t3
                  xori       a6, s3, 102
                  nop
                  sltiu      t5, t2, -316
                  srai       t1, s7, 29
                  csrrsi     s11, 0x340, 31
                  slt        tp, t0, s8
                  c.mv       a1, a4
                  slti       s4, tp, 838
                  csrrc      gp, 0x340, a4
                  srl        s9, t4, t0
                  csrrs      a3, 0x340, a6
                  c.lui      a2, 12
                  csrrwi     t5, 0x340, 12
                  c.li       t4, 30
                  xori       ra, s0, 824
                  div        t4, s2, a4
                  c.nop
                  c.slli     t5, 9
                  slt        s0, s6, t6
                  csrrwi     a4, 0x340, 9
                  or         tp, tp, a0
                  xori       t3, s9, -913
                  sra        s4, s11, s4
                  ori        s2, t4, 565
                  lui        a2, 408452
                  sltiu      a3, t4, -445
                  lui        a3, 303147
                  ori        tp, sp, 485
                  mulh       s3, zero, a2
                  ori        s10, sp, 847
                  or         t2, s6, s4
                  auipc      a5, 621330
                  xori       s6, a1, 325
                  c.sub      s0, a1
                  xori       ra, s0, -324
                  c.addi     t3, -1
                  sra        t2, t5, tp
                  c.srli     a2, 14
                  or         a2, t3, s7
                  c.lui      s0, 6
                  mulhu      a3, s6, a4
                  c.li       a3, 23
                  xori       s11, sp, -979
                  c.xor      a2, a3
                  slli       t1, s0, 20
                  c.or       s0, s1
                  c.xor      a5, a0
                  mulh       t5, t1, a1
                  c.srli     a3, 7
                  srai       a2, a7, 22
                  c.or       a2, s1
                  c.srai     a4, 20
                  csrrc      s6, 0x340, zero
                  mulh       a2, t0, s5
                  sub        a4, a4, sp
                  csrrsi     ra, 0x340, 20
                  c.mv       a5, s2
                  csrrs      s11, 0x340, s6
                  xori       t1, a3, 39
                  remu       zero, t3, s9
                  csrrwi     s4, 0x340, 22
                  or         s9, ra, t2
                  slti       a3, gp, 559
                  sub        s10, s10, t4
                  div        t4, zero, a2
                  add        s7, a6, t6
                  auipc      s7, 335924
                  c.srai     a4, 1
                  c.addi     t3, -1
                  c.lui      s9, 18
                  andi       a1, ra, 179
                  nop
                  auipc      tp, 713806
                  c.and      a0, a4
                  sra        a3, s11, t1
                  csrrsi     zero, 0x340, 18
                  srl        t5, ra, t1
                  c.and      a3, a3
                  csrrwi     s10, 0x340, 0
                  ori        s10, a7, 54
                  c.add      t3, s8
                  c.add      t4, a2
                  xori       a0, s8, 354
                  rem        tp, zero, a0
                  sltu       a3, a5, s0
                  auipc      a6, 895199
                  xor        a7, gp, s2
                  csrrci     a4, 0x340, 8
                  sltiu      a2, s3, 314
                  c.xor      a2, a3
                  c.li       t2, 31
                  csrrsi     a0, 0x340, 23
                  c.add      s7, a3
                  sra        s11, gp, t0
                  c.mv       s4, s5
                  srai       s10, gp, 11
                  csrrw      s0, 0x340, a2
                  divu       t4, a3, s9
                  c.srai     a2, 24
                  csrrc      t3, 0x340, s11
                  sra        t3, s10, a7
                  c.mv       a7, s0
                  sll        s0, a3, a6
                  c.and      s0, a3
                  nop
                  c.or       a3, s1
                  c.srli     a5, 31
                  csrrs      a2, 0x340, t4
                  slt        s4, a7, s5
                  mul        s1, s5, s1
                  slti       a6, a4, 554
                  csrrwi     s9, 0x340, 11
                  and        s7, a2, s10
                  divu       ra, s9, s7
                  csrrsi     ra, 0x340, 0
                  andi       tp, s4, 193
                  divu       t2, sp, s2
                  c.add      s4, s10
                  c.srai     s1, 23
                  c.andi     a1, -1
                  c.mv       s1, t4
                  c.mv       t5, a2
                  c.srai     a4, 3
                  c.andi     a1, -1
                  rem        ra, a2, t4
                  c.xor      s1, a0
                  nop
                  lui        s4, 467621
                  c.srai     a3, 23
                  c.slli     a6, 15
                  c.sub      a5, a0
                  div        a4, s1, s9
                  csrrci     t2, 0x340, 11
                  slti       s7, t4, -214
                  rem        s7, a6, a3
                  xor        t5, s10, a6
                  csrrw      t6, 0x340, ra
                  c.slli     s10, 24
                  csrrsi     t2, 0x340, 25
                  c.andi     a4, -1
                  xori       a6, t5, -2
                  xor        a3, s7, a7
                  c.srli     a1, 27
                  csrrc      t2, 0x340, s10
                  sra        s7, a5, a4
                  mulhsu     zero, s3, t2
                  c.andi     a2, 28
                  csrrs      s0, 0x340, zero
                  srli       t2, s7, 13
                  c.andi     a0, -1
                  c.add      a7, t3
                  remu       s7, t0, a1
                  ori        t6, t1, -58
                  xori       t3, t5, -952
                  csrrw      a1, 0x340, a4
                  c.addi     t5, 8
                  c.mv       s9, a0
                  c.srli     s1, 18
                  slti       a0, tp, -169
                  slli       s10, s7, 9
                  and        tp, t6, t0
                  c.add      a3, s6
                  csrrs      a4, 0x340, a3
                  c.or       a4, s1
                  mulh       gp, t1, t5
                  rem        zero, sp, a3
                  c.add      gp, a2
                  mulhu      s11, t6, t6
                  srli       gp, zero, 25
                  srai       s4, t1, 11
                  sltiu      tp, zero, 864
                  c.sub      a5, a0
                  sltu       t0, a3, a0
                  auipc      t6, 362255
                  ori        t2, t3, -465
                  addi       s3, a2, -967
                  c.or       a2, a2
                  c.li       a4, 12
                  c.xor      a1, a4
                  sra        s4, zero, s11
                  c.addi     a0, -1
                  c.slli     s9, 14
                  srli       s7, sp, 15
                  andi       t0, s4, 838
                  nop
                  csrrc      s10, 0x340, s8
                  lui        a7, 32278
                  srai       s7, t1, 3
                  csrrs      s2, 0x340, s3
                  c.mv       s6, a0
                  or         a0, s1, sp
                  andi       t3, s1, -975
                  csrrci     a2, 0x340, 14
                  c.srai     a2, 23
                  csrrwi     ra, 0x340, 21
                  c.srai     s1, 11
                  csrrs      a5, 0x340, a1
                  sll        t2, s7, t0
                  srli       s9, s4, 28
                  csrrwi     a0, 0x340, 19
                  csrrs      s1, 0x340, zero
                  c.sub      a4, a3
                  srai       a3, s3, 27
                  xori       a2, t0, -449
                  xori       a3, zero, -568
                  mulhu      a3, s0, a2
                  div        gp, t2, gp
                  csrrw      zero, 0x340, a6
                  divu       s10, t5, a1
                  c.nop
                  sll        s1, s11, s11
                  andi       t5, s10, 396
                  ori        a0, s6, 199
                  csrrwi     t0, 0x340, 6
                  srl        s3, zero, sp
                  csrrw      t3, 0x340, t4
                  xor        s6, s2, t1
                  c.sub      a3, a0
                  c.addi     a1, -1
                  csrrci     gp, 0x340, 5
                  csrrwi     t1, 0x340, 28
                  auipc      s10, 733421
                  c.xor      a1, s1
                  c.nop
                  c.andi     a2, -1
                  and        s7, a2, t5
                  rem        a2, s2, ra
                  sltiu      s11, t1, -764
                  csrrw      t3, 0x340, t0
                  addi       a4, a6, -415
                  sltiu      s11, t4, -994
                  xor        s3, t5, a3
                  lui        zero, 931031
                  and        tp, s7, s5
                  sub        s4, t0, s10
                  add        s4, a6, s2
                  nop
                  csrrs      t5, 0x340, t5
                  csrrsi     s6, 0x340, 30
                  csrrw      a2, 0x340, s11
                  c.add      a7, s9
                  nop
                  csrrsi     s6, 0x340, 5
                  srai       s6, a6, 2
                  c.and      a0, a3
                  csrrc      s1, 0x340, s7
                  nop
                  srl        s2, t3, sp
                  c.srli     s1, 26
                  c.slli     a7, 29
                  slti       s2, a3, 852
                  csrrs      a4, 0x340, t2
                  xori       a6, s7, 665
                  mulhu      t0, s11, s0
                  and        gp, tp, s0
                  ori        tp, a6, 297
                  c.slli     s3, 14
                  csrrw      s3, 0x340, a0
                  lui        t2, 62415
                  srai       gp, s1, 19
                  add        zero, a5, t3
                  addi       gp, t5, 521
                  xori       s11, a1, 984
                  slt        tp, gp, gp
                  sltiu      tp, s7, -329
                  srai       a6, s0, 12
                  srli       t4, s2, 8
                  c.and      a0, a0
                  lui        a7, 187598
                  csrrsi     s11, 0x340, 26
                  xori       t2, t0, 412
                  auipc      a1, 445670
                  csrrci     a7, 0x340, 19
                  c.xor      a0, a5
                  sll        s10, s7, a6
                  ori        s4, s10, 809
                  c.mv       gp, a1
                  sll        s10, t4, t6
                  and        ra, s11, a0
                  c.add      a4, s2
                  csrrc      ra, 0x340, sp
                  c.andi     a0, -1
                  mulh       a6, a6, zero
                  xori       t0, s6, 326
                  c.add      a7, t4
                  andi       s0, t4, 122
                  add        tp, ra, ra
                  ori        a0, t3, -496
                  or         a3, t3, t1
                  c.li       a6, 16
                  csrrwi     s3, 0x340, 16
                  c.and      a4, a0
                  csrrci     a3, 0x340, 19
                  sll        s10, a3, zero
                  addi       zero, t2, -823
                  srli       s1, t1, 10
                  remu       a4, a6, s4
                  srai       s9, a0, 2
                  lui        s4, 804236
                  csrrwi     t4, 0x340, 5
                  andi       t6, t0, -509
                  c.srai     a4, 13
                  xor        zero, t6, s5
                  csrrw      a3, 0x340, zero
                  divu       a5, a5, a4
                  c.add      t0, a6
                  c.xor      a0, s1
                  c.and      a0, a5
                  sll        a1, s8, s2
                  c.mv       s9, s7
                  slt        s3, t5, s1
                  ori        a6, t6, -285
                  c.li       s11, -1
                  c.mv       t0, gp
                  sub        s1, s0, s1
                  sltu       s7, s4, s4
                  sltiu      a3, s3, 853
                  c.lui      a5, 3
                  and        t0, s4, a1
                  c.nop
                  ori        s11, a0, -266
                  mulhsu     s0, a3, zero
                  c.and      a3, a1
                  csrrc      tp, 0x340, a6
                  xori       s11, s2, 434
                  remu       a7, a1, t3
                  c.add      t0, s8
                  c.mv       s9, s6
                  mulh       s2, s2, s2
                  csrrw      a6, 0x340, s10
                  or         s6, a4, tp
                  div        s0, s5, s7
                  c.srai     a5, 17
                  auipc      s2, 802462
                  csrrw      a6, 0x340, s9
                  csrrs      a7, 0x340, s9
                  addi       s11, a7, -745
                  c.mv       s1, t5
                  mulh       a3, s7, a3
                  c.srli     a2, 13
                  xori       gp, gp, 869
                  c.xor      a3, a5
                  slti       s3, s6, -495
                  addi       t1, s10, 603
                  sub        ra, gp, t4
                  lui        a2, 617015
                  addi       t3, a4, 169
                  sub        s11, s3, t4
                  div        zero, t6, t4
                  c.lui      s3, 30
                  csrrs      s7, 0x340, gp
                  andi       s4, s6, 355
                  and        t4, a2, s5
                  rem        a5, t2, s5
                  srai       s2, s2, 23
                  div        s1, t2, s4
                  add        s4, s5, s10
                  xori       a0, t3, 392
                  c.xor      a5, a5
                  lui        t6, 1010594
                  sll        tp, ra, s2
                  c.and      a1, s1
                  divu       t6, t2, s9
                  sra        s6, tp, a2
                  c.addi     t2, -1
                  c.li       s2, -1
                  csrrs      s0, 0x340, t5
                  slti       ra, s0, -690
                  c.nop
                  csrrci     a3, 0x340, 8
                  srli       t1, s10, 22
                  c.slli     t2, 1
                  csrrc      s2, 0x340, a1
                  c.nop
                  csrrs      s10, 0x340, a7
                  c.srai     s1, 13
                  sltu       s10, a1, a3
                  mul        s0, t3, a0
                  slt        a4, a4, a4
                  rem        s4, ra, t4
                  remu       s7, s0, a3
                  slti       ra, s6, -819
                  csrrw      t6, 0x340, a5
                  srli       t0, s7, 1
                  divu       a3, t3, gp
                  c.nop
                  ori        s9, a6, 514
                  sra        s6, s4, t3
                  c.xor      a0, a0
                  c.nop
                  csrrc      s2, 0x340, sp
                  remu       a2, sp, s2
                  rem        a2, t4, s1
                  slt        t6, a5, s0
                  srli       tp, s1, 12
                  c.add      t4, s3
                  mulh       a0, tp, t0
                  and        t6, t3, t0
                  or         a0, s5, t2
                  csrrwi     t5, 0x340, 27
                  and        s1, s8, zero
                  sub        s7, t4, s0
                  c.nop
                  c.addi     a7, -1
                  ori        a1, gp, 665
                  slti       s3, a5, -419
                  mulh       ra, s8, s3
                  c.srai     a5, 21
                  c.or       a4, a3
                  slti       s1, a3, -319
                  and        s3, t4, a0
                  ori        tp, s6, 783
                  rem        a4, s3, gp
                  csrrs      gp, 0x340, s8
                  sltu       s11, t5, t6
                  slt        s10, a4, t5
                  addi       s9, t2, -860
                  srai       s10, s2, 22
                  add        a5, a6, s3
                  c.add      a3, a6
                  c.srli     a2, 30
                  c.srai     a1, 19
                  auipc      s10, 333433
                  rem        t5, tp, a7
                  c.and      a1, a4
                  csrrwi     s3, 0x340, 19
                  c.and      a5, a5
                  mulhu      s11, s11, gp
                  c.slli     s3, 24
                  slt        s0, a0, a7
                  srai       t3, s0, 10
                  csrrci     a1, 0x340, 18
                  ori        t5, gp, -379
                  c.or       a5, a3
                  or         a2, a7, t6
                  c.srai     a5, 9
                  sltu       zero, s8, s5
                  div        tp, t6, s6
                  slti       t1, s8, 62
                  sltu       a0, s5, s5
                  c.li       t2, 28
                  srai       t0, s6, 23
                  nop
                  sltiu      s1, s4, -227
                  rem        a7, s9, t5
                  sltu       s6, s8, a1
                  sltiu      gp, t1, 199
                  sub        s9, s10, a4
                  divu       s7, a2, t4
                  c.mv       s4, a5
                  srai       zero, a2, 21
                  rem        a3, tp, t6
                  csrrc      gp, 0x340, a7
                  c.sub      a3, a4
                  c.addi     t2, -1
                  ori        a6, a4, -425
                  or         s4, s10, a6
                  auipc      a4, 317743
                  sub        a3, a5, s6
                  c.xor      a2, a0
                  c.nop
                  sra        t6, s0, s6
                  add        gp, s11, t0
                  slli       zero, s8, 20
                  or         t4, a1, s0
                  csrrw      tp, 0x340, s4
                  c.nop
                  csrrw      gp, 0x340, gp
                  sub        t1, t4, t2
                  andi       s10, a3, -95
                  c.addi     a5, -1
                  mulh       a3, a7, t4
                  c.mv       s1, s0
                  srl        s1, a6, t5
                  srl        gp, s4, s10
                  c.and      a0, a4
                  c.and      a4, a0
                  divu       t5, t6, s4
                  csrrsi     a4, 0x340, 31
                  slt        s4, a2, s1
                  csrrci     t3, 0x340, 20
                  mulhu      a0, s8, zero
                  xori       a2, tp, -331
                  c.or       s0, a4
                  c.mv       s11, s3
                  csrrsi     zero, 0x340, 23
                  addi       s1, a6, 101
                  c.nop
                  and        t1, tp, s1
                  ori        a4, s3, -739
                  c.li       s7, 12
                  srli       t3, t0, 13
                  c.addi     t0, -1
                  rem        zero, a2, s11
                  c.andi     s1, -1
                  mulhu      t5, a3, t4
                  mulhsu     a6, s6, s3
                  add        tp, t2, a3
                  srli       zero, s8, 19
                  mulhsu     a0, tp, zero
                  xor        t2, s0, a7
                  ori        ra, a0, -781
                  lui        a1, 258521
                  c.add      t4, gp
                  c.srli     a5, 2
                  divu       t2, gp, a4
                  slli       a0, t1, 5
                  auipc      t0, 956850
                  c.andi     s1, 2
                  csrrs      a3, 0x340, t2
                  mulhsu     a3, s6, tp
                  c.add      s3, t3
                  c.add      ra, s11
                  csrrsi     t6, 0x340, 18
                  remu       s4, s2, t1
                  srai       a7, gp, 28
                  csrrw      s4, 0x340, s7
                  xor        s1, s7, s3
                  mul        ra, a1, t4
                  csrrwi     t4, 0x340, 9
                  c.add      a6, s7
                  addi       t2, s9, 423
                  xori       s2, t6, 490
                  or         a7, a4, a5
                  c.srli     a2, 5
                  c.or       a5, a4
                  srl        t2, gp, a6
                  rem        t3, s3, a3
                  csrrci     a0, 0x340, 2
                  sub        s1, a1, s8
                  mul        t6, a6, t6
                  csrrwi     gp, 0x340, 26
                  sub        a7, s5, a2
                  slti       t3, a7, -255
                  csrrw      s9, 0x340, gp
                  c.and      a0, a5
                  c.add      a2, t6
                  sll        a5, t2, t3
                  sra        s9, s4, t2
                  c.srai     a0, 8
                  slti       s11, s3, -164
                  csrrs      s2, 0x340, s1
                  slti       t2, a2, -575
                  or         a4, t1, tp
                  divu       a2, t3, a3
                  div        a5, t1, zero
                  c.or       s1, s1
                  and        s9, s4, t4
                  c.addi     t2, 25
                  mulh       t5, t6, s9
                  c.add      s7, s6
                  c.or       a3, a1
                  c.srli     a0, 22
                  csrrci     a4, 0x340, 0
                  srai       t1, s6, 19
                  andi       tp, s4, -176
                  ori        t2, a6, 810
                  remu       ra, ra, a5
                  slli       gp, sp, 1
                  xor        t4, a1, a2
                  csrrci     t5, 0x340, 6
                  csrrs      t2, 0x340, a5
                  c.xor      s1, s0
                  c.nop
                  auipc      s4, 445786
                  auipc      a5, 41565
                  c.srai     a5, 1
                  csrrw      s0, 0x340, ra
                  nop
                  c.xor      a3, a5
                  c.srai     a1, 12
                  c.andi     a3, -1
                  c.mv       tp, s7
                  rem        a6, s4, t4
                  c.addi     t0, -1
                  csrrw      a2, 0x340, a0
                  c.or       a0, s0
                  c.nop
                  csrrc      s2, 0x340, s0
                  slli       s2, t3, 4
                  c.lui      s1, 6
                  divu       a4, s11, s3
                  lui        s11, 627331
                  c.sub      a2, s1
                  csrrsi     s7, 0x340, 29
                  slti       t0, s10, -192
                  and        t5, a4, s8
                  c.lui      t3, 18
                  c.li       s4, -1
                  and        t1, t4, a0
                  sra        gp, a1, t5
                  c.srai     a0, 24
                  and        s2, a2, a2
                  c.and      s1, a4
                  csrrs      s2, 0x340, s4
                  csrrci     ra, 0x340, 15
                  sra        ra, s1, gp
                  and        a4, s4, s11
                  c.slli     a1, 31
                  c.andi     a4, 15
                  and        t2, t5, s9
                  nop
                  xor        s1, a5, a1
                  c.slli     t5, 14
                  mulh       a3, s11, s9
                  c.add      t0, s3
                  addi       a1, a3, 592
                  xori       s2, t6, -949
                  sra        t5, a1, t5
                  sub        s1, a6, ra
                  andi       s3, t3, 511
                  c.srai     a2, 20
                  sltiu      a4, t3, 586
                  csrrsi     t6, 0x340, 19
                  srai       zero, s6, 22
                  or         t1, a2, ra
                  c.lui      s3, 7
                  c.and      a4, a2
                  csrrsi     t2, 0x340, 30
                  c.nop
                  or         t0, t4, s11
                  xor        a6, a7, a3
                  c.xor      a1, a5
                  c.or       a3, a1
                  c.srli     a1, 8
                  sltu       zero, t4, a0
                  lui        s1, 792572
                  c.add      s6, t6
                  sub        a5, s0, s9
                  csrrs      a0, 0x340, ra
                  c.slli     t0, 15
                  c.srli     s1, 16
                  c.mv       gp, tp
                  srli       t6, t1, 28
                  c.andi     a0, 3
                  slt        s11, s5, t0
                  csrrc      zero, 0x340, s11
                  csrrsi     s4, 0x340, 28
                  csrrw      s11, 0x340, t6
                  mulhsu     t5, tp, a0
                  or         t5, s4, s1
                  c.lui      s9, 15
                  divu       s2, a0, s10
                  sll        tp, a6, s6
                  xori       t3, t0, 377
                  mulhsu     s11, s0, s3
                  sltu       a3, s11, s1
                  c.srli     s0, 25
                  c.slli     a0, 9
                  c.srli     a4, 14
                  csrrci     s6, 0x340, 16
                  c.lui      a0, 23
                  slti       s3, a2, -655
                  csrrs      s1, 0x340, s3
                  and        s4, gp, s5
                  csrrsi     s2, 0x340, 16
                  csrrw      s2, 0x340, gp
                  csrrsi     s11, 0x340, 3
                  xori       s2, a1, 221
                  c.add      a0, sp
                  slti       s4, zero, -896
                  mulh       t4, s0, s4
                  lui        t3, 400562
                  srl        a2, t1, zero
                  c.addi     t2, 28
                  slli       t5, t5, 5
                  srl        s6, s10, a5
                  c.andi     a4, -1
                  nop
                  andi       s1, t2, 501
                  c.srai     a2, 8
                  rem        s1, s2, s4
                  c.add      a0, t6
                  c.li       a4, -1
                  c.li       s2, 20
                  c.srai     a5, 15
                  xor        t3, a0, zero
                  c.slli     s2, 24
                  sltu       s9, t4, zero
                  c.lui      a6, 3
                  srl        s0, t5, t5
                  c.xor      a1, a1
                  csrrw      zero, 0x340, t5
                  ori        a1, ra, 54
                  sll        t6, a5, zero
                  c.andi     s0, 28
                  slt        a0, a0, zero
                  c.li       a0, 7
                  div        a4, t5, s1
                  c.xor      a3, a3
                  mulh       t3, gp, a2
                  csrrci     t2, 0x340, 27
                  c.addi     a6, 27
                  srl        s10, zero, s1
                  slti       t0, a7, 530
                  c.li       a2, -1
                  add        s2, a4, a3
                  sra        s10, s9, tp
                  c.sub      a1, a3
                  c.andi     a2, 1
                  c.or       a4, s1
                  sub        gp, s0, tp
                  srai       s2, t2, 14
                  srl        t4, t3, t6
                  c.srli     s1, 13
                  rem        t4, a4, t1
                  csrrw      ra, 0x340, ra
                  slli       s3, s1, 18
                  add        t3, s11, t0
                  slli       s1, s4, 27
                  add        s2, s3, tp
                  xor        t3, s5, t5
                  sltu       s11, sp, s9
                  add        s6, s0, t2
                  sll        t6, t5, sp
                  srl        ra, s10, s0
                  addi       zero, t4, 161
                  ori        s10, t2, -144
                  csrrwi     a7, 0x340, 28
                  c.li       s3, 26
                  xori       a3, s0, 56
                  srai       s2, t0, 4
                  c.srai     a1, 12
                  c.nop
                  div        t4, s2, s0
                  srl        a5, s10, a3
                  csrrci     s4, 0x340, 0
                  c.li       a2, 18
                  div        a0, a4, tp
                  c.srli     a2, 25
                  c.lui      a5, 22
                  c.add      a1, a2
                  mulhu      s11, sp, sp
                  auipc      a3, 419787
                  div        t1, a4, s11
                  c.xor      a3, a3
                  and        a7, t6, s6
                  c.sub      a1, a0
                  c.andi     a4, 4
                  and        t1, s8, t5
                  slli       s3, t4, 16
                  c.and      s0, s0
                  auipc      t2, 853420
                  c.addi     gp, 14
                  c.srai     s1, 30
                  csrrw      s2, 0x340, s5
                  csrrw      t4, 0x340, s11
                  slli       t4, t0, 8
                  c.srai     a5, 1
                  c.slli     t5, 13
                  mulhsu     s11, ra, a6
                  c.srai     a2, 10
                  sltiu      t4, s8, -719
                  addi       s3, t1, 190
                  csrrc      t2, 0x340, t0
                  mul        t2, s8, a0
                  c.andi     a0, 19
                  mul        s0, a3, gp
                  c.sub      s1, a0
                  sltu       a2, s8, sp
                  c.lui      tp, 4
                  andi       a5, t6, -646
                  slt        s6, s6, tp
                  c.xor      a0, a3
                  c.and      a1, s0
                  slt        a6, a0, t2
                  c.or       a4, a0
                  c.add      t1, t5
                  c.lui      a3, 22
                  c.nop
                  csrrc      t6, 0x340, s7
                  add        t5, s10, s9
                  c.and      a0, a2
                  mulh       t4, tp, a4
                  slt        tp, t1, t6
                  c.addi     t2, -1
                  mul        s9, t3, s4
                  c.addi     a5, -1
                  c.xor      a5, a4
                  c.andi     a0, 16
                  slt        t0, a3, s11
                  divu       zero, a2, a2
                  mulhsu     t6, t4, a6
                  slti       tp, t0, 805
                  mulhu      s0, a2, t4
                  csrrsi     tp, 0x340, 18
                  sltiu      s7, t6, 839
                  mulhsu     s11, zero, t2
                  c.andi     a5, -1
                  csrrsi     a1, 0x340, 22
                  csrrwi     a1, 0x340, 23
                  c.addi     t0, 14
                  slli       a5, s4, 15
                  mulhu      tp, s11, t0
                  csrrc      s4, 0x340, t3
                  addi       a1, a4, 960
                  csrrw      t0, 0x340, a7
                  c.srli     a2, 14
                  c.add      a5, t2
                  divu       a2, s3, s1
                  c.mv       s0, a4
                  csrrci     t2, 0x340, 1
                  lui        zero, 764347
                  c.or       a4, a4
                  c.or       a0, a4
                  csrrwi     t1, 0x340, 9
                  mulhsu     s1, s5, a6
                  sltu       s1, t4, s2
                  c.xor      a3, a1
                  c.or       a4, a1
                  or         t6, a4, t1
                  c.srli     s0, 8
                  xori       zero, t2, -184
                  mulhu      s7, a1, s4
                  csrrwi     s10, 0x340, 26
                  srli       a3, a4, 19
                  nop
                  c.nop
                  c.sub      a5, a5
                  auipc      a3, 327078
                  mulh       a0, a1, s7
                  sra        s1, t6, a3
                  slti       t2, t2, -410
                  c.li       t0, 4
                  sltiu      a7, a6, 560
                  c.srai     a4, 29
                  mulh       a5, s4, zero
                  slti       s1, sp, 254
                  csrrsi     ra, 0x340, 9
                  srai       a6, sp, 4
                  mulhsu     zero, a1, a2
                  c.nop
                  sra        a3, s7, ra
                  slti       t4, s3, 481
                  sltiu      t3, s9, -192
                  c.addi     s7, 24
                  andi       s10, t3, 759
                  mulhu      t6, a0, t6
                  ori        a5, s3, 982
                  c.li       s3, -1
                  nop
                  c.srli     s1, 18
                  sub        s9, zero, a4
                  c.or       a2, s1
                  csrrw      a4, 0x340, t4
                  c.srai     a0, 27
                  sltu       s7, s6, s1
                  c.nop
                  c.lui      s1, 2
                  c.or       s0, a0
                  sub        a0, s1, ra
                  andi       a2, a1, -77
                  mulhu      t1, s2, t6
                  c.srai     a5, 30
                  c.srli     a4, 1
                  xor        s4, s1, a4
                  mul        a6, t2, s1
                  c.andi     a5, 5
                  mulh       gp, a5, t2
                  c.add      a6, a2
                  ori        ra, s7, -908
                  c.sub      a2, a1
                  c.srai     a3, 3
                  addi       s9, a2, 53
                  xor        s3, a1, a3
                  sra        s3, t2, t5
                  slti       s4, a0, 333
                  c.add      a7, ra
                  srl        t6, zero, t4
                  c.add      ra, t4
                  c.srai     a3, 11
                  c.lui      s11, 24
                  csrrsi     t2, 0x340, 13
                  c.slli     s11, 2
                  or         s9, s9, s6
                  sltu       s9, t2, s5
                  addi       a0, s10, -565
                  sltu       gp, t4, t4
                  lui        s7, 871166
                  nop
                  srl        t4, s1, a0
                  c.li       tp, 8
                  c.srai     a3, 19
                  c.addi     t0, -1
                  rem        s1, t5, s0
                  c.add      t4, t2
                  andi       s2, a3, 538
                  c.srli     a0, 25
                  slt        t5, s11, s9
                  mulhsu     a6, tp, s2
                  csrrc      tp, 0x340, s9
                  slli       s9, t3, 24
                  c.andi     a4, 12
                  c.and      a5, a3
                  csrrw      a2, 0x340, s10
                  c.slli     a3, 20
                  c.andi     a5, -1
                  sltu       t2, s10, a5
                  div        a1, a7, a4
                  or         s2, tp, s8
                  sll        s9, t6, s3
                  sub        s11, a1, s4
                  xori       a3, a5, 667
                  sra        s10, a7, s10
                  auipc      t0, 21301
                  mulhu      s6, tp, a0
                  c.or       a3, a5
                  mul        a5, s6, sp
                  srai       t4, tp, 8
                  csrrci     t4, 0x340, 1
                  c.or       a1, a3
                  mul        s1, s7, a0
                  csrrc      a2, 0x340, a3
                  c.sub      a1, a0
                  lui        s0, 1035150
                  sra        s7, s7, a3
                  lui        a7, 1042722
                  divu       a4, s0, a7
                  rem        t4, s8, s5
                  c.srai     a5, 1
                  mul        a1, tp, s6
                  sub        a3, t2, s3
                  sltu       s11, t2, s9
                  add        t5, s4, sp
                  slli       t6, ra, 4
                  c.or       a4, a2
                  lui        zero, 806415
                  sltu       s0, s10, s9
                  mulhsu     ra, sp, s4
                  lui        t0, 894219
                  c.nop
                  div        gp, s7, s11
                  lui        t5, 861959
                  c.andi     a1, 30
                  mulhsu     t1, sp, t2
                  c.andi     a2, -1
                  mulhsu     s3, s11, t1
                  mul        s1, t6, s9
                  lui        t1, 339695
                  and        t3, a6, s7
                  c.or       a2, a5
                  xori       s2, s7, -362
                  or         gp, a2, a3
                  sll        tp, zero, t0
                  sltu       a4, s6, a1
                  c.lui      s3, 7
                  sra        t5, s6, s1
                  csrrci     tp, 0x340, 22
                  c.andi     a4, 0
                  slti       s1, s5, 328
                  sub        s11, sp, ra
                  and        a1, s10, t1
                  sltiu      s6, t6, -281
                  c.slli     a1, 1
                  lui        a2, 135450
                  xor        s6, a1, a0
                  csrrwi     a5, 0x340, 3
                  ori        s3, tp, 219
                  c.li       gp, 4
                  csrrw      a7, 0x340, a6
                  c.and      a1, s0
                  nop
                  divu       t6, gp, s2
                  csrrwi     t4, 0x340, 6
                  lui        s11, 562647
                  c.lui      s1, 5
                  c.nop
                  c.xor      a5, a2
                  add        a1, a6, a1
                  sltiu      s2, sp, 1009
                  slt        gp, a6, ra
                  c.mv       t6, a7
                  c.andi     s1, -1
                  c.sub      a0, s1
                  csrrw      t0, 0x340, t5
                  c.sub      s1, a3
                  c.li       t6, -1
                  or         zero, s9, a2
                  mulhu      a0, ra, t3
                  c.and      a2, a2
                  sll        s1, t1, t0
                  csrrci     t3, 0x340, 24
                  srli       s10, s1, 2
                  c.or       a1, s0
                  slli       s2, s10, 19
                  mul        a6, t5, t4
                  c.or       s1, a5
                  srl        t2, t2, s11
                  addi       t5, a5, -435
                  div        a0, zero, t4
                  sltiu      t3, ra, 188
                  slli       s9, a7, 1
                  csrrs      t0, 0x340, gp
                  c.nop
                  sub        zero, t6, tp
                  c.and      s0, s0
                  divu       s9, a6, s9
                  remu       a2, t6, s9
                  csrrw      s7, 0x340, t0
                  csrrc      a5, 0x340, tp
                  slti       t0, s3, -645
                  c.add      s10, a1
                  csrrc      s9, 0x340, t0
                  ori        zero, a0, -992
                  addi       a4, s8, -197
                  c.or       a2, s1
                  sra        tp, s10, a1
                  addi       a5, s4, 343
                  slt        s11, sp, s2
                  c.li       t6, 24
                  c.srai     a0, 12
                  ori        s6, a2, -228
                  srl        a7, s10, t2
                  sltiu      s1, s11, -778
                  nop
                  c.slli     a5, 14
                  c.lui      a0, 23
                  and        s9, t3, t4
                  or         s7, t5, a3
                  nop
                  c.srai     a5, 22
                  ori        t0, a6, -758
                  mulhu      t2, t4, s0
                  c.lui      a6, 20
                  mul        t3, a1, a3
                  mulhu      s6, a4, s7
                  xor        a3, a7, t1
                  add        t0, t0, s10
                  mulhsu     s1, t2, t6
                  c.xor      s0, a1
                  srli       ra, a0, 11
                  c.add      t6, a1
                  slli       a1, a6, 10
                  andi       a0, sp, 774
                  mulh       s4, t2, ra
                  csrrsi     t4, 0x340, 27
                  rem        gp, a4, gp
                  xori       a6, a4, 489
                  c.sub      a0, a3
                  c.addi     tp, -1
                  auipc      t3, 942890
                  c.andi     a5, -1
                  c.xor      a4, a1
                  srai       s3, a2, 17
                  ori        tp, s0, 1012
                  c.xor      a1, a0
                  csrrci     a4, 0x340, 12
                  mul        s11, s11, a4
                  div        t5, zero, t5
                  csrrs      a5, 0x340, s4
                  csrrs      t1, 0x340, t6
                  sltiu      t1, t1, -30
                  c.andi     s0, -1
                  mulhsu     s11, tp, s2
                  mul        s1, s0, ra
                  c.slli     tp, 24
                  sll        a2, a4, a4
                  nop
                  or         a3, s7, a5
                  sltiu      tp, s9, -141
                  csrrsi     t1, 0x340, 14
                  mul        zero, s5, tp
                  sll        zero, a2, s7
                  c.srai     a5, 19
                  c.mv       a3, t3
                  c.slli     a3, 10
                  mulh       s0, a4, s7
                  remu       t1, gp, t4
                  sltiu      a3, a1, -409
                  csrrci     a7, 0x340, 8
                  rem        a0, s5, tp
                  addi       a0, s8, -380
                  sltu       t1, ra, s8
                  c.addi     t3, -1
                  c.sub      a2, a1
                  c.or       s0, a0
                  c.xor      s1, s1
                  c.addi     a2, 21
                  mulh       s11, s5, s0
                  slt        t2, s10, s2
                  csrrsi     s0, 0x340, 30
                  c.li       t1, -1
                  sra        t5, gp, zero
                  mulhsu     s7, t4, a1
                  xori       a2, tp, 88
                  mulhsu     a5, t2, s5
                  xori       s4, s10, 349
                  divu       t5, a0, s0
                  csrrc      ra, 0x340, a3
                  csrrw      a7, 0x340, a1
                  c.mv       s7, a0
                  c.andi     a3, -1
                  c.srai     s1, 19
                  mul        a7, s10, s8
                  sub        s2, a4, a5
                  div        s1, a6, ra
                  c.nop
                  xor        s7, s6, a6
                  csrrs      a1, 0x340, t2
                  nop
                  c.and      a4, a0
                  c.slli     s2, 5
                  add        s10, t6, t3
                  add        a3, s1, s10
                  srli       a5, t1, 12
                  c.xor      a0, a1
                  remu       gp, t1, s1
                  or         t6, a7, s7
                  c.xor      a3, a5
                  c.srai     s1, 29
                  csrrsi     t4, 0x340, 3
                  c.andi     a2, -1
                  c.addi     a7, -1
                  c.li       s7, -1
                  c.xor      a0, s0
                  rem        t2, s10, a0
                  andi       a2, a6, -840
                  c.add      s3, a7
                  xor        a0, s11, s2
                  sltu       a3, a5, sp
                  slt        a6, ra, a4
                  rem        s11, t4, s11
                  ori        a3, s4, -634
                  c.lui      s1, 26
                  add        s11, s5, zero
                  ori        t6, s10, -419
                  ori        ra, a3, -922
                  srli       t1, a6, 18
                  slt        t0, gp, s10
                  c.mv       a2, s7
                  sll        a6, a6, t6
                  c.and      a2, a0
                  c.nop
                  c.srai     a1, 13
                  and        s10, t6, s8
                  c.slli     a0, 5
                  srli       t6, s0, 21
                  sub        s6, a4, s8
                  csrrc      zero, 0x340, s6
                  csrrc      a6, 0x340, a7
                  andi       t0, a0, -342
                  c.sub      a4, a5
                  sra        tp, s3, s7
                  c.lui      a7, 3
                  c.slli     t1, 3
                  rem        a7, a2, t0
                  ori        s4, s3, -1008
                  sra        zero, t4, a7
                  slt        a2, t2, a1
                  srai       t5, a7, 2
                  csrrs      s7, 0x340, s5
                  slli       s9, t2, 8
                  sltu       s10, s0, s0
                  add        s9, t2, a7
                  csrrc      zero, 0x340, a6
                  auipc      a6, 330329
                  mulhsu     s1, s5, a3
                  c.xor      a4, a4
                  csrrc      a1, 0x340, s7
                  c.sub      a1, s0
                  ori        s6, a6, -389
                  csrrc      s9, 0x340, s1
                  c.addi     s9, 15
                  sra        a1, a5, a6
                  srl        t5, t2, t2
                  mulhu      t1, s9, a7
                  csrrc      zero, 0x340, gp
                  mulh       s9, ra, gp
                  csrrsi     s6, 0x340, 5
                  csrrc      s7, 0x340, ra
                  andi       gp, s11, 731
                  slli       ra, a3, 8
                  c.or       s0, a3
                  xor        t3, a2, gp
                  xori       t6, a7, -282
                  c.srli     a2, 9
                  and        s1, sp, s10
                  srl        tp, a1, s10
                  sub        a1, s5, s1
                  c.and      s0, a5
                  add        gp, a4, s9
                  c.lui      a7, 6
                  csrrc      t6, 0x340, s2
                  c.slli     a1, 18
                  add        t4, a0, s5
                  csrrci     a7, 0x340, 6
                  c.li       t2, 8
                  csrrc      a0, 0x340, t4
                  rem        t5, a3, s1
                  and        s9, s4, t6
                  c.or       a0, a5
                  c.or       a2, a0
                  csrrwi     a3, 0x340, 3
                  sll        t2, tp, s5
                  c.andi     a2, -1
                  rem        a4, s1, a1
                  add        a1, s6, tp
                  divu       tp, s3, a3
                  csrrs      a6, 0x340, tp
                  c.lui      s2, 9
                  and        t3, tp, s4
                  lui        s10, 10821
                  c.nop
                  remu       s3, s10, s1
                  slt        s0, t2, t6
                  c.andi     a1, -1
                  xori       s4, s3, -810
                  sltiu      s2, t0, -589
                  and        t6, a4, s10
                  add        t5, t0, s2
                  nop
                  addi       s4, ra, 171
                  addi       s0, tp, 792
                  slt        s0, s8, a6
                  nop
                  csrrci     s11, 0x340, 4
                  c.add      t2, a6
                  andi       s3, sp, 401
                  c.and      s1, s0
                  c.andi     a3, -1
                  lui        s7, 412666
                  slti       s0, s4, 444
                  csrrs      a4, 0x340, a4
                  ori        t3, a2, -145
                  andi       s9, s7, 644
                  sub        t5, a1, a2
                  xor        s2, s0, a4
                  mulhsu     s11, t5, a6
                  div        s7, a7, t3
                  c.and      a1, a0
                  srl        t2, a0, s3
                  csrrci     t4, 0x340, 25
                  c.srai     a3, 31
                  sltiu      a2, s5, 624
                  csrrs      a1, 0x340, s9
                  c.andi     a3, -1
                  srl        t3, s0, a2
                  c.addi     a1, -1
                  csrrci     t2, 0x340, 5
                  nop
                  c.add      s10, a7
                  xor        t0, a4, s3
                  csrrwi     s10, 0x340, 9
                  remu       t3, a2, s10
                  c.li       s0, -1
                  lui        t5, 1025931
                  sll        a4, tp, s8
                  c.lui      a4, 10
                  sltu       t1, a6, t0
                  csrrw      a4, 0x340, t4
                  c.add      s0, t0
                  c.addi     s9, -1
                  c.srli     a0, 27
                  csrrc      t4, 0x340, zero
                  c.mv       tp, s10
                  add        s4, s0, s7
                  xor        a5, s0, a5
                  csrrs      t2, 0x340, a2
                  div        a1, a3, s10
                  sltiu      a2, a6, -355
                  srl        s9, s5, s9
                  xori       a3, t2, -1008
                  ori        a3, a0, 337
                  sltu       s0, s8, t1
                  csrrc      a6, 0x340, t0
                  c.mv       t2, s5
                  sra        t2, t5, t6
                  csrrsi     s10, 0x340, 16
                  auipc      t4, 222003
                  mulhu      a5, a0, t4
                  c.li       a5, 24
                  sll        s3, tp, s9
                  c.lui      gp, 4
                  div        s9, s7, s0
                  csrrwi     s1, 0x340, 4
                  csrrw      zero, 0x340, s2
                  remu       a0, a4, a3
                  slli       t6, a1, 23
                  c.add      a1, a5
                  csrrci     s1, 0x340, 22
                  sra        a6, a0, s6
                  addi       s7, t1, -683
                  c.slli     a1, 18
                  add        t4, a0, s11
                  sltu       gp, a3, a6
                  csrrci     s1, 0x340, 15
                  mulhu      s7, s9, t1
                  sra        ra, s4, s11
                  csrrci     ra, 0x340, 18
                  c.or       s0, a5
                  slt        t2, t5, tp
                  nop
                  mul        t2, a2, zero
                  c.srai     s0, 4
                  csrrw      t6, 0x340, ra
                  xori       s9, s2, -957
                  remu       t3, gp, s7
                  mul        a7, t5, t6
                  or         a3, a7, s9
                  sll        s7, s11, s11
                  remu       a1, gp, t6
                  c.li       s2, -1
                  mulhsu     t4, s2, s1
                  or         s11, sp, a3
                  c.srai     a5, 13
                  csrrs      zero, 0x340, tp
                  or         a3, gp, s6
                  ori        t1, t1, -271
                  sll        t3, s10, s4
                  ori        s6, a1, 762
                  c.and      a4, a5
                  c.or       a4, a5
                  srai       t2, a3, 0
                  xor        ra, gp, s1
                  c.lui      t2, 11
                  mul        a0, a7, s0
                  mulhsu     a5, s10, s3
                  c.addi     gp, -1
                  srl        s3, s3, s3
                  csrrw      a6, 0x340, s7
                  slli       s0, a1, 5
                  sll        t0, t6, s4
                  c.lui      t5, 6
                  srl        zero, a0, a4
                  addi       zero, a0, 550
                  csrrw      s9, 0x340, s3
                  rem        tp, s5, s4
                  csrrwi     a2, 0x340, 30
                  srli       s3, a5, 3
                  add        a4, s5, s2
                  c.andi     a5, -1
                  c.and      a1, a3
                  div        a6, ra, a5
                  c.slli     a3, 3
                  mulhsu     zero, sp, t3
                  slti       a7, t6, -675
                  c.addi     t4, 10
                  divu       s6, t4, gp
                  slli       a6, a1, 0
                  slti       t0, s10, -147
                  c.add      a7, a5
                  csrrwi     t2, 0x340, 8
                  nop
                  ori        s0, a6, -488
                  mulhsu     a5, s5, s6
                  c.andi     s0, 27
                  csrrsi     tp, 0x340, 22
                  csrrwi     gp, 0x340, 31
                  srli       s6, a3, 31
                  csrrsi     a3, 0x340, 3
                  or         s2, s3, ra
                  csrrci     s10, 0x340, 8
                  sll        s11, gp, s2
                  c.and      a5, a5
                  c.addi     a6, -1
                  c.slli     s3, 26
                  sltiu      t2, t2, -1009
                  sltu       a5, s5, s5
                  slli       a4, a0, 23
                  mul        t3, a0, s4
                  srli       a7, s11, 14
                  c.andi     a4, -1
                  sltiu      a2, s2, 63
                  c.mv       s1, s3
                  c.xor      a0, a2
                  srl        t1, t6, gp
                  sub        a4, a2, ra
                  mulhu      gp, s9, s8
                  c.or       s1, a4
                  or         s10, ra, s3
                  auipc      t3, 607335
                  nop
                  mulh       a0, t4, s7
                  slli       s3, t0, 28
                  csrrwi     s4, 0x340, 13
                  c.mv       t2, a2
                  sub        s6, s1, t5
                  sll        t1, s6, s11
                  srli       ra, t3, 30
                  lui        a6, 801964
                  c.mv       t6, a0
                  csrrci     t0, 0x340, 23
                  c.li       a7, 3
                  sub        zero, a1, a1
                  addi       s10, a2, -944
                  c.mv       s0, a4
                  ori        t5, s3, -596
                  add        a0, ra, s8
                  div        a4, gp, zero
                  or         a3, s1, s1
                  c.andi     a1, 6
                  c.srli     a1, 29
                  c.li       t3, 10
                  or         s11, zero, s2
                  andi       t5, tp, 904
                  sub        s2, s2, s6
                  c.xor      a5, a3
                  c.slli     tp, 13
                  mul        tp, zero, s5
                  c.li       s7, 14
                  slt        s4, gp, s1
                  sltu       a2, s2, ra
                  remu       s11, ra, t4
                  mul        gp, s1, s4
                  c.srai     a0, 18
                  divu       ra, s2, s6
                  csrrs      a5, 0x340, t5
                  mulh       s2, zero, gp
                  nop
                  c.or       a2, a1
                  sll        tp, a4, s4
                  or         a0, t3, s0
                  c.mv       a7, s5
                  c.srli     a3, 8
                  nop
                  c.srai     s0, 15
                  sra        a6, sp, t6
                  c.nop
                  sltu       a0, t5, s7
                  slli       a4, a3, 24
                  csrrc      s1, 0x340, s6
                  rem        a6, a0, t4
                  xori       t1, s0, 538
                  mulhsu     a0, s0, s1
                  mul        s2, sp, a3
                  andi       gp, s8, -397
                  slt        ra, s8, s3
                  and        a0, t2, a0
                  c.andi     a0, -1
                  c.sub      a4, s0
                  c.srli     a1, 24
                  csrrw      tp, 0x340, t2
                  sub        s1, a7, t1
                  csrrw      s4, 0x340, a1
                  srli       s10, s1, 20
                  sltu       a1, a2, ra
                  c.and      a0, a4
                  csrrw      t2, 0x340, a2
                  c.nop
                  c.andi     s0, -1
                  srli       ra, ra, 31
                  sltu       a5, s6, s7
                  csrrc      s11, 0x340, s0
                  xor        a2, t0, t6
                  add        a2, t2, t6
                  c.addi     s6, -1
                  xori       a0, s5, 466
                  c.mv       s11, a5
                  rem        a0, tp, a1
                  c.li       s4, 24
                  or         t3, s0, t3
                  c.nop
                  c.sub      a3, a2
                  csrrci     a7, 0x340, 30
                  mul        s7, a5, s7
                  lui        tp, 221625
                  c.slli     s1, 11
                  ori        t1, t0, 417
                  srl        zero, a3, a7
                  andi       t0, t3, 561
                  remu       t5, s0, a7
                  c.lui      a4, 8
                  c.and      a1, a2
                  rem        s11, sp, s4
                  c.addi     s7, 10
                  c.srai     a4, 19
                  c.xor      a4, a2
                  c.and      a2, a3
                  sll        a7, s2, tp
                  nop
                  xori       t2, ra, -503
                  divu       a5, t1, s4
                  mulhu      a0, ra, a5
                  sltiu      s11, t3, -999
                  mulh       t0, t5, s7
                  div        a5, a7, s7
                  auipc      zero, 493056
                  divu       a1, sp, a4
                  and        s7, a1, ra
                  divu       s4, s1, s9
                  slti       t0, s7, 721
                  nop
                  srl        s10, s11, t1
                  sltiu      a6, s11, 798
                  csrrs      a4, 0x340, a3
                  divu       a3, t2, a7
                  c.slli     a4, 10
                  sub        a1, s5, a3
                  csrrsi     a6, 0x340, 26
                  srl        a1, a3, t6
                  slt        ra, a2, s0
                  c.li       t1, 23
                  c.srli     a0, 10
                  c.slli     a5, 11
                  c.slli     a2, 8
                  sltiu      s11, t6, 482
                  csrrc      ra, 0x340, a1
                  xori       t6, t5, 428
                  andi       a3, a6, -277
                  c.or       a5, a1
                  slli       ra, a5, 9
                  div        a3, s6, a4
                  nop
                  slti       a0, s9, -787
                  or         t5, t2, a1
                  srai       a6, zero, 27
                  or         t0, a5, a1
                  sll        t5, t1, s10
                  or         s3, t5, a2
                  slt        s4, s1, a3
                  c.srai     s0, 4
                  c.or       s1, a1
                  c.addi     s0, -1
                  c.lui      s10, 28
                  add        zero, t3, ra
                  addi       t4, s11, 769
                  div        t5, a7, a7
                  srl        gp, s7, s2
                  auipc      a4, 521478
                  sltiu      s3, s7, -845
                  rem        t0, ra, s9
                  c.lui      t5, 15
                  andi       a0, s0, 21
                  c.slli     s11, 31
                  ori        s6, a1, -1020
                  auipc      zero, 417579
                  c.andi     a0, 21
                  c.and      s0, s0
                  c.lui      t0, 10
                  c.and      a0, a0
                  mulhsu     s3, ra, a5
                  c.andi     s0, -1
                  mulhsu     s10, s8, t2
                  sltu       s7, t4, t5
                  div        a0, ra, s6
                  xor        t5, a1, s11
                  slli       a7, s9, 25
                  c.li       a7, -1
                  c.andi     a5, 29
                  add        a2, t5, s2
                  lui        s0, 335209
                  ori        t4, s1, 563
                  csrrwi     a4, 0x340, 21
                  ori        t3, s2, -386
                  div        t3, s4, a3
                  c.li       s11, 31
                  lui        a2, 63505
                  c.xor      a4, a4
                  slti       t0, sp, -475
                  sub        gp, s5, s7
                  slti       a5, s10, 302
                  c.srli     a2, 2
                  xori       t5, t5, -1018
                  ori        t1, s4, 671
                  c.li       a6, -1
                  rem        s3, a1, t1
                  lui        ra, 814492
                  mulhu      s6, a2, s11
                  div        a5, ra, a3
                  srai       t3, a4, 15
                  xor        t1, s3, tp
                  div        gp, t1, zero
                  c.add      s11, s2
                  slli       t6, s11, 2
                  sltu       s0, t5, s5
                  csrrw      a6, 0x340, a2
                  c.li       ra, 27
                  slli       s4, s0, 10
                  csrrc      s4, 0x340, a2
                  add        t2, a1, sp
                  c.mv       t4, a4
                  rem        s6, t3, t0
                  andi       s3, ra, -870
                  srai       s10, sp, 20
                  c.sub      s1, a4
                  csrrs      a6, 0x340, t5
                  c.nop
                  mulhsu     t2, s2, s7
                  c.mv       s11, s10
                  lui        s2, 464617
                  auipc      s10, 431954
                  sra        t4, ra, s4
                  ori        t2, s4, 527
                  slti       a4, sp, 983
                  slti       s10, t5, 1020
                  csrrsi     a4, 0x340, 27
                  c.andi     a1, 6
                  auipc      t5, 917733
                  nop
                  andi       a1, tp, -542
                  sra        s1, t6, a6
                  sra        s0, s8, s3
                  and        t4, sp, s2
                  mulhsu     s1, a2, a1
                  c.mv       t4, s10
                  sra        s11, sp, zero
                  csrrci     a2, 0x340, 14
                  auipc      s1, 802541
                  c.lui      t4, 10
                  c.xor      s1, a2
                  sltiu      s11, s7, -152
                  csrrs      ra, 0x340, tp
                  ori        t4, s6, -882
                  srli       s3, t2, 8
                  c.sub      a4, a0
                  csrrc      s0, 0x340, a5
                  csrrwi     a1, 0x340, 24
                  csrrs      a2, 0x340, s3
                  c.andi     s0, -1
                  divu       a1, t6, sp
                  csrrsi     s1, 0x340, 13
                  add        t3, a2, ra
                  csrrci     t3, 0x340, 20
                  remu       a4, s6, s3
                  sltiu      a7, a6, -509
                  c.and      s0, a2
                  csrrci     t5, 0x340, 23
                  c.srai     s1, 20
                  sra        tp, a0, s4
                  add        s9, s5, s5
                  xori       s11, a2, 381
                  ori        a5, t5, 398
                  mul        s4, a5, t2
                  ori        a1, t3, 596
                  sll        s10, s10, a2
                  c.srli     s1, 24
                  ori        a0, s11, -237
                  andi       t0, s3, -905
                  addi       s9, s5, -819
                  csrrci     t0, 0x340, 25
                  divu       s1, s8, t0
                  c.sub      a5, a0
                  srai       a0, s8, 31
                  slti       t0, t5, 909
                  sll        zero, ra, t3
                  srli       s9, a5, 18
                  c.srli     a1, 28
                  c.nop
                  slti       s6, s3, -387
                  div        a5, s5, s8
                  slti       tp, a2, -7
                  c.add      s2, t5
                  lui        s10, 209
                  c.andi     a5, 23
                  sltu       ra, s9, s9
                  c.or       s0, a4
                  andi       a4, sp, 598
                  srl        gp, a0, s2
                  sltu       s1, s7, ra
                  c.andi     s0, -1
                  slli       t5, s10, 14
                  lui        a2, 477577
                  xor        s3, a2, tp
                  c.and      a3, a3
                  c.srli     s1, 29
                  c.addi     t4, 2
                  c.slli     s0, 11
                  mulhu      tp, t0, a4
                  srli       a4, ra, 18
                  c.lui      a4, 26
                  slti       a6, s0, 918
                  sltiu      t5, s0, -716
                  csrrc      a0, 0x340, zero
                  c.addi     gp, -1
                  c.xor      a2, a3
                  slli       s11, a5, 10
                  sltu       t0, t2, s9
                  c.srli     s0, 17
                  lui        t6, 714351
                  nop
                  c.andi     a5, -1
                  or         tp, s11, tp
                  mulhsu     a0, s8, a7
                  srli       s7, a3, 8
                  div        s11, tp, s0
                  divu       s0, t4, zero
                  mulhsu     a5, t6, t1
                  c.lui      t6, 8
                  c.nop
                  mulhu      a4, s11, a2
                  mulhsu     a4, zero, s11
                  slli       t5, tp, 27
                  csrrw      a4, 0x340, t0
                  divu       a7, t0, s6
                  c.mv       s7, s10
                  slti       t4, a7, -109
                  srli       a0, a2, 31
                  c.slli     s7, 5
                  sltiu      s6, ra, 12
                  csrrsi     s3, 0x340, 24
                  andi       a0, a5, -868
                  c.nop
                  div        t0, ra, t2
                  ori        t4, zero, -497
                  srli       t5, t6, 8
                  csrrs      a5, 0x340, s5
                  c.srli     a5, 30
                  xor        s11, s5, s4
                  sub        a2, a5, s6
                  srli       gp, s10, 21
                  srl        gp, gp, t4
                  sltiu      t2, s5, -149
                  srli       ra, ra, 31
                  add        a2, t2, t1
                  divu       s0, a0, t3
                  c.slli     s6, 24
                  csrrs      s0, 0x340, a1
                  sltiu      s4, s5, -826
                  srli       a2, a6, 20
                  csrrc      t4, 0x340, t2
                  div        a6, a1, ra
                  csrrwi     a6, 0x340, 18
                  slli       s6, t1, 22
                  sll        t3, gp, a4
                  c.add      a4, t0
                  c.or       a3, s0
                  auipc      t4, 376217
                  csrrc      t4, 0x340, t0
                  c.srli     a5, 2
                  rem        gp, a3, s10
                  csrrwi     ra, 0x340, 30
                  sltiu      a2, a7, 386
                  lui        gp, 465791
                  c.srli     a1, 3
                  csrrc      a7, 0x340, s11
                  mulh       t5, zero, t5
                  c.xor      a2, a0
                  c.lui      a5, 20
                  add        a3, t3, zero
                  c.and      a2, a0
                  sltiu      s4, a4, 155
                  srli       s6, t0, 2
                  addi       t4, s3, 785
                  csrrsi     gp, 0x340, 8
                  c.addi     a1, 18
                  c.xor      a5, a2
                  csrrc      tp, 0x340, a6
                  mulhsu     s6, s5, a6
                  or         a0, a6, s1
                  c.sub      a0, s0
                  slt        t2, s3, s4
                  nop
                  srai       t4, s4, 25
                  addi       gp, s4, -301
                  sub        s3, sp, a5
                  c.mv       a2, s6
                  ori        a4, a6, 438
                  rem        t1, s7, sp
                  and        a4, a3, t2
                  mulh       a6, s10, s6
                  lui        ra, 1043129
                  auipc      t0, 108461
                  lui        t1, 454434
                  csrrw      a6, 0x340, ra
                  c.srai     a3, 20
                  slli       ra, s9, 2
                  c.xor      s1, a1
                  mulhsu     a3, s9, t6
                  mulh       a1, zero, s0
                  div        t6, s3, a7
                  c.nop
                  nop
                  rem        t1, s6, s6
                  slti       t3, t2, -532
                  c.or       s1, s0
                  sltiu      a0, t2, -513
                  csrrc      s6, 0x340, s7
                  c.nop
                  c.srli     a2, 2
                  csrrc      s7, 0x340, s10
                  c.addi     a7, -1
                  lui        a3, 1019843
                  c.mv       gp, s6
                  mulh       a7, a3, s10
                  c.mv       a4, gp
                  sll        t1, s6, s10
                  c.or       a2, a1
                  mulh       s1, tp, s9
                  csrrw      ra, 0x340, s0
                  slti       a0, t1, 642
                  add        gp, t0, t0
                  remu       s4, sp, s4
                  and        a6, ra, a1
                  sub        t5, s3, t0
                  c.lui      s4, 5
                  c.and      a3, s0
                  remu       a6, s2, t1
                  and        t4, s1, a1
                  csrrwi     tp, 0x340, 5
                  c.and      s1, a5
                  lui        ra, 215835
                  xori       t0, t0, 674
                  c.xor      s0, s0
                  andi       s1, s2, 341
                  c.addi     a7, -1
                  add        t0, t0, a1
                  c.nop
                  and        s4, a2, a0
                  sub        a0, s2, gp
                  srl        s1, s10, s11
                  sub        s3, s1, tp
                  mulhsu     t4, t1, a4
                  c.nop
                  addi       t0, ra, -347
                  c.sub      a3, a0
                  c.add      s11, s7
                  sltu       t0, t1, sp
                  slli       s1, s3, 7
                  c.srli     a0, 16
                  nop
                  divu       t4, t4, a2
                  sltu       t4, s2, a0
                  mulh       a4, a3, s1
                  csrrc      s4, 0x340, s5
                  remu       s6, s9, a1
                  auipc      a2, 851438
                  c.srai     a3, 9
                  xori       s7, a2, 880
                  slt        s9, s6, t1
                  srai       t6, a1, 14
                  rem        a3, a1, sp
                  c.li       a0, -1
                  mulh       s11, s5, a6
                  nop
                  c.lui      t2, 5
                  xori       t1, a6, 813
                  sll        s3, gp, s2
                  sll        t5, s3, t0
                  xor        t3, s1, a6
                  c.mv       s7, t5
                  csrrc      t1, 0x340, a6
                  mul        gp, s1, s3
                  remu       a6, t1, s6
                  c.slli     s4, 21
                  mulhu      t5, a7, sp
                  c.slli     tp, 14
                  lui        tp, 572860
                  slt        t3, s9, sp
                  c.sub      a2, a2
                  c.and      a1, a5
                  andi       a0, t1, 962
                  csrrc      s3, 0x340, s5
                  c.srai     s0, 6
                  ori        s2, a5, 973
                  srai       a5, a1, 11
                  csrrwi     s6, 0x340, 16
                  c.or       a4, s0
                  rem        t3, t5, t4
                  sltiu      a4, a3, -208
                  csrrci     s7, 0x340, 29
                  c.srli     a5, 19
                  c.or       a0, a5
                  ori        t1, s6, 178
                  c.andi     a0, -1
                  remu       a0, s3, s1
                  xor        s1, t0, s1
                  c.andi     s0, -1
                  slt        a5, gp, s2
                  c.nop
                  c.andi     a5, 31
                  add        s1, s6, t6
                  nop
                  mulhu      s11, t1, s5
                  sra        a6, s6, s11
                  xori       t0, s9, 860
                  srai       a7, t2, 11
                  and        t3, s2, a4
                  xori       t4, t1, -831
                  xor        t1, t1, a4
                  slt        s2, s4, a1
                  lui        s6, 68419
                  srl        t0, t6, t0
                  c.and      s1, s1
                  c.srli     s1, 30
                  c.andi     a1, -1
                  c.srai     a3, 11
                  sra        zero, a4, a4
                  c.li       s7, -1
                  c.nop
                  c.and      s1, a4
                  or         s9, t5, gp
                  c.add      s11, s1
                  or         a7, a1, s5
                  nop
                  sltiu      s1, a1, 780
                  c.srai     a1, 13
                  srai       a6, tp, 3
                  c.xor      s0, a2
                  slli       zero, s9, 29
                  rem        t0, a7, t0
                  xor        a3, a6, a4
                  srl        a0, gp, t0
                  div        a2, a1, a0
                  andi       t5, gp, 195
                  rem        a0, ra, t1
                  csrrs      s6, 0x340, a5
                  c.andi     a1, -1
                  c.nop
                  sub        t1, a2, s5
                  andi       t1, gp, -731
                  div        a3, t3, t4
                  c.xor      a5, a0
                  sra        s9, t4, t4
                  divu       t3, a2, s8
                  srai       s10, s9, 24
                  lui        s11, 120481
                  c.lui      s4, 21
                  andi       s6, a7, -804
                  csrrwi     gp, 0x340, 25
                  c.li       t3, -1
                  c.nop
                  remu       s0, sp, s9
                  slt        ra, a5, s10
                  c.srai     s0, 5
                  c.slli     a7, 12
                  c.nop
                  mulhsu     zero, s10, t6
                  srl        s0, s11, t3
                  csrrc      s0, 0x340, t4
                  slli       s9, s2, 18
                  auipc      s3, 453358
                  auipc      t3, 911266
                  c.sub      s0, s0
                  or         a1, s6, t1
                  srl        tp, t1, a6
                  slti       s11, a7, -403
                  mulhu      s1, s1, s4
                  c.mv       t2, s6
                  c.andi     a3, -1
                  rem        s0, t0, t0
                  ori        tp, s4, 449
                  c.slli     t6, 13
                  c.li       a4, 25
                  c.sub      s1, a5
                  mulhsu     tp, a4, s4
                  div        t2, a0, s3
                  div        s2, sp, a3
                  c.addi     s10, -1
                  mulh       t2, s10, sp
                  c.and      a5, a2
                  remu       a6, zero, a2
                  mulh       s3, s8, s3
                  c.or       a1, a5
                  xori       s10, s9, 533
                  c.xor      s0, a5
                  mulhu      a2, s1, s8
                  sltiu      t0, a6, -747
                  or         a2, t6, s0
                  or         a1, sp, a6
                  srl        s10, a4, a3
                  rem        s1, t3, t5
                  sltiu      ra, s1, -205
                  nop
                  c.xor      a2, s0
                  lui        s9, 359286
                  auipc      gp, 332018
                  mulh       t0, a7, s6
                  srai       tp, t4, 31
                  csrrs      zero, 0x340, t6
                  slli       s4, t1, 16
                  sltiu      s3, s4, -1016
                  mulhu      t0, a1, a7
                  c.li       t6, -1
                  sll        t4, s6, s3
                  c.srai     a2, 24
                  csrrw      a7, 0x340, s7
                  c.li       t4, -1
                  divu       t3, t1, a6
                  divu       s3, a7, t0
                  and        s3, tp, s1
                  xor        s1, s0, a3
                  xor        a2, a7, ra
                  sll        a5, t5, tp
                  srai       a7, s5, 11
                  rem        a6, a6, a1
                  srl        a6, zero, zero
                  sltiu      s7, t3, 517
                  divu       t3, ra, a0
                  nop
                  divu       a6, ra, s9
                  remu       a4, zero, a7
                  c.li       s6, 23
                  c.lui      s2, 30
                  c.xor      a3, a0
                  sltiu      s2, a6, 628
                  mulhu      zero, a6, s2
                  sltu       s3, t6, a1
                  csrrwi     t0, 0x340, 20
                  slti       t4, t0, -692
                  mul        a5, t2, ra
                  add        t5, t0, s2
                  csrrs      s0, 0x340, a7
                  ori        ra, t4, -466
                  c.lui      s0, 31
                  and        a4, a0, s9
                  xor        t2, t3, s3
                  xori       t5, a3, -849
                  srli       t4, s5, 23
                  c.srli     a5, 28
                  c.mv       a2, a6
                  andi       a0, a2, 75
                  slt        a3, gp, t0
                  srai       t2, t1, 26
                  mulhsu     s1, t4, a5
                  auipc      t0, 604935
                  auipc      zero, 834610
                  sra        zero, t0, tp
                  srli       gp, tp, 1
                  c.srai     s0, 18
                  c.slli     a0, 29
                  rem        s6, a5, ra
                  csrrsi     a6, 0x340, 13
                  slt        t2, s7, s9
                  mulhu      a7, t5, s2
                  c.lui      s11, 22
                  srli       gp, a7, 1
                  sltu       a1, s4, tp
                  mulhu      s11, zero, s11
                  csrrsi     a3, 0x340, 30
                  mulh       s4, zero, a6
                  xori       tp, ra, -193
                  lui        gp, 853747
                  c.mv       s6, gp
                  c.addi     s7, 31
                  add        ra, t1, s9
                  srai       a1, t0, 14
                  addi       a1, gp, -57
                  srai       a0, s9, 12
                  sltu       t3, a1, a4
                  c.srai     a5, 13
                  c.addi     s9, -1
                  csrrw      s3, 0x340, a5
                  ori        a4, gp, 557
                  or         gp, s3, t4
                  c.li       tp, 16
                  csrrs      s10, 0x340, sp
                  xor        gp, a2, t5
                  sltiu      s0, t5, 544
                  sltu       t6, a5, s3
                  c.xor      a2, s1
                  c.lui      a6, 6
                  ori        s6, t1, -82
                  c.andi     a5, 30
                  c.xor      a5, a1
                  and        t1, s1, zero
                  c.li       s3, 27
                  div        t6, s1, t5
                  c.or       a5, a2
                  sll        a5, s0, s2
                  c.sub      a2, a1
                  div        s9, a6, a3
                  add        a3, a0, s1
                  divu       gp, s9, t6
                  rem        s4, zero, s5
                  rem        s0, t6, s9
                  mul        s6, ra, t4
                  c.srli     a3, 14
                  csrrw      a3, 0x340, s3
                  remu       s7, s8, s9
                  csrrc      s6, 0x340, t1
                  srl        s1, a0, s11
                  or         s4, t5, a5
                  mul        a0, a2, t2
                  c.andi     a0, 30
                  srli       s6, ra, 0
                  c.addi     t5, 9
                  srli       s2, a0, 27
                  rem        t0, s8, s8
                  and        a4, s11, a6
                  sra        s6, t6, t0
                  c.li       s6, -1
                  mul        a7, t3, a4
                  lui        s6, 349197
                  c.andi     s1, -1
                  c.xor      a3, a3
                  sub        t2, s8, t3
                  c.xor      s1, s0
                  csrrw      t1, 0x340, t3
                  csrrw      a6, 0x340, t3
                  rem        s1, s9, s9
                  c.slli     a7, 9
                  lui        t1, 595386
                  divu       a0, s10, a3
                  c.li       t5, -1
                  csrrwi     a6, 0x340, 24
                  nop
                  andi       s7, a5, 403
                  c.addi     s2, 4
                  c.and      a5, s1
                  c.add      s10, s4
                  addi       zero, s6, 975
                  mul        s4, s1, s2
                  xor        t1, gp, a1
                  srli       a7, a3, 25
                  sltu       s1, s5, s0
                  c.srli     a2, 6
                  c.lui      t5, 11
                  c.add      a1, sp
                  c.srli     s0, 14
                  srai       t3, s7, 19
                  c.andi     a1, -1
                  c.xor      a2, a4
                  andi       s6, t3, -503
                  c.nop
                  auipc      a6, 692359
                  csrrs      s4, 0x340, t3
                  c.srai     s0, 20
                  ori        a6, sp, 693
                  c.nop
                  xor        s9, s5, t6
                  ori        s10, s10, -376
                  srai       gp, tp, 6
                  sltu       s3, s4, t0
                  divu       t2, s2, a6
                  mulh       a6, t4, s3
                  c.andi     a1, 22
                  c.or       a1, a2
                  or         a6, t2, s9
                  c.lui      s1, 3
                  sll        ra, zero, s5
                  div        s2, tp, s9
                  rem        t4, s8, t3
                  mulh       s1, s0, s10
                  add        s0, tp, a7
                  srli       s9, a6, 17
                  srai       t1, s4, 2
                  csrrsi     s2, 0x340, 20
                  sltu       s11, a2, a2
                  div        t4, s9, ra
                  c.li       s11, 6
                  auipc      s0, 483039
                  sltiu      a0, t2, 170
                  mulhu      s4, s7, s6
                  slt        a3, s0, t0
                  c.addi     ra, -1
                  and        zero, gp, t0
                  sltiu      a7, s9, 375
                  srl        a1, s9, s1
                  div        t1, ra, a3
                  c.xor      a3, a4
                  andi       a0, s11, -670
                  srl        s0, s4, t3
                  c.andi     a4, 6
                  andi       a2, t0, -663
                  ori        t1, sp, 983
                  sll        s7, s10, gp
                  and        t0, zero, a4
                  csrrwi     a4, 0x340, 19
                  csrrwi     a7, 0x340, 26
                  mul        t5, s6, s10
                  lui        a1, 634055
                  ori        a6, t1, 813
                  mulh       s1, s8, s4
                  c.nop
                  c.add      s0, a2
                  c.lui      t4, 12
                  c.and      a0, a5
                  csrrw      t0, 0x340, a1
                  c.lui      a3, 21
                  remu       t4, zero, t2
                  remu       t6, s5, sp
                  csrrs      s2, 0x340, s0
                  nop
                  c.andi     a3, 24
                  csrrsi     a6, 0x340, 30
                  sra        gp, t4, a1
                  c.xor      a3, a0
                  rem        t3, s4, sp
                  c.slli     gp, 14
                  nop
                  and        a6, t3, s10
                  xori       t2, a6, -403
                  c.or       a0, a3
                  c.srai     a4, 27
                  csrrwi     a6, 0x340, 21
                  mulh       a7, t5, t2
                  csrrs      s7, 0x340, ra
                  slti       s1, s7, 393
                  ori        t2, s7, 150
                  auipc      a7, 366498
                  rem        s3, a1, zero
                  c.add      s6, t2
                  nop
                  c.sub      s0, a5
                  mulh       a2, s0, s1
                  csrrsi     s1, 0x340, 11
                  slti       t3, a2, 856
                  c.xor      s0, s0
                  c.or       a0, a1
                  c.and      a2, s1
                  srai       a3, a6, 25
                  divu       zero, t5, t2
                  rem        t2, zero, sp
                  or         a4, s2, s4
                  c.li       t1, -1
                  srai       s11, s8, 6
                  c.add      s2, t1
                  csrrsi     t3, 0x340, 31
                  slt        s6, s5, a7
                  mul        t1, t2, s8
                  rem        t4, a3, a0
                  c.addi     t3, 4
                  addi       a5, t5, 537
                  sltiu      s6, t2, 614
                  ori        a0, a6, 459
                  c.li       t1, 30
                  c.lui      t5, 7
                  c.nop
                  slti       s3, t6, 371
                  xori       a6, a0, 740
                  mulh       s11, a1, t3
                  c.nop
                  ori        t0, s4, 650
                  xor        tp, a4, t5
                  c.lui      t1, 5
                  xori       s1, s6, 33
                  c.srai     a1, 2
                  sltu       gp, t1, s4
                  sltu       a2, a3, s0
                  csrrci     s2, 0x340, 5
                  andi       s10, s8, -807
                  sltu       t0, t2, ra
                  c.andi     a1, 3
                  add        s4, t0, t4
                  c.mv       t6, s0
                  csrrsi     t6, 0x340, 15
                  c.mv       a2, a0
                  slti       s11, a2, 229
                  divu       t1, s8, a0
                  sra        a7, s0, s8
                  mul        s2, s8, s2
                  lui        zero, 1011786
                  and        s7, a2, t5
                  c.srli     a3, 8
                  c.xor      a0, a0
                  csrrci     s10, 0x340, 10
                  c.slli     s9, 14
                  c.or       s0, s1
                  csrrs      a7, 0x340, a7
                  c.add      s4, a7
                  srai       a0, s8, 26
                  sra        a5, t6, s9
                  csrrsi     t5, 0x340, 15
                  c.sub      a2, a3
                  sltiu      a6, s9, -110
                  mulhsu     a1, t2, s11
                  c.nop
                  sll        t3, t5, t6
                  slli       s11, tp, 19
                  c.mv       s11, t0
                  csrrw      s1, 0x340, s9
                  xor        t2, a4, a5
                  c.nop
                  csrrwi     t1, 0x340, 7
                  slti       s2, s11, 134
                  div        zero, s9, t4
                  c.add      t1, s7
                  c.and      a3, s0
                  auipc      s9, 852796
                  csrrsi     ra, 0x340, 3
                  c.slli     s9, 17
                  add        s7, a0, s6
                  c.li       a3, 20
                  xor        s1, t6, s7
                  xor        a3, t1, s4
                  remu       a1, s2, t4
                  sltu       t1, s2, a2
                  c.or       a5, a5
                  c.nop
                  slt        s10, sp, gp
                  c.slli     t4, 2
                  csrrsi     a7, 0x340, 28
                  c.and      a3, a5
                  c.sub      a2, s1
                  add        s3, zero, t1
                  xori       s2, a5, -877
                  mulhsu     s7, s0, t5
                  c.mv       t1, t4
                  or         t6, gp, sp
                  csrrs      s7, 0x340, ra
                  mulhu      s1, s10, t0
                  csrrsi     t1, 0x340, 11
                  csrrs      s9, 0x340, a4
                  addi       s9, sp, -993
                  sub        a4, t3, t4
                  xor        a1, s7, t4
                  csrrc      s10, 0x340, s5
                  mulhu      t3, t1, s1
                  lui        a1, 132473
                  srai       a7, s0, 24
                  remu       a7, a6, sp
                  c.xor      a3, a1
                  nop
                  c.lui      a3, 25
                  c.andi     s0, -1
                  srai       ra, a7, 15
                  c.lui      s2, 9
                  or         gp, a5, a3
                  c.slli     a2, 3
                  c.srai     a1, 31
                  sltu       s4, zero, a3
                  mul        a1, s11, s3
                  auipc      ra, 355177
                  c.mv       t2, s2
                  c.sub      a2, a0
                  sll        t1, sp, a4
                  csrrci     t5, 0x340, 8
                  sub        t1, tp, s5
                  sra        a0, t3, t4
                  c.mv       s1, t3
                  csrrsi     s3, 0x340, 1
                  c.srli     a0, 10
                  remu       t2, ra, t6
                  sltu       s4, t5, a3
                  and        gp, a4, a2
                  c.slli     t5, 3
                  c.mv       a2, tp
                  c.and      s1, a3
                  c.srai     a0, 20
                  srai       t2, s4, 3
                  c.xor      a0, a3
                  slti       t0, s2, 644
                  c.add      a7, t5
                  c.srli     a4, 10
                  csrrs      s10, 0x340, t1
                  sub        a0, s3, t5
                  c.srli     a3, 29
                  c.mv       a1, s10
                  csrrs      a0, 0x340, a2
                  slt        t5, s0, s1
                  slli       s6, t0, 9
                  sltu       tp, a4, t2
                  slli       s2, a3, 0
                  xori       s7, s11, 931
                  slt        s1, t1, sp
                  c.add      s3, a5
                  addi       a7, t5, 772
                  auipc      s3, 390762
                  c.or       a2, s0
                  c.nop
                  rem        s0, a7, a2
                  slti       a1, sp, 1012
                  slt        a1, tp, zero
                  rem        a4, s6, s11
                  addi       s3, a5, -215
                  xor        s4, t5, t2
                  sub        a3, a3, s8
                  srai       ra, a4, 1
                  sltu       zero, a1, a2
                  xori       s3, s4, 940
                  c.mv       t1, a7
                  div        s4, s8, zero
                  c.add      s10, a6
                  c.lui      a5, 26
                  c.srli     a5, 31
                  slt        ra, t6, tp
                  divu       t2, s2, a1
                  srli       a6, tp, 25
                  divu       ra, a0, a6
                  lui        a6, 799591
                  c.addi     s2, -1
                  and        a3, t2, t0
                  mulhsu     a7, ra, a6
                  div        a5, t2, t0
                  csrrci     a4, 0x340, 6
                  sub        t5, t2, s4
                  csrrs      a6, 0x340, gp
                  csrrci     t5, 0x340, 25
                  sub        s3, ra, tp
                  srl        s4, t1, t1
                  slli       s9, t5, 6
                  csrrsi     a4, 0x340, 4
                  sll        a7, sp, t6
                  srl        t4, a2, s6
                  c.or       s0, a0
                  slli       t4, sp, 4
                  srl        s10, s0, a3
                  csrrci     s0, 0x340, 13
                  c.and      a2, s0
                  srl        s9, s4, t0
                  mulhu      t6, s7, a1
                  mulhsu     t4, s1, ra
                  ori        a7, t6, 679
                  div        zero, s8, ra
                  srl        gp, t5, t1
                  c.addi     s1, -1
                  csrrc      a2, 0x340, sp
                  div        a6, a0, a6
                  c.or       s0, a1
                  csrrci     s4, 0x340, 1
                  csrrw      a3, 0x340, zero
                  c.addi     s6, -1
                  add        gp, ra, s1
                  c.li       a4, 20
                  c.slli     t5, 13
                  mulh       s0, t0, gp
                  srai       s2, a3, 29
                  mul        s0, a7, a4
                  csrrsi     t6, 0x340, 3
                  c.nop
                  sltiu      s1, tp, 165
                  sll        t2, s6, t6
                  csrrs      ra, 0x340, s11
                  divu       s9, s2, t0
                  sra        t1, s6, s3
                  slt        s3, zero, t2
                  mulhu      t2, tp, a2
                  csrrwi     s6, 0x340, 22
                  srl        a6, t6, s4
                  lui        t3, 129469
                  c.or       a4, a4
                  sltiu      tp, t0, 427
                  mul        a1, s10, s0
                  addi       t0, tp, -583
                  srl        a3, a4, a7
                  sub        s10, t3, t6
                  sll        gp, t0, s2
                  c.and      a1, a3
                  xori       s3, t1, 243
                  mulh       s2, zero, s11
                  div        t2, a1, s11
                  c.addi     a6, 5
                  ori        a6, t5, 686
                  rem        t4, s2, t4
                  slt        a6, zero, s2
                  auipc      a5, 525855
                  csrrw      zero, 0x340, a0
                  xori       gp, a7, 81
                  and        a7, s1, s11
                  lui        s1, 528775
                  csrrwi     t2, 0x340, 8
                  divu       t5, sp, zero
                  c.and      s0, a5
                  ori        tp, s11, 723
                  divu       gp, s0, t0
                  and        t4, a2, t6
                  mulhsu     t6, tp, s4
                  mulhsu     t2, a5, t3
                  sub        s6, s6, t6
                  nop
                  auipc      a4, 59305
                  or         s10, t2, t6
                  nop
                  divu       t0, a2, s5
                  sub        s6, t6, s6
                  c.nop
                  c.nop
                  remu       t3, t5, s7
                  c.addi     a3, 11
                  addi       t0, s10, -69
                  c.or       a2, s1
                  xori       a0, a7, -277
                  c.and      a5, a1
                  xor        t3, t6, s11
                  c.nop
                  xori       a5, t1, 356
                  c.xor      a0, a4
                  c.srai     a3, 11
                  c.addi     a2, -1
                  csrrc      t6, 0x340, a6
                  c.nop
                  nop
                  or         a4, s5, a6
                  mulhsu     a6, a6, a6
                  c.nop
                  div        a5, a4, s3
                  c.lui      t4, 21
                  c.nop
                  c.slli     t2, 29
                  nop
                  slli       a4, sp, 30
                  c.mv       t0, t2
                  sub        a1, s11, t1
                  lui        a6, 275971
                  c.srli     a4, 31
                  c.andi     a4, 17
                  c.lui      t5, 15
                  c.xor      a4, s0
                  c.and      a1, s1
                  c.addi     s3, 17
                  nop
                  divu       a7, a7, t3
                  slt        a7, s3, a0
                  csrrc      s3, 0x340, s3
                  c.xor      s1, a2
                  c.and      a2, a3
                  csrrw      s3, 0x340, a2
                  c.mv       a2, a0
                  c.addi     gp, 22
                  csrrsi     zero, 0x340, 11
                  lui        s6, 414217
                  csrrw      a5, 0x340, t6
                  lui        s2, 308129
                  c.nop
                  andi       gp, a5, -249
                  remu       a3, t1, a7
                  xor        s9, s3, t3
                  xori       t0, sp, 283
                  c.lui      t6, 29
                  c.or       a1, a5
                  xori       tp, s3, 0
                  csrrc      s4, 0x340, t5
                  csrrs      gp, 0x340, s11
                  slt        a0, s1, a0
                  mul        t0, tp, sp
                  sra        s7, t3, s7
                  csrrs      a3, 0x340, t5
                  mulh       s6, s11, a1
                  c.or       a1, a0
                  c.add      t5, s9
                  div        s9, t5, a7
                  srl        t2, s5, a2
                  rem        s0, s1, a2
                  add        s7, t5, t1
                  c.or       a3, a1
                  csrrw      t6, 0x340, a4
                  csrrci     s1, 0x340, 10
                  nop
                  mulhu      t5, a6, t0
                  csrrs      zero, 0x340, t2
                  csrrc      t4, 0x340, a2
                  csrrc      a5, 0x340, a7
                  xor        a6, s1, t2
                  and        ra, s3, s2
                  and        a3, zero, t4
                  mulhsu     s9, tp, a5
                  andi       s7, a6, -263
                  mulhu      a5, s11, s8
                  add        a6, a7, s9
                  rem        s11, a0, gp
                  divu       a6, t5, t2
                  c.and      s1, a2
                  c.sub      a3, a1
                  c.li       s4, 15
                  csrrs      t1, 0x340, a5
                  add        t4, a6, s6
                  divu       a2, sp, t2
                  add        s11, t2, s7
                  c.nop
                  csrrc      t1, 0x340, t6
                  csrrci     ra, 0x340, 29
                  lui        t3, 793955
                  sll        s10, a5, s0
                  c.andi     a4, -1
                  srai       ra, s2, 20
                  auipc      a6, 34341
                  sltiu      a0, s9, -263
                  divu       t6, a2, a0
                  csrrsi     s1, 0x340, 10
                  slli       t1, ra, 14
                  or         t3, t0, s8
                  c.andi     a2, -1
                  c.lui      a4, 22
                  div        t3, s9, s9
                  csrrs      t1, 0x340, t0
                  sra        s0, a6, a7
                  srai       a2, a0, 2
                  and        a0, ra, gp
                  divu       s4, s11, t1
                  c.li       a3, 8
                  div        tp, gp, s8
                  c.mv       a4, tp
                  csrrs      t5, 0x340, s3
                  sub        s6, t6, a6
                  slti       t6, s1, -979
                  c.li       s1, 16
                  sltu       a6, s5, s11
                  srai       s4, a1, 26
                  sltu       gp, gp, a1
                  slli       zero, t2, 16
                  xori       t6, a1, 744
                  sltiu      t4, a6, 450
                  mulhu      s4, tp, a3
                  csrrci     a7, 0x340, 27
                  csrrc      a0, 0x340, s9
                  c.xor      s1, a2
                  sll        a0, s6, gp
                  auipc      tp, 145440
                  csrrc      t6, 0x340, s3
                  or         s9, t0, t5
                  srai       s1, s11, 25
                  xori       a0, s6, 733
                  c.sub      a1, s0
                  c.srli     a5, 9
                  c.mv       a1, s5
                  srli       s6, s8, 2
                  c.lui      s1, 7
                  srl        a7, t6, s5
                  csrrsi     t5, 0x340, 1
                  and        a5, s3, ra
                  andi       a7, a5, 554
                  nop
                  xor        s4, t6, a0
                  srli       t3, gp, 16
                  slli       zero, t0, 25
                  nop
                  c.xor      a5, a5
                  div        s1, ra, s1
                  remu       t3, s8, tp
                  xori       a2, zero, -829
                  ori        t3, a2, 608
                  div        t0, a2, s2
                  nop
                  andi       s0, sp, -614
                  c.li       t1, 1
                  auipc      s11, 849415
                  csrrc      a6, 0x340, t6
                  csrrwi     t0, 0x340, 21
                  c.sub      a0, a1
                  sub        t5, s11, s1
                  c.lui      a5, 1
                  sra        a3, a3, t3
                  c.andi     a1, 20
                  slt        a1, a7, s0
                  c.addi     t1, 23
                  sltu       t3, a6, s5
                  and        a4, a4, t0
                  srl        a7, t2, tp
                  or         t5, ra, a0
                  div        a5, s3, t6
                  ori        t1, ra, 289
                  div        tp, s3, s10
                  c.srli     a1, 18
                  lui        ra, 106608
                  csrrci     t0, 0x340, 16
                  ori        s0, s8, -390
                  c.srai     a3, 4
                  srai       s2, gp, 14
                  c.slli     s1, 22
                  slt        s1, s1, zero
                  c.and      a4, a0
                  slti       t6, t0, -342
                  csrrc      t5, 0x340, zero
                  sltiu      s11, t5, 765
                  div        t2, s7, s8
                  csrrc      s9, 0x340, s3
                  sltu       s11, t3, t3
                  c.addi     ra, 29
                  srli       t1, s7, 5
                  c.srai     s1, 23
                  remu       ra, s10, a1
                  remu       a7, a4, s0
                  c.add      gp, a7
                  srli       s10, s0, 28
                  csrrc      a4, 0x340, s8
                  rem        t6, s3, a0
                  slli       gp, tp, 13
                  rem        s0, t0, s7
                  or         t5, a4, tp
                  c.andi     a0, -1
                  mulhu      t5, s4, s9
                  sltu       a1, s0, t1
                  sll        s3, t3, a7
                  add        t6, s11, s1
                  slti       t5, t2, 840
                  c.slli     t0, 25
                  auipc      s6, 126636
                  rem        s11, t2, s8
                  csrrsi     t2, 0x340, 18
                  c.andi     a3, 9
                  add        a4, a7, a3
                  slli       a7, s1, 0
                  sll        tp, a7, gp
                  c.or       a5, a4
                  xori       s3, a4, 660
                  c.andi     a5, 20
                  c.li       s3, 17
                  rem        s3, t0, a4
                  add        gp, s1, a0
                  c.slli     ra, 8
                  sltu       t2, t2, s3
                  sra        gp, s9, zero
                  c.li       t3, -1
                  sltiu      a6, a3, -209
                  csrrw      a1, 0x340, s10
                  srl        a2, t4, a5
                  c.addi     s7, -1
                  lui        gp, 609356
                  xor        s1, t5, a0
                  divu       ra, s5, s2
                  c.slli     t6, 1
                  c.slli     s7, 12
                  mulhsu     s4, a6, s5
                  sltu       s0, a5, s10
                  c.mv       s10, s1
                  csrrc      s2, 0x340, t1
                  csrrwi     ra, 0x340, 24
                  andi       s3, tp, 172
                  slti       t1, tp, -751
                  srli       t0, gp, 10
                  c.sub      a3, s1
                  c.or       s0, a3
                  sltiu      s6, s2, -695
                  sub        tp, a5, a1
                  addi       s11, s5, 341
                  lui        tp, 21866
                  sll        s2, tp, s1
                  c.or       s0, a4
                  c.lui      t0, 11
                  csrrs      s4, 0x340, s10
                  c.srai     a4, 23
                  c.srli     a5, 25
                  remu       s11, t3, tp
                  c.addi     a5, 9
                  c.li       ra, -1
                  c.add      s7, t3
                  and        t3, s5, s7
                  srl        s2, s11, a0
                  c.sub      a4, a5
                  c.sub      a3, a1
                  or         a7, s4, t5
                  srai       t1, s8, 30
                  remu       s10, a7, t2
                  c.and      a1, a5
                  addi       s10, t0, -757
                  div        a5, a1, s2
                  c.or       s1, a3
                  sltiu      t1, a6, 653
                  c.xor      a5, a3
                  add        a5, zero, s3
                  mulhu      s11, a1, t6
                  c.srai     a3, 14
                  csrrwi     s1, 0x340, 1
                  c.andi     a4, -1
                  csrrs      a6, 0x340, s2
                  csrrci     s11, 0x340, 28
                  slti       gp, s4, -145
                  mulh       ra, gp, s11
                  c.add      s10, a0
                  c.nop
                  rem        a1, s1, t5
                  csrrwi     s9, 0x340, 4
                  xori       zero, a5, -719
                  andi       t5, sp, -116
                  c.addi     a2, 27
                  c.nop
                  c.mv       a1, t0
                  c.srai     a2, 2
                  c.slli     s4, 11
                  mulhsu     tp, s1, t5
                  add        ra, t6, a4
                  mulhu      a7, gp, s2
                  srl        a5, t2, gp
                  mulhu      s6, s6, zero
                  slli       t1, a3, 11
                  divu       a1, a2, s1
                  csrrw      ra, 0x340, t2
                  xor        a7, t2, sp
                  sltiu      t0, s10, -241
                  c.li       t0, 23
                  c.lui      a6, 8
                  c.addi     t3, 3
                  csrrw      gp, 0x340, a2
                  div        s6, a6, zero
                  c.nop
                  srai       s1, a6, 0
                  ori        t4, s5, 578
                  csrrwi     s11, 0x340, 5
                  mulh       s2, s10, t5
                  c.andi     s1, -1
                  c.slli     t1, 20
                  lui        s9, 708479
                  csrrc      tp, 0x340, sp
                  slti       s6, t2, 602
                  c.sub      s1, a0
                  c.addi     a1, 18
                  lui        t5, 575116
                  addi       t2, a7, -763
                  and        a3, s6, ra
                  c.sub      a1, s1
                  remu       s6, zero, s1
                  sra        ra, t5, a7
                  andi       s2, a5, 861
                  mulhsu     a4, sp, s2
                  srai       s3, a6, 2
                  mulhsu     s9, s2, t6
                  mulhu      a5, s1, a5
                  sub        a2, s2, s9
                  c.sub      a2, a0
                  xor        a2, s8, s6
                  andi       a6, a2, 423
                  addi       t6, t6, -125
                  andi       a6, a1, 158
                  nop
                  c.srai     a5, 2
                  addi       zero, t2, 226
                  sltiu      a3, a4, -442
                  nop
                  xor        a6, s0, t3
                  csrrsi     t4, 0x340, 1
                  nop
                  csrrwi     a7, 0x340, 23
                  andi       a3, t4, -405
                  csrrci     t2, 0x340, 3
                  srai       gp, sp, 28
                  c.lui      a1, 8
                  c.sub      a0, a5
                  add        a6, t5, a0
                  auipc      a2, 327927
                  slt        s7, a6, a0
                  and        t1, a3, s1
                  c.slli     a3, 5
                  and        t3, sp, t5
                  or         s7, t2, tp
                  mulhu      t5, a0, a6
                  c.andi     a0, 15
                  andi       t1, s5, 205
                  slli       s2, gp, 18
                  c.lui      s6, 19
                  c.or       s0, a0
                  c.andi     a4, -1
                  sltu       t6, s10, s5
                  xori       s0, t2, -76
                  sub        ra, a0, a4
                  addi       a0, s8, -715
                  csrrsi     s10, 0x340, 21
                  csrrw      a6, 0x340, sp
                  sra        t1, t0, a2
                  sra        a1, ra, zero
                  sub        t2, s3, gp
                  ori        t4, a4, 1000
                  add        t6, a3, sp
                  c.li       a4, -1
                  c.li       s9, -1
                  c.and      a5, s0
                  lui        s2, 707979
                  sub        s3, s9, s1
                  csrrsi     s3, 0x340, 2
                  ori        t6, a5, 396
                  csrrc      s7, 0x340, gp
                  auipc      s9, 414587
                  sub        s4, t4, s5
                  c.slli     s3, 27
                  xor        s9, s0, a7
                  c.xor      a0, a0
                  c.nop
                  srl        s0, a1, gp
                  slti       s0, t0, 595
                  c.or       a5, a2
                  mulhsu     t6, gp, s9
                  andi       s6, t1, -323
                  csrrs      a4, 0x340, tp
                  slti       gp, a2, 602
                  or         s3, s0, t0
                  c.and      a4, a2
                  c.addi     s2, -1
                  c.or       a3, a2
                  srai       a3, a1, 27
                  mulhsu     a6, a3, t2
                  c.add      s11, s5
                  csrrci     tp, 0x340, 8
                  c.and      a4, a3
                  csrrw      s9, 0x340, t4
                  ori        t6, t0, 655
                  sra        t0, ra, s3
                  c.andi     s0, -1
                  srai       a2, sp, 5
                  c.nop
                  mulhsu     s2, s3, t6
                  c.srli     s1, 27
                  sll        t2, t2, s0
                  xori       a0, gp, -582
                  nop
                  sra        a0, t0, tp
                  c.addi     s9, 11
                  c.add      s7, gp
                  c.lui      t5, 27
                  csrrw      s10, 0x340, t1
                  mulhsu     tp, s1, s2
                  div        t2, a0, s9
                  csrrw      s4, 0x340, a4
                  mulhsu     s11, t2, t6
                  sltiu      t4, s2, 494
                  sll        gp, ra, s9
                  slli       s6, t2, 2
                  nop
                  c.nop
                  slli       t3, gp, 2
                  auipc      a4, 689877
                  c.li       t0, -1
                  auipc      s0, 809144
                  csrrwi     t2, 0x340, 9
                  mulhu      a5, s2, zero
                  addi       gp, a3, 20
                  slt        t5, s9, t2
                  sub        a3, a3, t5
                  xori       a4, a3, 294
                  sra        a5, t0, zero
                  c.mv       a1, s1
                  c.and      s0, a4
                  auipc      t6, 175960
                  mulhsu     a5, a4, t6
                  sll        s2, s3, gp
                  xori       a2, a7, -439
                  srai       s7, s7, 26
                  slti       gp, s2, -222
                  sub        a6, s10, t4
                  divu       a2, a7, a7
                  andi       a2, t0, 391
                  csrrc      t4, 0x340, t0
                  ori        t0, t2, -429
                  add        t1, a1, s8
                  div        a6, s3, s2
                  srai       t0, t6, 18
                  csrrci     a7, 0x340, 1
                  sltu       s9, tp, t3
                  srli       ra, s1, 20
                  addi       s4, s11, -129
                  xor        zero, t4, tp
                  mulhsu     tp, a2, t3
                  c.xor      a4, a2
                  c.xor      a3, s1
                  c.add      t4, t0
                  sll        s1, sp, a4
                  mulhsu     a4, a6, sp
                  c.nop
                  sltiu      tp, t1, -507
                  mulh       s1, t5, a1
                  csrrci     a5, 0x340, 24
                  c.srli     a4, 7
                  ori        a7, s10, -573
                  csrrw      s1, 0x340, zero
                  mulhu      s3, a7, a2
                  lui        t0, 132235
                  srai       t1, t2, 3
                  csrrwi     a4, 0x340, 24
                  remu       t4, s0, t2
                  mulhsu     t6, s6, s9
                  divu       a7, t2, t4
                  csrrci     s10, 0x340, 7
                  remu       s3, t3, a6
                  xori       s4, t6, -149
                  srli       ra, a1, 18
                  addi       s4, ra, -716
                  csrrci     s0, 0x340, 30
                  div        t2, s1, ra
                  slt        ra, a7, t5
                  csrrci     a5, 0x340, 30
                  sltiu      s2, a0, -269
                  csrrwi     t6, 0x340, 3
                  srai       s11, s5, 30
                  c.mv       t5, a4
                  csrrsi     ra, 0x340, 29
                  mul        s11, zero, s3
                  csrrwi     a5, 0x340, 26
                  add        a2, s7, t0
                  csrrc      a7, 0x340, a3
                  and        t5, s10, s4
                  nop
                  c.li       s11, -1
                  divu       s3, t4, a7
                  c.xor      a2, a5
                  csrrwi     s7, 0x340, 31
                  xori       t4, a0, 588
                  slt        tp, a1, s8
                  sll        t5, s3, gp
                  auipc      ra, 363032
                  c.lui      gp, 29
                  sltu       tp, a4, t4
                  c.li       a5, 24
                  c.srli     a1, 25
                  mulhu      t3, s0, s0
                  csrrw      s10, 0x340, s10
                  mulh       t6, s7, s4
                  c.srli     s0, 8
                  sltiu      s6, tp, -275
                  remu       a0, t5, t3
                  divu       s9, gp, s2
                  csrrci     t2, 0x340, 6
                  addi       t5, a6, 779
                  c.addi     t5, 17
                  mul        a4, s8, s8
                  mulhu      s4, ra, s2
                  sub        a4, t2, s10
                  slti       s9, sp, -462
                  slti       s4, a6, 572
                  sll        a6, ra, ra
                  nop
                  sll        s1, t0, a3
                  rem        t2, a7, t3
                  lui        t0, 138002
                  divu       gp, t1, a3
                  srl        a2, t3, a5
                  addi       tp, a2, -2
                  and        s0, sp, t0
                  divu       t4, a6, zero
                  add        t6, t5, tp
                  ori        t3, s2, -402
                  remu       t1, s5, s7
                  rem        ra, s8, a2
                  c.li       tp, 21
                  csrrs      a6, 0x340, s9
                  srli       s4, a6, 31
                  c.slli     a5, 4
                  sll        a4, gp, s6
                  div        t5, ra, s6
                  div        t2, t6, t1
                  xor        s10, a0, s10
                  add        s4, s7, t3
                  slt        s1, s0, a3
                  sltiu      a6, t1, 366
                  and        t5, s10, s9
                  c.xor      a2, a5
                  srai       zero, sp, 7
                  sltu       s4, t2, a1
                  slti       t3, a4, 515
                  c.srai     s0, 1
                  lui        t0, 153989
                  mul        t6, s2, s3
                  c.sub      a5, s0
                  mul        a4, s9, s2
                  csrrsi     t0, 0x340, 21
                  andi       t6, a3, 598
                  or         a5, t1, t0
                  c.addi     s3, 5
                  sltiu      t0, s8, 265
                  c.sub      a0, a4
                  srli       s3, t4, 11
                  csrrsi     a4, 0x340, 13
                  c.andi     a1, 9
                  divu       s1, a2, s4
                  csrrs      zero, 0x340, s0
                  csrrc      gp, 0x340, s10
                  mulhsu     t2, s1, a3
                  ori        t6, a6, 544
                  srli       a6, s9, 1
                  csrrci     tp, 0x340, 5
                  slt        s1, tp, a0
                  mulhu      s3, s10, t0
                  c.srai     a1, 10
                  mul        s0, ra, t0
                  c.li       a7, 2
                  andi       a4, s0, 483
                  auipc      s3, 863730
                  csrrs      s4, 0x340, t0
                  remu       a6, s4, a2
                  csrrsi     s7, 0x340, 16
                  mulhsu     a4, s7, a3
                  andi       t1, gp, -622
                  sub        a1, a0, s10
                  ori        t5, a0, -141
                  srai       a0, t6, 30
                  c.srai     s1, 2
                  c.andi     a1, 18
                  c.andi     a3, -1
                  xor        a2, s11, a2
                  rem        s2, a2, tp
                  c.nop
                  csrrci     a6, 0x340, 7
                  c.andi     a1, 24
                  c.addi     s10, 12
                  xor        s2, s9, a4
                  c.nop
                  csrrs      s1, 0x340, s0
                  nop
                  sub        s2, s5, t2
                  mulhsu     t6, s11, t4
                  c.slli     t3, 2
                  remu       t6, a6, a6
                  c.srli     a0, 15
                  remu       a6, s0, a6
                  add        s1, s2, s7
                  c.srai     a3, 14
                  c.srai     a1, 29
                  c.lui      t1, 30
                  c.andi     a4, -1
                  c.li       a5, -1
                  c.lui      t1, 23
                  c.slli     a7, 18
                  slti       a0, a3, -581
                  rem        tp, s3, s10
                  sltu       s3, a7, a1
                  sub        s0, t5, a7
                  srli       s10, s1, 14
                  slt        t2, t6, s3
                  sub        a7, t6, t0
                  c.li       t2, -1
                  csrrc      s2, 0x340, t5
                  sltu       a1, t3, s10
                  srli       zero, ra, 17
                  c.srli     a4, 28
                  nop
                  c.srai     s1, 27
                  c.add      a7, s1
                  c.and      a0, a4
                  rem        s9, s4, a2
                  sll        s0, s6, s8
                  c.slli     s1, 28
                  xor        t4, a1, s0
                  mulhsu     a5, t0, tp
                  c.srli     a2, 24
                  c.xor      a0, a4
                  c.slli     t6, 8
                  c.srai     a0, 31
                  c.mv       a3, sp
                  nop
                  mulhu      t0, s2, s6
                  xor        s9, a6, s11
                  divu       t1, s10, t0
                  nop
                  lui        s9, 335800
                  addi       s9, sp, 358
                  c.nop
                  csrrs      a6, 0x340, t1
                  c.or       s1, a0
                  c.xor      a1, a2
                  c.slli     s10, 11
                  ori        a1, s0, 411
                  csrrs      a5, 0x340, s2
                  c.or       a5, a5
                  lui        s10, 109950
                  sub        s10, gp, s1
                  slt        a4, a7, a7
                  addi       t0, t1, 276
                  c.srai     a2, 7
                  nop
                  mul        t0, t1, ra
                  mulhu      a4, s9, zero
                  divu       a3, t6, s4
                  add        s3, t1, a0
                  mulhsu     s10, a0, t3
                  csrrsi     zero, 0x340, 27
                  c.li       a0, -1
                  csrrsi     t4, 0x340, 14
                  or         t2, a5, s3
                  c.nop
                  c.add      s7, a4
                  c.and      a4, a4
                  mulhsu     a2, s7, t3
                  srai       a1, t1, 17
                  csrrwi     t3, 0x340, 8
                  c.mv       a4, t0
                  mul        gp, t4, a4
                  c.mv       t0, a2
                  slli       gp, s7, 1
                  srai       s2, a0, 30
                  c.srli     s1, 5
                  c.xor      s1, a5
                  srai       ra, s7, 18
                  c.sub      a5, a0
                  c.mv       a1, a3
                  srai       s3, a7, 5
                  lui        s6, 597713
                  csrrs      a4, 0x340, s4
                  xor        tp, s11, a7
                  nop
                  remu       s10, s10, ra
                  c.addi     a4, -1
                  c.addi     a3, -1
                  csrrwi     gp, 0x340, 9
                  c.mv       t6, s0
                  and        t2, t1, s0
                  andi       t6, a0, -906
                  div        gp, gp, s7
                  mulhsu     t3, t2, tp
                  nop
                  or         gp, s4, s4
                  sltu       a5, s4, t6
                  c.and      a0, s1
                  c.nop
                  remu       s1, t2, sp
                  remu       a0, zero, ra
                  csrrw      t4, 0x340, a1
                  nop
                  or         ra, s0, gp
                  andi       a4, s7, -927
                  and        t0, s3, a6
                  c.srai     a3, 19
                  c.xor      a2, a5
                  xori       tp, a5, -50
                  divu       a2, s5, t1
                  sltu       t1, a0, a6
                  c.lui      t5, 26
                  slli       s3, t3, 27
                  srai       gp, s4, 15
                  or         a0, a7, s1
                  c.and      a5, a4
                  sub        s1, s6, s8
                  csrrc      s11, 0x340, sp
                  mulhsu     gp, t3, s0
                  c.andi     a2, -1
                  xori       gp, a7, -165
                  c.xor      a4, a4
                  slli       t4, a4, 0
                  add        a1, a5, a5
                  c.nop
                  or         a4, s4, gp
                  c.and      s0, a0
                  c.slli     a0, 16
                  sltiu      t5, t1, -711
                  c.li       s11, -1
                  mulhu      t1, t0, s2
                  c.slli     t5, 11
                  andi       a5, s4, -808
                  c.andi     s0, -1
                  remu       s10, a3, t5
                  c.li       t6, -1
                  andi       gp, zero, 55
                  csrrsi     s7, 0x340, 8
                  c.nop
                  c.mv       s2, s0
                  slt        s2, a6, a1
                  csrrsi     t4, 0x340, 19
                  mulhu      a6, t6, a4
                  c.lui      s6, 2
                  c.srli     a4, 13
                  c.mv       s1, a5
                  csrrw      gp, 0x340, s5
                  c.li       a5, 4
                  mulh       a2, a5, a2
                  srli       s0, t0, 1
                  sltiu      t5, t3, 432
                  slli       a5, a1, 13
                  csrrc      a3, 0x340, a2
                  nop
                  c.lui      t6, 7
                  c.andi     a0, -1
                  slt        s4, sp, t6
                  addi       gp, s4, 151
                  c.sub      a5, s1
                  c.addi     t1, -1
                  mulh       s0, t0, s8
                  csrrc      a6, 0x340, a7
                  csrrc      tp, 0x340, t5
                  or         s3, s4, a4
                  and        t1, t1, gp
                  sub        t3, s4, s1
                  nop
                  sra        a6, a5, a1
                  c.addi     s3, 7
                  mul        s2, tp, tp
                  c.lui      a6, 4
                  srai       a3, a3, 30
                  c.add      t4, a2
                  lui        t1, 956570
                  csrrsi     a3, 0x340, 4
                  c.andi     s1, -1
                  c.lui      s4, 31
                  mulhu      a3, a4, s3
                  xori       a6, t4, 622
                  slti       gp, s0, -170
                  sra        t0, t4, s1
                  xori       s4, t4, -655
                  and        s9, s11, t3
                  addi       a0, a4, -706
                  sltiu      s0, t0, 975
                  c.add      a7, s2
                  c.add      s2, a6
                  remu       tp, a0, zero
                  slti       s0, sp, -381
                  c.and      a0, a1
                  xori       t1, a4, -1014
                  c.xor      a3, a5
                  addi       s10, s8, 869
                  ori        t2, gp, 285
                  c.mv       a5, ra
                  and        t5, t5, s5
                  c.add      s1, s10
                  auipc      t2, 230853
                  sltiu      s0, t0, 787
                  csrrsi     t3, 0x340, 22
                  add        t6, t3, s7
                  csrrc      a6, 0x340, t4
                  xori       t2, t4, -64
                  rem        a4, gp, t2
                  mulh       s4, t3, s2
                  slli       t6, t5, 26
                  c.sub      s1, a5
                  slli       tp, t2, 1
                  c.nop
                  add        a1, a7, gp
                  mulhu      s9, s5, a7
                  c.lui      s6, 23
                  sra        s1, s0, a6
                  csrrci     t2, 0x340, 21
                  sltu       s10, s6, zero
                  csrrc      ra, 0x340, s0
                  add        s9, ra, zero
                  div        gp, sp, a3
                  c.addi     tp, 18
                  sltu       s3, a1, a0
                  c.srli     a1, 26
                  sra        a4, t2, s4
                  add        s11, tp, s3
                  divu       s4, tp, tp
                  csrrc      t2, 0x340, t5
                  c.mv       a7, t3
                  c.or       a5, a1
                  c.mv       s6, a1
                  addi       s11, s10, -511
                  xori       t6, t3, -517
                  csrrs      a6, 0x340, s9
                  and        s2, s10, t1
                  c.lui      s3, 19
                  xor        a2, s3, s2
                  sltu       s4, a1, s4
                  c.addi     t5, -1
                  nop
                  add        s0, a3, s4
                  c.lui      s2, 17
                  auipc      s0, 144517
                  ori        s1, ra, -154
                  c.nop
                  c.addi     a3, 13
                  c.mv       s0, a4
                  mul        t6, s10, a1
                  c.sub      s0, a3
                  sll        a5, ra, t6
                  slli       a7, t6, 15
                  remu       tp, s1, t5
                  c.sub      a3, s0
                  sltiu      t2, s11, -510
                  c.srai     s0, 20
                  c.li       t2, 21
                  srl        t6, s9, s11
                  c.sub      a3, s1
                  c.srai     s0, 30
                  c.and      a4, a4
                  sra        gp, t2, a5
                  andi       t6, a6, -838
                  c.lui      gp, 3
                  ori        t2, s10, -277
                  sltiu      a2, a5, -558
                  srl        s1, s4, t2
                  lui        t1, 239497
                  c.srli     a1, 19
                  addi       s11, t6, -280
                  sltiu      a2, s7, 681
                  addi       a3, a4, 198
                  csrrs      s7, 0x340, s6
                  srli       s6, s2, 19
                  sub        zero, sp, t5
                  csrrw      tp, 0x340, s7
                  c.lui      s7, 22
                  sra        gp, tp, t6
                  and        a3, t4, t3
                  or         s2, s9, s8
                  slti       a4, gp, 220
                  csrrsi     s6, 0x340, 29
                  andi       a7, s6, -81
                  or         a7, s0, s6
                  ori        s9, s1, -557
                  csrrsi     a1, 0x340, 5
                  sltu       s0, s8, s9
                  slti       t5, t2, -731
                  c.and      a5, a2
                  slt        a4, a6, gp
                  csrrc      tp, 0x340, a0
                  add        a1, a3, t3
                  c.nop
                  c.nop
                  sub        zero, a5, s3
                  c.nop
                  divu       zero, s11, s8
                  sltiu      s7, s7, 796
                  csrrs      s7, 0x340, t1
                  or         t2, a0, t0
                  slti       s7, s1, 461
                  c.add      t3, s3
                  c.addi     a7, 23
                  xori       t3, t4, 477
                  c.li       a6, -1
                  addi       t0, gp, -353
                  mulhsu     t4, s7, gp
                  ori        s7, t1, -691
                  srl        zero, s11, a5
                  c.mv       a3, a4
                  c.mv       t0, a0
                  sra        a0, a6, t4
                  sra        ra, a6, t2
                  c.nop
                  slti       ra, a7, -927
                  sltu       t5, s7, s9
                  or         a6, t4, sp
                  xori       a0, tp, -342
                  sltiu      s11, s2, 66
                  csrrc      s3, 0x340, s11
                  lui        a6, 640607
                  c.addi     a6, -1
                  mulhu      a5, a0, t6
                  slli       tp, s2, 13
                  slti       t6, a7, 813
                  add        t0, ra, s2
                  c.srai     a2, 26
                  c.addi     ra, -1
                  andi       a0, t3, 196
                  nop
                  srli       t0, a3, 2
                  andi       a3, s8, 344
                  csrrs      s4, 0x340, t1
                  csrrwi     a1, 0x340, 9
                  c.mv       a5, s9
                  sll        a5, s9, s11
                  c.sub      a4, a3
                  c.srai     a3, 2
                  csrrsi     s1, 0x340, 13
                  xor        t5, s1, s1
                  andi       a4, a3, 351
                  ori        s7, a0, 364
                  c.andi     a1, -1
                  c.or       a1, a1
                  c.and      a4, a0
                  sltiu      t6, zero, -553
                  c.sub      a5, s0
                  c.addi     s6, 13
                  c.and      s0, a1
                  c.xor      s0, a5
                  c.li       a6, -1
                  csrrwi     s2, 0x340, 22
                  mulhu      s2, s2, t2
                  sltiu      t1, a5, -644
                  srl        a4, a2, a0
                  div        t6, t6, s1
                  mulhu      s1, s8, s11
                  div        t6, s4, a4
                  csrrc      s6, 0x340, s0
                  c.xor      s1, s0
                  nop
                  remu       t4, s10, ra
                  c.lui      a6, 14
                  csrrw      t0, 0x340, a6
                  slti       s0, a6, -431
                  slli       t1, t6, 31
                  c.lui      ra, 26
                  csrrc      a7, 0x340, t2
                  rem        t1, a7, s7
                  c.li       t3, -1
                  addi       t6, a6, -942
                  csrrs      tp, 0x340, sp
                  srli       zero, t0, 31
                  csrrc      zero, 0x340, a1
                  c.lui      t0, 10
                  divu       s0, s3, zero
                  rem        s2, s1, a4
                  sra        a1, s1, zero
                  mulhsu     s10, zero, a2
                  csrrc      t4, 0x340, a1
                  c.nop
                  sub        s7, s8, zero
                  c.nop
                  c.addi     a0, 31
                  slli       a6, t5, 15
                  addi       t0, s6, -931
                  c.slli     t4, 9
                  or         a2, s3, s7
                  xori       tp, a0, -75
                  c.add      a2, s10
                  mulhsu     a3, s0, s3
                  slt        a4, s9, a2
                  srl        a4, t4, a6
                  sltu       t2, s8, a6
                  c.slli     t4, 11
                  lui        s3, 255091
                  mulhu      a3, a4, t1
                  csrrci     s4, 0x340, 18
                  andi       tp, s0, 82
                  sltiu      a2, s0, 274
                  srl        s6, s3, t4
                  sltu       s6, t0, s7
                  and        t2, ra, s6
                  srl        t5, a2, t2
                  nop
                  c.lui      a4, 18
                  addi       a4, a7, 380
                  c.nop
                  c.xor      a4, a0
                  csrrsi     s11, 0x340, 1
                  csrrwi     gp, 0x340, 23
                  sltu       zero, tp, a5
                  lui        a0, 446208
                  c.srai     s1, 17
                  c.srli     a3, 17
                  c.xor      a5, a1
                  add        s9, tp, tp
                  srai       a3, s9, 22
                  slt        a7, t4, sp
                  divu       s4, s7, gp
                  nop
                  xor        gp, s6, a1
                  xor        tp, zero, a0
                  add        a0, t5, a1
                  c.srai     a2, 23
                  sra        s4, s9, t6
                  div        a4, a5, s0
                  xori       gp, tp, 87
                  or         a3, gp, t2
                  csrrs      t1, 0x340, t3
                  or         tp, s6, a0
                  c.andi     a0, -1
                  add        t3, s0, s4
                  mulh       t6, s2, s3
                  sra        t3, s10, t6
                  sra        s11, a3, s1
                  c.or       s1, a4
                  c.slli     s4, 20
                  srli       a3, s5, 2
                  mul        s10, a5, s4
                  slti       s7, a0, 64
                  mulhsu     s4, t2, a7
                  rem        tp, s9, t3
                  divu       t3, s0, s10
                  csrrsi     s3, 0x340, 16
                  sub        t1, a2, s3
                  srli       s7, s1, 2
                  c.mv       t2, t5
                  lui        s10, 320292
                  sub        s4, s2, s11
                  c.andi     a2, 29
                  srai       a4, s4, 18
                  sll        t1, tp, s8
                  lui        t0, 695122
                  c.or       a3, a0
                  c.addi     a5, 27
                  sll        s4, s7, s11
                  csrrw      zero, 0x340, s11
                  mulhsu     s9, a3, gp
                  c.li       a3, -1
                  or         s9, a1, a6
                  srli       a1, s8, 31
                  srai       s2, a1, 27
                  c.srai     a2, 28
                  sltu       t4, a2, a1
                  and        s3, a4, a6
                  ori        gp, s9, -232
                  srli       s7, s4, 26
                  slt        s3, s2, a5
                  c.nop
                  srli       s2, sp, 31
                  rem        a5, a4, s6
                  csrrsi     s10, 0x340, 15
                  mulh       s11, s0, a3
                  andi       ra, sp, -697
                  sltu       s7, s0, s1
                  mul        tp, t2, zero
                  srl        s6, s10, gp
                  csrrw      t2, 0x340, a1
                  c.sub      a2, s0
                  ori        s6, s5, -487
                  srai       t6, s11, 20
                  andi       a1, s9, -587
                  slt        ra, s2, sp
                  auipc      a2, 716305
                  auipc      gp, 22342
                  xori       s4, a5, 880
                  csrrs      s4, 0x340, t5
                  c.sub      s0, a1
                  srl        t2, s11, a5
                  andi       t3, t0, -996
                  mulhu      a7, ra, s4
                  mulh       t3, a0, s4
                  csrrc      t1, 0x340, s3
                  c.or       a5, a0
                  addi       s10, a0, -666
                  mulhu      s7, gp, s6
                  c.slli     s7, 23
                  slt        zero, s0, a4
                  csrrsi     a6, 0x340, 12
                  csrrc      s1, 0x340, a0
                  c.mv       s1, s10
                  csrrs      tp, 0x340, t1
                  slti       s2, tp, -224
                  c.addi     t5, -1
                  csrrw      t5, 0x340, s3
                  c.srai     a3, 19
                  csrrs      s1, 0x340, s4
                  c.slli     s11, 9
                  mulhsu     tp, a1, t2
                  sll        s11, s10, t0
                  c.nop
                  csrrci     a6, 0x340, 8
                  addi       a6, gp, -862
                  xor        a1, ra, s8
                  c.and      s0, s0
                  slt        gp, s7, tp
                  and        s3, gp, t1
                  c.lui      a4, 24
                  c.lui      t3, 23
                  sra        tp, sp, sp
                  srli       a5, a2, 13
                  c.mv       ra, s10
                  c.xor      a5, a0
                  slti       t2, t0, -172
                  remu       a7, t5, s6
                  csrrs      a7, 0x340, t3
                  add        a0, a0, t1
                  csrrsi     a6, 0x340, 18
                  sltiu      a7, sp, -48
                  sub        s1, t6, t6
                  andi       gp, s10, 404
                  div        s9, zero, t6
                  c.andi     s1, -1
                  mulhu      a1, a0, gp
                  addi       a1, a0, 804
                  c.sub      a4, a4
                  add        s4, a0, a3
                  mulh       s0, zero, a0
                  c.or       a2, a2
                  c.andi     s0, -1
                  c.lui      a2, 30
                  c.add      t3, t0
                  and        a6, s11, s3
                  divu       a5, s6, s11
                  c.srli     a2, 29
                  sltiu      a3, a5, -654
                  c.srli     a2, 23
                  c.or       s1, s0
                  sub        s2, zero, s9
                  slti       a5, ra, 753
                  sltu       s6, s10, a4
                  xori       s6, s8, 149
                  mul        a0, t3, ra
                  csrrsi     gp, 0x340, 2
                  c.lui      a0, 26
                  or         a0, t6, s3
                  c.srai     a3, 13
                  c.nop
                  slli       gp, s10, 23
                  div        t6, s9, s10
                  nop
                  c.or       a4, a5
                  sltu       t4, t3, s8
                  andi       t1, ra, 637
                  mulh       t2, s2, t1
                  sra        s4, a2, s3
                  csrrw      s9, 0x340, zero
                  remu       t3, s5, s9
                  c.sub      a3, a3
                  c.nop
                  c.andi     a5, 1
                  c.mv       s0, s1
                  c.andi     s1, 17
                  c.andi     a1, 8
                  sra        t6, t4, t3
                  c.srli     a5, 30
                  c.addi     t6, -1
                  remu       t3, s5, a0
                  lui        t4, 944339
                  nop
                  c.li       a1, 4
                  sub        s9, s2, s10
                  and        a2, s11, sp
                  slti       s11, t3, 828
                  c.andi     a0, 10
                  remu       t4, s8, t3
                  sltu       s7, a5, s7
                  and        t3, t0, s7
                  c.andi     a3, -1
                  nop
                  srai       a4, sp, 2
                  srl        s10, a2, t3
                  divu       t5, s9, s10
                  srai       a2, gp, 8
                  c.nop
                  xori       t3, s7, -65
                  sub        a1, s2, t1
                  c.add      a5, a0
                  slli       a6, s5, 26
                  c.srli     a2, 4
                  c.li       s7, 16
                  c.add      s2, a1
                  sra        s2, a4, a2
                  lui        s6, 612319
                  c.srli     s1, 7
                  and        a2, sp, ra
                  c.xor      a5, a0
                  mulh       zero, s5, s10
                  sll        s7, t1, t3
                  c.and      a2, a4
                  c.and      a1, a3
                  slli       a3, a3, 28
                  sra        tp, t1, t1
                  ori        t2, a3, -347
                  c.and      s0, a0
                  sll        t2, a1, s2
                  c.nop
                  csrrc      t0, 0x340, s7
                  csrrwi     t2, 0x340, 10
                  sltiu      zero, gp, -581
                  c.li       a2, -1
                  remu       s4, a4, a4
                  nop
                  sll        s11, s7, s3
                  c.srai     a3, 3
                  srai       t2, s0, 21
                  c.mv       gp, t4
                  mulhsu     a4, a2, t3
                  addi       s11, s1, 265
                  auipc      s9, 965356
                  nop
                  rem        s11, zero, s8
                  add        s4, t4, a7
                  csrrci     gp, 0x340, 25
                  ori        s1, t3, 283
                  mul        a2, gp, zero
                  div        t2, a4, a0
                  csrrsi     t2, 0x340, 16
                  mulhsu     s10, t1, a1
                  mulhu      tp, sp, t5
                  mulhsu     s6, a5, t4
                  rem        s4, a4, t2
                  c.mv       t4, t3
                  andi       a4, t3, -412
                  csrrci     a7, 0x340, 30
                  mulhsu     a2, a5, s6
                  c.slli     a7, 20
                  divu       t4, s2, s11
                  andi       ra, s11, -779
                  sra        zero, tp, s9
                  csrrci     s0, 0x340, 9
                  c.srai     s0, 8
                  csrrci     t0, 0x340, 15
                  mul        s2, a3, t2
                  csrrsi     ra, 0x340, 31
                  or         s1, t2, a6
                  c.sub      s0, a3
                  c.andi     a3, 16
                  andi       a2, s11, -833
                  slti       a4, a5, -774
                  mul        s2, s0, s2
                  c.and      a4, a4
                  c.mv       a3, s10
                  sltu       s4, a2, t5
                  c.or       a4, a0
                  c.add      s9, s6
                  csrrw      s0, 0x340, s7
                  slti       s4, s8, 751
                  nop
                  c.andi     a2, 24
                  c.and      a4, s1
                  c.xor      a0, a4
                  srl        t1, t0, a1
                  addi       s11, s1, 577
                  mulhsu     t3, s10, tp
                  srl        tp, t5, a7
                  mulh       s11, a2, gp
                  c.srli     a4, 22
                  slti       s0, s6, -548
                  lui        a5, 860426
                  sub        a1, a6, a1
                  slti       a4, a6, -877
                  csrrsi     t5, 0x340, 18
                  slti       s7, s6, -875
                  sll        a7, gp, a5
                  lui        s6, 1037130
                  csrrs      s2, 0x340, t1
                  c.li       t2, -1
                  c.srli     a2, 25
                  srai       s2, sp, 11
                  lui        a2, 442456
                  auipc      gp, 426034
                  sltu       t5, t4, t2
                  sub        t3, s2, s0
                  lui        a4, 493752
                  c.andi     a5, 6
                  andi       t6, s1, -269
                  c.add      s1, ra
                  lui        t4, 609381
                  sltu       a3, s6, t0
                  sltiu      s0, sp, -701
                  rem        t1, s5, s6
                  csrrs      t2, 0x340, s4
                  addi       s2, s8, 563
                  c.or       a5, a0
                  sll        tp, a1, s2
                  mulhu      t6, t1, s7
                  c.li       s4, 13
                  mulhu      t5, t5, a3
                  csrrci     s1, 0x340, 9
                  xor        tp, s3, s3
                  c.sub      a4, s1
                  c.xor      a4, a0
                  srl        s6, a5, a2
                  c.add      s9, ra
                  csrrsi     t1, 0x340, 14
                  sll        s11, a3, t3
                  sltu       t4, gp, t2
                  c.slli     a0, 22
                  addi       a5, t6, 754
                  mulhu      tp, t1, a1
                  add        s10, a0, t0
                  srai       tp, t2, 20
                  c.or       a1, a4
                  csrrc      t4, 0x340, a1
                  csrrw      s7, 0x340, t5
                  mulhsu     a0, a2, s1
                  remu       s1, t5, s10
                  mulhsu     t0, s1, zero
                  csrrci     a6, 0x340, 25
                  ori        ra, tp, 429
                  addi       tp, t0, -549
                  c.slli     ra, 19
                  andi       a2, t5, -12
                  mul        s9, s5, t1
                  c.li       t0, 17
                  auipc      s6, 765147
                  slti       a0, s11, 49
                  divu       s2, t4, a7
                  xori       zero, t4, 512
                  or         gp, t6, s6
                  c.li       a2, 21
                  c.sub      a2, a4
                  mulhu      tp, s10, t2
                  div        s7, a4, a3
                  csrrwi     gp, 0x340, 26
                  addi       s11, t0, -279
                  sll        a0, s10, a7
                  divu       s6, s6, s0
                  srli       t5, s2, 0
                  div        s3, t0, s3
                  c.sub      a4, a1
                  sra        a3, s0, s10
                  srl        gp, t0, a1
                  mulh       tp, zero, tp
                  c.nop
                  c.slli     gp, 18
                  add        t6, a2, t0
                  csrrs      tp, 0x340, s7
                  mulhsu     t4, s0, zero
                  c.add      a2, s5
                  c.li       a3, 12
                  c.lui      t0, 13
                  sltu       s3, a2, s4
                  or         a5, a1, s5
                  csrrw      s3, 0x340, a1
                  srli       a3, t2, 31
                  sra        a0, sp, sp
                  srl        a3, zero, t2
                  c.addi     s0, 18
                  sltu       zero, t0, a5
                  c.add      t0, s6
                  c.srli     a2, 25
                  xori       a3, gp, -30
                  c.lui      a1, 28
                  mulhu      a2, s9, t4
                  sltu       a3, ra, t2
                  c.li       a7, 2
                  c.add      ra, t5
                  c.sub      s0, a3
                  slti       a7, s1, -152
                  c.slli     ra, 3
                  c.and      a4, a1
                  mulh       s4, a5, zero
                  lui        t6, 946224
                  sll        s10, s9, s5
                  divu       s9, s6, zero
                  auipc      a6, 698400
                  mulhsu     a6, t4, s10
                  c.sub      a0, a0
                  c.xor      a1, s0
                  remu       s10, s3, s3
                  csrrs      t1, 0x340, ra
                  slli       t3, s8, 6
                  divu       t6, tp, a5
                  sll        t0, a4, s1
                  xori       s1, s10, -435
                  srl        a0, a4, s8
                  csrrwi     s1, 0x340, 12
                  srai       a2, a0, 10
                  mulh       t3, s4, a1
                  c.add      a2, a0
                  sltiu      t3, t2, 442
                  c.lui      a6, 3
                  xori       t4, s0, 585
                  add        a7, sp, gp
                  c.srli     a2, 23
                  c.sub      a0, s1
                  mulhsu     t1, t1, t5
                  mul        t5, sp, t2
                  mulhu      s10, gp, s9
                  remu       t0, s1, s4
                  divu       a7, s0, tp
                  auipc      t6, 788369
                  csrrw      a4, 0x340, s7
                  csrrci     zero, 0x340, 26
                  c.andi     a2, -1
                  slt        a4, s4, s0
                  csrrc      a7, 0x340, t4
                  mulh       a0, s0, t6
                  add        t0, s11, a2
                  add        s3, s2, t3
                  csrrsi     t0, 0x340, 16
                  slli       t2, t0, 23
                  sltiu      s2, s1, 200
                  mulhu      t1, t1, s10
                  c.sub      a2, s1
                  c.xor      s0, s0
                  slt        s7, t4, t5
                  xor        s0, a0, a1
                  sub        t4, a1, gp
                  slt        ra, s7, s3
                  remu       a1, t4, t6
                  c.srli     a1, 29
                  c.nop
                  c.lui      t2, 25
                  lui        a2, 603439
                  csrrci     s1, 0x340, 10
                  sltiu      s10, a0, -10
                  lui        t0, 982203
                  mulhsu     t1, a2, s6
                  c.slli     s1, 26
                  mulh       t6, s1, zero
                  c.lui      s4, 26
                  c.nop
                  ori        t4, s10, 121
                  csrrwi     gp, 0x340, 28
                  remu       s3, a2, s0
                  sll        ra, t4, a7
                  c.slli     ra, 9
                  sra        tp, a7, sp
                  slti       s9, s6, -672
                  or         a7, s3, s2
                  c.xor      a0, a0
                  c.addi     s6, -1
                  sltu       a5, t2, a5
                  andi       s9, s9, -77
                  mul        s1, sp, s8
                  c.andi     a2, -1
                  and        t3, zero, s6
                  c.addi     gp, -1
                  andi       tp, t1, 492
                  c.sub      s0, a5
                  mul        t6, s8, s0
                  c.li       s3, -1
                  srli       t4, t0, 28
                  divu       t3, sp, s4
                  lui        s0, 478461
                  xori       s9, t1, 246
                  c.lui      gp, 4
                  c.slli     s9, 15
                  divu       a0, t1, s10
                  sra        s4, s8, t4
                  srai       t0, zero, 22
                  mul        ra, a5, a5
                  c.mv       s6, s6
                  sll        a0, t1, s11
                  div        ra, t3, sp
                  c.sub      s0, a1
                  auipc      zero, 1046301
                  c.or       a5, s1
                  sra        s11, s11, t5
                  c.srai     a3, 20
                  c.andi     s1, -1
                  nop
                  sub        t2, s11, t6
                  srli       s11, zero, 6
                  csrrsi     gp, 0x340, 7
                  xori       s11, s3, 715
                  csrrwi     a4, 0x340, 23
                  srai       tp, ra, 13
                  slli       a2, a2, 9
                  csrrwi     a6, 0x340, 24
                  slti       zero, sp, -713
                  slli       s7, s10, 25
                  slt        s10, t0, sp
                  divu       a1, t6, s3
                  csrrw      t4, 0x340, tp
                  mulh       t3, t2, ra
                  srli       ra, s5, 14
                  sltiu      s6, s8, -58
                  mulh       a7, t2, ra
                  sll        tp, s8, a4
                  sll        ra, ra, s6
                  csrrwi     a6, 0x340, 22
                  addi       a2, a0, 350
                  c.lui      a1, 24
                  slt        t2, s10, s1
                  mul        s7, a4, gp
                  c.nop
                  c.add      ra, s2
                  csrrw      s0, 0x340, s6
                  xori       s2, a5, 424
                  nop
                  csrrc      s2, 0x340, t5
                  c.add      s1, s4
                  sra        gp, a5, s3
                  csrrc      t4, 0x340, a3
                  srli       s9, a7, 13
                  c.srli     a1, 10
                  nop
                  c.lui      a2, 28
                  mulh       s0, a6, t4
                  andi       s2, zero, 777
                  auipc      a0, 897862
                  c.sub      a2, a5
                  c.mv       a4, s5
                  csrrsi     t3, 0x340, 17
                  csrrwi     a5, 0x340, 28
                  slt        t2, s3, s4
                  csrrci     s10, 0x340, 31
                  c.sub      a4, a0
                  mulh       a1, s11, t4
                  csrrwi     ra, 0x340, 11
                  srai       t6, t0, 27
                  sltiu      a4, s1, 816
                  c.add      ra, a4
                  c.li       s0, -1
                  c.xor      a0, a4
                  c.andi     s0, 0
                  c.li       a7, 12
                  c.and      a1, a3
                  xori       s9, s5, -885
                  lui        s3, 32392
                  csrrsi     t6, 0x340, 9
                  addi       a1, a1, 297
                  c.addi     s2, 27
                  csrrw      t1, 0x340, t0
                  add        ra, ra, t0
                  sltu       a5, s1, s4
                  c.addi     t4, -1
                  c.addi     s10, 14
                  c.nop
                  c.lui      s10, 7
                  mulhu      t6, s9, ra
                  srl        s6, s3, s11
                  slli       t2, s4, 24
                  lui        s3, 815221
                  c.nop
                  srli       s7, zero, 31
                  add        s0, t0, a4
                  c.nop
                  addi       a0, t5, 490
                  csrrs      a7, 0x340, s2
                  slli       s6, t3, 24
                  srai       a5, s6, 1
                  slti       a0, t6, -409
                  ori        t5, a3, 450
                  auipc      ra, 644623
                  csrrwi     gp, 0x340, 11
                  csrrwi     s1, 0x340, 27
                  rem        a3, s7, s11
                  c.sub      a3, a3
                  and        a7, s8, ra
                  sra        t3, a5, s1
                  add        a7, s4, s10
                  c.sub      s0, a4
                  csrrci     t5, 0x340, 18
                  add        gp, a1, t1
                  srai       s4, s3, 1
                  c.srli     a5, 8
                  c.nop
                  csrrsi     s2, 0x340, 10
                  c.or       a1, a3
                  div        a3, ra, s1
                  addi       tp, t3, -590
                  mulhu      s10, a4, s8
                  c.lui      t4, 24
                  srai       a5, s3, 31
                  srai       a1, gp, 6
                  slt        s3, a2, ra
                  slti       s9, t5, 576
                  c.li       s11, 10
                  c.and      a5, a4
                  c.srai     s0, 9
                  sltu       zero, s8, sp
                  c.lui      t0, 19
                  addi       t3, s11, 442
                  c.srli     a4, 26
                  and        a2, gp, t5
                  sll        a5, s10, s9
                  c.xor      s0, a3
                  c.li       s10, 14
                  mul        s7, s8, s3
                  c.andi     a5, 8
                  c.lui      t0, 1
                  ori        s1, tp, 547
                  c.li       ra, 3
                  lui        ra, 454733
                  mulhsu     a5, s3, s0
                  sub        a5, a1, s2
                  c.srli     a2, 19
                  c.or       a5, a4
                  c.nop
                  c.xor      s0, a3
                  c.li       ra, 1
                  srli       a1, a0, 11
                  c.add      s10, t2
                  mulhu      gp, s11, a4
                  ori        s6, s9, 789
                  andi       s0, s8, 119
                  div        a2, s0, t3
                  xori       s2, gp, 499
                  srli       s2, s6, 15
                  divu       a7, zero, t4
                  addi       a3, t5, -689
                  srai       tp, s7, 22
                  sra        t0, s1, s0
                  sra        s4, a1, s6
                  c.addi     a4, 13
                  c.li       a4, 31
                  c.or       s1, s1
                  and        t4, t4, s1
                  sltu       s6, t4, tp
                  c.xor      s0, a4
                  rem        a2, s6, a2
                  c.addi     s6, 2
                  c.addi     s1, -1
                  remu       a2, s0, a0
                  sra        zero, a3, s0
                  nop
                  sll        s10, s3, s3
                  c.andi     a0, -1
                  sltu       zero, gp, t1
                  csrrw      t3, 0x340, s5
                  slti       t0, t3, 311
                  csrrs      t3, 0x340, a2
                  mul        t4, a6, a7
                  c.slli     a3, 2
                  srli       s10, s9, 12
                  slli       t4, s6, 23
                  c.nop
                  sltiu      t5, t2, 774
                  sub        s4, t0, a7
                  csrrc      a1, 0x340, s0
                  csrrwi     a6, 0x340, 4
                  sltiu      s2, s8, 324
                  mul        s4, s2, gp
                  divu       t6, s5, s11
                  mulhu      a7, s2, t2
                  sra        t0, t5, s6
                  c.srai     s1, 2
                  andi       ra, t6, -327
                  sltu       gp, t6, ra
                  csrrw      t2, 0x340, a5
                  mulhsu     t1, sp, a0
                  sub        t3, t1, s5
                  slli       tp, a0, 8
                  csrrwi     a5, 0x340, 6
                  sub        t4, s6, s7
                  c.addi     t1, -1
                  nop
                  lui        a2, 562710
                  c.lui      t3, 19
                  div        zero, s11, s3
                  addi       t2, s3, -224
                  c.addi     t4, -1
                  csrrc      a6, 0x340, s2
                  mulhsu     a3, a0, ra
                  sltiu      t2, a6, -329
                  slt        a7, s2, a4
                  sll        s2, s7, t6
                  c.lui      a4, 26
                  c.srli     a0, 11
                  c.srli     a3, 19
                  c.add      s11, s7
                  ori        t4, t2, -40
                  c.slli     a5, 6
                  remu       s11, s5, s5
                  c.xor      a4, a5
                  c.lui      s0, 18
                  sltiu      s6, a1, 737
                  csrrsi     s2, 0x340, 25
                  c.sub      s1, a2
                  ori        ra, t6, -684
                  slli       gp, s11, 16
                  and        t3, t5, tp
                  csrrc      t1, 0x340, t0
                  slli       t3, a6, 27
                  slt        a5, t1, t1
                  srai       zero, a6, 27
                  mulhu      a0, a3, t2
                  csrrc      t2, 0x340, gp
                  srl        s11, a1, t3
                  ori        a2, sp, -872
                  c.xor      a2, s1
                  srl        zero, a2, sp
                  lui        s7, 42861
                  csrrwi     s0, 0x340, 6
                  c.lui      s11, 5
                  lui        a1, 451079
                  c.addi     a6, -1
                  c.srai     a5, 1
                  c.nop
                  lui        s7, 738504
                  c.srai     a5, 24
                  div        a4, t4, s7
                  csrrwi     s10, 0x340, 11
                  sltu       a4, a7, s8
                  csrrci     s3, 0x340, 6
                  csrrci     a7, 0x340, 19
                  c.li       s6, 2
                  andi       t5, s8, -991
                  mul        a4, s8, s5
                  slt        t4, s0, gp
                  sll        s10, s0, s10
                  slti       a1, s10, -971
                  mul        s3, s10, t2
                  sub        a6, gp, t0
                  srli       gp, t6, 8
                  mulhu      a0, ra, tp
                  addi       t4, t0, 237
                  rem        t2, a1, s11
                  mulh       a3, a0, a1
                  rem        a7, t4, a7
                  rem        a4, s8, s9
                  c.mv       t1, ra
                  csrrsi     t0, 0x340, 15
                  divu       s2, s7, a5
                  srai       s7, t1, 1
                  csrrsi     a0, 0x340, 2
                  mulhu      a3, s2, s7
                  andi       s9, s10, -385
                  csrrc      a2, 0x340, a2
                  addi       s10, a7, -20
                  csrrs      tp, 0x340, t5
                  c.addi     t5, 14
                  c.and      s1, s0
                  srli       a3, s2, 29
                  c.or       a3, a5
                  csrrw      s10, 0x340, s11
                  sub        a5, s6, a6
                  srl        s1, s10, s10
                  srai       s10, gp, 23
                  addi       t4, s4, -631
                  srai       gp, s2, 13
                  sltu       t1, s6, s8
                  mul        gp, s7, zero
                  c.and      a3, a2
                  mulh       s2, a1, t5
                  c.nop
                  sub        s10, a7, t0
                  srl        a0, t0, t0
                  c.lui      t4, 26
                  mul        t0, t5, t1
                  ori        a5, s3, -628
                  ori        s11, a0, 753
                  csrrwi     s2, 0x340, 23
                  divu       t3, s3, a0
                  slti       t4, s11, -103
                  c.andi     a5, 9
                  mulhsu     a6, s7, s3
                  srli       t0, s11, 29
                  slti       s4, t2, -253
                  nop
                  lui        a1, 935685
                  sltu       t6, a2, s5
                  mul        t3, s11, zero
                  c.addi     s0, 26
                  add        gp, t4, s0
                  c.and      a0, a3
                  c.xor      s0, a5
                  c.nop
                  slli       gp, a7, 17
                  div        s7, a5, s5
                  csrrsi     a0, 0x340, 2
                  csrrc      ra, 0x340, zero
                  sltiu      s1, a3, 902
                  rem        s0, s1, s0
                  nop
                  csrrsi     a2, 0x340, 0
                  srli       t2, tp, 6
                  c.and      s0, s1
                  andi       a2, t0, 632
                  mulh       tp, s10, a6
                  rem        t3, ra, t1
                  auipc      t0, 601099
                  csrrsi     s4, 0x340, 5
                  c.xor      a2, a3
                  csrrci     s10, 0x340, 17
                  slt        s2, s6, gp
                  mulhsu     a2, s2, t3
                  sll        t0, s4, t5
                  c.li       a5, -1
                  csrrwi     t4, 0x340, 2
                  sra        t5, a4, a6
                  slli       t1, s4, 12
                  nop
                  csrrsi     a4, 0x340, 31
                  sub        gp, s3, s3
                  mulhsu     ra, zero, a6
                  c.and      a2, a4
                  sub        s4, s11, t0
                  nop
                  add        tp, t3, s3
                  xor        gp, tp, a1
                  c.sub      a0, a5
                  nop
                  srli       s1, s0, 16
                  srli       s6, t4, 5
                  c.mv       gp, ra
                  c.mv       a2, s2
                  or         a7, gp, t6
                  remu       a5, s5, s7
                  csrrw      t5, 0x340, a6
                  c.and      a4, a3
                  xori       s7, a4, -190
                  c.sub      s0, a1
                  csrrsi     zero, 0x340, 18
                  csrrwi     s7, 0x340, 8
                  c.or       a0, a4
                  c.srli     s0, 5
                  c.xor      a2, a2
                  c.xor      s1, s0
                  sub        s11, a7, s9
                  c.srli     a1, 31
                  c.addi     t1, 4
                  sub        ra, sp, t3
                  csrrw      s11, 0x340, a4
                  c.srai     a0, 1
                  divu       a3, sp, s4
                  c.srai     a0, 11
                  csrrsi     a6, 0x340, 1
                  csrrsi     t4, 0x340, 5
                  c.lui      a0, 4
                  c.andi     a5, -1
                  srai       s3, a5, 31
                  rem        t5, t1, s9
                  c.add      a5, ra
                  rem        t0, s5, t6
                  nop
                  csrrwi     a1, 0x340, 14
                  divu       a3, s0, a1
                  srli       s3, s5, 1
                  sltu       s0, a3, a5
                  slli       a1, ra, 15
                  addi       t6, t6, -375
                  csrrs      s3, 0x340, gp
                  slli       a6, ra, 13
                  sltu       t5, a5, sp
                  csrrc      t1, 0x340, a1
                  sltiu      t6, t6, 714
                  mul        t3, a5, ra
                  mulhu      a5, a1, a5
                  csrrwi     t3, 0x340, 26
                  ori        a1, s7, 41
                  c.li       a4, -1
                  mul        gp, a1, s7
                  c.xor      a4, a3
                  c.nop
                  c.lui      t2, 6
                  mulhu      s11, s11, t5
                  remu       a0, ra, a4
                  c.slli     s10, 25
                  sltiu      a1, zero, 363
                  sra        a4, zero, t3
                  c.andi     a1, 16
                  c.andi     a2, -1
                  sltu       a1, a2, t5
                  mulhu      ra, s7, s10
                  c.add      a7, t0
                  sub        a2, s3, s9
                  c.addi     a3, -1
                  xor        a4, a1, a3
                  remu       s4, s2, t0
                  slti       a5, s8, -50
                  c.li       s11, 11
                  slli       zero, t5, 6
                  csrrsi     a4, 0x340, 23
                  mul        s3, tp, a2
                  c.lui      s2, 30
                  csrrsi     t1, 0x340, 3
                  sltiu      t2, s1, 689
                  csrrwi     t2, 0x340, 20
                  csrrwi     s7, 0x340, 24
                  rem        s0, s7, s7
                  div        s6, a0, t4
                  sll        ra, s6, s8
                  csrrsi     s4, 0x340, 22
                  mulh       s0, t6, sp
                  c.or       a2, s1
                  auipc      s6, 120605
                  slti       a0, a0, -509
                  nop
                  mulhu      t5, s9, a2
                  mulhu      a6, s11, s7
                  c.mv       t4, s2
                  and        s9, s1, a1
                  sub        a2, t0, a7
                  or         a7, gp, s8
                  lui        a5, 840519
                  c.srai     s0, 17
                  c.or       a0, a4
                  slli       s1, a0, 26
                  sub        s11, t3, a5
                  csrrwi     a1, 0x340, 31
                  srai       a5, a4, 7
                  c.andi     a1, -1
                  csrrs      ra, 0x340, t2
                  c.xor      s0, a0
                  c.srai     a3, 15
                  div        a6, s7, a4
                  mulhu      a1, gp, a2
                  addi       s7, sp, 679
                  sra        a2, s9, t4
                  csrrwi     s0, 0x340, 5
                  c.nop
                  xor        a1, a7, s1
                  xor        s3, t3, s11
                  addi       t6, a1, -180
                  c.andi     a5, 20
                  c.srai     a1, 30
                  c.srai     a5, 9
                  mul        tp, gp, a2
                  rem        s0, gp, s11
                  nop
                  csrrs      s7, 0x340, t3
                  auipc      t2, 937934
                  srai       t6, t0, 22
                  rem        zero, tp, t0
                  csrrs      tp, 0x340, s5
                  c.andi     a3, 11
                  lui        t5, 918517
                  csrrci     a2, 0x340, 31
                  rem        s3, t6, tp
                  c.mv       s7, s5
                  csrrci     a4, 0x340, 31
                  srai       t0, t4, 6
                  csrrc      a0, 0x340, s10
                  srli       a3, s8, 18
                  remu       t1, a4, t1
                  sub        ra, s0, s0
                  srli       s10, a7, 14
                  c.srai     a5, 26
                  slli       ra, t0, 15
                  and        s10, sp, s3
                  csrrsi     ra, 0x340, 16
                  sltiu      t5, s6, 366
                  c.li       s1, -1
                  srli       t5, a7, 14
                  remu       t2, a4, tp
                  csrrci     t1, 0x340, 16
                  and        tp, t5, s8
                  add        s10, s4, gp
                  div        a1, a4, gp
                  rem        a4, tp, t4
                  mul        a2, ra, t0
                  divu       ra, s8, s10
                  srai       t1, s5, 10
                  slti       a6, s7, 325
                  csrrs      a3, 0x340, s7
                  c.srai     s1, 4
                  mulh       s7, zero, a7
                  c.sub      a4, a0
                  div        a7, s6, a1
                  csrrwi     s4, 0x340, 8
                  and        a4, t5, s2
                  auipc      s1, 275404
                  or         s11, t5, t6
                  xori       a4, s8, -859
                  c.andi     a4, 16
                  c.andi     a0, 8
                  add        s0, t5, t4
                  add        a3, a5, s7
                  csrrwi     s4, 0x340, 12
                  c.mv       ra, s3
                  rem        s0, t3, s4
                  c.mv       a3, s10
                  mulhsu     tp, t5, tp
                  csrrsi     t1, 0x340, 30
                  sltu       s7, s2, ra
                  sll        a0, s8, s5
                  c.addi     a2, -1
                  rem        s11, s10, s0
                  csrrsi     s3, 0x340, 25
                  mulhu      a2, t4, s11
                  sra        a2, a1, sp
                  lui        zero, 25974
                  c.nop
                  c.add      a5, s5
                  sra        a1, s1, a3
                  csrrw      a7, 0x340, zero
                  or         s7, t2, s3
                  mulhu      zero, t5, s7
                  mulhsu     a6, sp, a2
                  nop
                  mul        a6, a3, t3
                  remu       s10, s5, a0
                  lui        s11, 910509
                  add        t6, a6, tp
                  c.srli     a4, 27
                  sub        ra, s3, s8
                  csrrwi     a0, 0x340, 19
                  csrrci     s2, 0x340, 5
                  sll        s11, t4, s9
                  c.srli     s1, 1
                  c.addi     t1, 28
                  csrrw      s1, 0x340, a7
                  c.or       a5, a5
                  sltiu      s2, s4, -350
                  mul        s1, a0, t0
                  csrrci     s9, 0x340, 19
                  mul        t4, t1, a2
                  csrrci     t0, 0x340, 9
                  c.lui      a0, 2
                  nop
                  mul        s10, s0, s5
                  sub        ra, a3, t2
                  c.lui      a7, 4
                  c.slli     s9, 16
                  divu       gp, ra, s5
                  csrrwi     a2, 0x340, 20
                  div        s11, a3, s6
                  sra        s4, s3, s0
                  c.xor      a5, a2
                  slt        s7, a6, a4
                  csrrsi     s11, 0x340, 9
                  c.or       s0, a1
                  c.slli     s10, 25
                  c.mv       a4, a5
                  c.srli     s0, 6
                  c.lui      s10, 18
                  nop
                  mulhsu     ra, t6, s10
                  sltiu      s7, a1, -710
                  c.or       s0, a1
                  c.xor      a0, a5
                  slt        s11, ra, s8
                  c.xor      a4, a0
                  c.andi     s0, -1
                  xor        a3, a0, gp
                  sra        ra, t5, s6
                  csrrw      s11, 0x340, s1
                  andi       t2, s1, -211
                  div        t3, a1, t4
                  c.srli     s1, 18
                  auipc      s10, 58404
                  div        s11, t0, s4
                  xor        s4, t6, s3
                  slti       s7, s10, -1003
                  c.srai     a4, 2
                  nop
                  c.or       a5, a0
                  xori       tp, s8, 944
                  sltiu      tp, s11, -951
                  csrrci     t5, 0x340, 21
                  mulh       a2, s10, t6
                  slli       t2, a7, 27
                  srl        a5, gp, s8
                  c.slli     a5, 24
                  c.li       s7, -1
                  csrrw      a3, 0x340, a2
                  srai       a6, s3, 31
                  sub        a4, gp, s2
                  mulhsu     a0, s0, tp
                  c.srai     a3, 29
                  c.sub      a1, a4
                  c.andi     s0, 28
                  remu       s9, s11, a2
                  lui        t0, 776706
                  c.or       a2, a2
                  c.srli     a3, 16
                  xor        s7, t6, sp
                  c.nop
                  srai       s7, a4, 8
                  mulhu      s9, s8, t5
                  lui        s3, 376722
                  csrrsi     a1, 0x340, 20
                  auipc      t0, 404088
                  c.li       t0, 17
                  sub        ra, t3, a6
                  xori       a7, ra, 641
                  add        zero, s10, s6
                  c.srli     a1, 24
                  sra        s7, s9, gp
                  sra        a6, a0, t1
                  rem        tp, s7, s3
                  slt        ra, s1, s6
                  c.sub      a5, s0
                  sll        zero, s11, a7
                  slti       a0, s5, 7
                  csrrsi     t5, 0x340, 11
                  c.nop
                  auipc      a1, 1038574
                  c.srli     s0, 30
                  lui        s7, 851053
                  addi       ra, a6, -713
                  rem        s1, a1, a6
                  add        s1, t2, a4
                  xor        a6, s4, sp
                  sub        t5, t5, s4
                  slti       ra, s11, 718
                  c.srai     a4, 8
                  xor        t2, s4, a4
                  c.xor      a2, s1
                  mul        t6, s8, t0
                  sltu       a6, gp, t0
                  divu       t2, s3, s2
                  add        t2, t0, a6
                  srai       t2, t2, 1
                  srai       t6, s7, 14
                  c.mv       s3, t0
                  sltiu      a3, s10, -486
                  sra        s4, a2, sp
                  c.andi     s1, 7
                  c.addi     s4, -1
                  or         zero, s4, a0
                  lui        t0, 236922
                  c.mv       s11, s10
                  c.or       a5, a1
                  or         t1, t3, t6
                  mulh       gp, s2, t1
                  c.add      gp, gp
                  c.slli     s6, 10
                  csrrwi     a6, 0x340, 6
                  c.add      s10, s6
                  lui        s4, 602979
                  div        a1, sp, s6
                  auipc      t6, 225859
                  nop
                  c.lui      s2, 2
                  remu       zero, a4, t4
                  c.li       s11, -1
                  xori       gp, t4, -38
                  mulhu      s9, a1, zero
                  remu       a1, s0, s10
                  divu       a5, s9, t5
                  srl        t2, a5, s5
                  c.li       s4, 29
                  slt        zero, s5, ra
                  sltu       t2, t3, t5
                  xori       s2, zero, -846
                  srli       s0, s10, 14
                  sll        a5, s3, a3
                  add        s1, a3, s6
                  c.sub      s0, a1
                  addi       zero, s10, -575
                  sub        a5, t3, t0
                  c.mv       a3, a3
                  sll        s11, t3, zero
                  srl        s2, t5, s10
                  sra        s1, a0, s10
                  csrrw      a1, 0x340, s2
                  xor        gp, s10, t2
                  csrrc      s10, 0x340, a3
                  csrrc      t4, 0x340, a0
                  mul        a4, s0, a6
                  mul        t1, sp, t5
                  or         a6, gp, t1
                  csrrwi     a3, 0x340, 29
                  csrrci     a3, 0x340, 31
                  or         s6, s10, t3
                  c.lui      s7, 6
                  div        s10, s4, s11
                  c.mv       s11, sp
                  csrrc      s9, 0x340, s5
                  srl        t1, s10, ra
                  rem        t2, t2, t3
                  lui        a2, 393316
                  sra        s6, gp, s0
                  srai       s6, gp, 23
                  c.lui      t1, 12
                  c.xor      a3, a5
                  add        s10, a1, a7
                  remu       s3, s6, s3
                  csrrs      t4, 0x340, gp
                  nop
                  slt        tp, a3, s6
                  csrrs      gp, 0x340, sp
                  mulhu      t3, zero, gp
                  c.lui      s10, 2
                  c.lui      ra, 20
                  div        t2, t6, gp
                  c.sub      a4, s0
                  csrrc      a4, 0x340, a2
                  mulhsu     t3, a7, t4
                  slti       gp, t6, 979
                  rem        gp, t5, a4
                  csrrw      s2, 0x340, a5
                  addi       a0, t3, 516
                  rem        a2, s3, s4
                  rem        s6, a5, a1
                  xor        gp, s3, t4
                  csrrci     t0, 0x340, 24
                  sltu       s10, t2, s4
                  slli       zero, t6, 2
                  or         t1, a6, t3
                  divu       a6, s6, gp
                  or         gp, s2, zero
                  sub        a7, gp, s10
                  mulhsu     s9, s10, a5
                  mulh       s7, s6, s6
                  c.xor      a1, s0
                  c.andi     a4, 9
                  add        t1, s1, a7
                  csrrci     a7, 0x340, 25
                  sltu       a6, a7, a4
                  add        a3, t2, s5
                  addi       s3, t0, 470
                  slli       ra, s1, 16
                  c.lui      t6, 11
                  mulh       s10, s10, s10
                  sltu       gp, a2, ra
                  srli       s11, s7, 7
                  c.xor      a0, s0
                  srli       zero, a1, 6
                  c.slli     t4, 22
                  sltu       s6, s0, s8
                  csrrwi     s2, 0x340, 16
                  or         s2, s6, a1
                  ori        a3, s8, -1007
                  csrrc      s7, 0x340, ra
                  c.xor      a1, s0
                  mulhsu     s2, a1, s0
                  div        a3, t2, s7
                  c.mv       t0, s6
                  mul        t4, s0, s3
                  mul        s3, s10, s6
                  or         a3, s0, t4
                  mulhu      tp, t4, a3
                  c.srli     a5, 10
                  divu       a3, s4, gp
                  c.li       a1, 16
                  c.add      t1, s1
                  ori        t6, a7, -870
                  csrrs      a5, 0x340, a4
                  c.nop
                  nop
                  sltu       a2, sp, s11
                  c.xor      s1, a4
                  or         a3, gp, t2
                  remu       t4, a1, a3
                  c.add      a1, a4
                  ori        a0, a2, 901
                  c.li       tp, -1
                  or         ra, s11, s9
                  c.nop
                  or         s2, tp, a0
                  addi       a4, ra, -912
                  add        s2, a7, t4
                  c.srai     s1, 23
                  c.mv       s3, a4
                  ori        s11, s8, -881
                  csrrc      a3, 0x340, s2
                  c.mv       s10, ra
                  csrrci     t4, 0x340, 4
                  add        s3, s9, a4
                  slt        a3, t5, s7
                  c.addi     t6, 1
                  csrrsi     s1, 0x340, 15
                  c.and      a2, a0
                  or         t4, a5, s1
                  srai       t5, t3, 9
                  divu       s2, s1, s10
                  ori        s3, a5, 648
                  nop
                  mulh       s7, ra, tp
                  c.nop
                  sra        tp, s10, s5
                  mulhsu     zero, s5, a6
                  csrrc      s0, 0x340, t0
                  c.srli     a2, 26
                  add        t5, zero, a6
                  c.srli     a4, 24
                  sub        s2, s1, a2
                  csrrsi     s10, 0x340, 8
                  c.and      a5, a3
                  remu       t1, ra, s0
                  c.nop
                  srli       a2, s3, 14
                  csrrw      a6, 0x340, t0
                  sra        ra, a1, t4
                  ori        ra, s7, 472
                  c.and      a4, s1
                  div        s11, a1, zero
                  c.lui      t0, 14
                  c.mv       t4, s5
                  c.xor      a0, a2
                  sra        t4, tp, a0
                  c.slli     s0, 20
                  c.lui      a4, 16
                  sltiu      s0, t4, 66
                  remu       s9, s0, s1
                  sra        t0, a4, s3
                  c.srai     a0, 6
                  add        a0, ra, s4
                  slti       t1, sp, 893
                  addi       a2, zero, 436
                  c.slli     t6, 4
                  c.or       s1, a0
                  slt        a5, a1, a7
                  xor        a3, a0, s2
                  slti       t1, t3, 805
                  c.xor      a4, s0
                  mulhu      s6, s10, zero
                  slli       a3, s3, 26
                  add        zero, t0, a6
                  csrrc      s3, 0x340, a7
                  xor        s0, t6, tp
                  nop
                  c.and      s0, a4
                  c.andi     a4, -1
                  c.and      a4, a3
                  c.addi     s2, 14
                  nop
                  andi       t0, s10, 252
                  rem        a0, s11, s1
                  mulh       a0, t1, ra
                  c.andi     s1, -1
                  mulhsu     t6, t2, a2
                  addi       s6, a7, -575
                  c.or       a5, a0
                  c.addi     ra, 9
                  csrrc      a3, 0x340, s11
                  c.li       s11, 2
                  mulh       t2, s3, a5
                  auipc      tp, 460428
                  divu       zero, t3, t1
                  csrrci     a2, 0x340, 28
                  csrrci     s9, 0x340, 14
                  rem        s1, s4, a2
                  c.addi     s2, -1
                  ori        t3, t2, 394
                  sll        t2, s8, a2
                  sll        t5, a7, t1
                  add        s6, s10, s5
                  sll        s4, s11, a2
                  remu       a0, s9, s11
                  c.nop
                  addi       a4, s9, 788
                  slt        a0, a5, s7
                  ori        a3, gp, -730
                  c.addi     t2, 11
                  c.srli     a0, 20
                  divu       a1, s9, a7
                  auipc      t3, 861357
                  mulhu      gp, s0, a4
                  sub        s1, t2, s10
                  remu       s1, a4, a6
                  mulhu      s7, a6, s6
                  mulhu      zero, s9, a2
                  srli       t5, a1, 8
                  c.mv       t1, s10
                  c.or       s0, a2
                  mulh       s4, a0, t6
                  csrrs      s3, 0x340, s6
                  mulhu      a3, s6, a4
                  slti       t0, s0, -757
                  nop
                  rem        s6, s4, ra
                  slt        s6, t4, s5
                  c.andi     a2, -1
                  addi       t3, s9, -801
                  sll        s4, s11, s4
                  csrrc      t2, 0x340, a4
                  nop
                  div        s6, a6, t1
                  csrrs      s3, 0x340, s0
                  csrrs      t5, 0x340, a3
                  slli       a5, s5, 11
                  c.srai     a0, 28
                  csrrs      s7, 0x340, s0
                  c.srli     a5, 17
                  div        s9, a4, a1
                  nop
                  c.sub      s0, a5
                  rem        ra, a6, tp
                  c.andi     a2, -1
                  c.addi     a2, 21
                  c.addi     t0, 6
                  remu       t0, a4, a4
                  c.and      a2, a5
                  sltu       a0, t1, t6
                  ori        s7, a4, -516
                  ori        s10, a6, 135
                  slti       a2, s6, -773
                  srl        ra, t4, a5
                  addi       a5, t1, 1014
                  c.li       a0, 1
                  sra        a3, zero, gp
                  c.addi     s4, -1
                  slt        s7, s9, t2
                  mul        s11, a4, t4
                  srli       t2, ra, 15
                  xori       gp, s3, -432
                  slti       a3, tp, 820
                  xori       s10, s0, -773
                  c.srli     s1, 7
                  c.and      s1, a3
                  sll        tp, s4, s8
                  c.and      s0, a5
                  c.andi     s1, -1
                  csrrwi     a6, 0x340, 23
                  csrrs      s0, 0x340, gp
                  csrrci     t4, 0x340, 27
                  ori        t2, a7, -414
                  addi       s7, s9, -911
                  sub        a2, t5, a4
                  nop
                  mul        t5, a0, t1
                  c.addi     t0, -1
                  csrrw      a4, 0x340, s5
                  c.srli     s0, 5
                  xori       s11, t3, 942
                  nop
                  divu       a3, s3, a2
                  addi       a1, ra, 915
                  sub        a7, s9, a3
                  lui        t6, 633898
                  csrrs      a6, 0x340, t6
                  andi       s4, a4, -304
                  rem        s2, s9, ra
                  c.mv       s2, t1
                  c.addi     t1, -1
                  xori       a2, t5, 0
                  divu       s10, a7, a4
                  slti       ra, s9, 385
                  divu       s4, a1, s6
                  sll        s6, s8, t1
                  xori       s9, a4, 1021
                  sll        t5, a3, s10
                  c.mv       s9, gp
                  slt        t0, s1, gp
                  add        t1, a3, t4
                  xori       gp, a0, -944
                  addi       t5, s5, 190
                  c.sub      a1, s1
                  c.andi     a5, 2
                  c.sub      a5, a4
                  csrrc      s7, 0x340, s3
                  c.lui      t5, 20
                  csrrsi     s4, 0x340, 29
                  mulhu      s3, s3, a3
                  csrrci     t4, 0x340, 15
                  c.andi     s1, 24
                  c.srai     s1, 26
                  divu       t0, s3, a3
                  sub        a4, gp, t6
                  xori       a4, a2, 468
                  c.and      a5, a4
                  c.andi     a5, -1
                  csrrc      ra, 0x340, a2
                  slti       t1, t0, 601
                  sltu       s3, s3, s8
                  auipc      s3, 100280
                  c.lui      s3, 15
                  srli       t1, s9, 23
                  xori       a1, t4, -614
                  c.srai     a3, 2
                  slt        a6, sp, s9
                  c.nop
                  c.slli     s11, 19
                  c.li       gp, 16
                  csrrw      ra, 0x340, s1
                  csrrw      a0, 0x340, sp
                  xori       a0, s0, -522
                  c.or       a0, a5
                  csrrc      s6, 0x340, s9
                  and        t4, a0, t0
                  sltu       s2, a4, s11
                  sll        s2, zero, a2
                  sltu       s7, t1, gp
                  xori       t6, s2, -829
                  remu       s3, t3, a4
                  csrrw      a6, 0x340, s8
                  sub        s2, a4, t4
                  sltiu      zero, t0, -299
                  csrrs      a2, 0x340, t4
                  addi       s2, t4, -261
                  andi       tp, s8, 183
                  c.and      a4, a1
                  csrrwi     s10, 0x340, 10
                  slt        t3, a0, s4
                  slti       s10, ra, 59
                  csrrci     ra, 0x340, 19
                  and        a1, s0, t3
                  c.sub      s1, a5
                  or         a3, s9, s2
                  c.srai     a1, 22
                  c.mv       a4, t4
                  c.mv       s4, a2
                  nop
                  c.mv       s7, a6
                  rem        tp, a2, s8
                  srl        s3, s4, t2
                  csrrc      a5, 0x340, s0
                  add        t5, ra, s11
                  add        a0, s9, s5
                  sltu       t0, a4, t4
                  csrrwi     a4, 0x340, 13
                  csrrwi     s11, 0x340, 26
                  xor        a3, zero, a6
                  c.sub      s1, a4
                  c.nop
                  c.nop
                  srai       s10, s7, 12
                  andi       a7, a5, 880
                  c.srai     a5, 12
                  c.add      t5, t3
                  xor        t2, t2, t3
                  mulhu      s3, s2, s5
                  c.srli     s1, 11
                  c.add      gp, t2
                  sltu       t4, t6, a0
                  c.slli     s3, 24
                  csrrwi     s4, 0x340, 20
                  sll        t0, gp, ra
                  lui        a3, 743166
                  c.mv       a4, tp
                  c.xor      a5, a4
                  divu       s7, s11, s0
                  c.and      a0, a3
                  mulh       a3, t5, gp
                  ori        s9, t3, 113
                  slli       s1, a5, 22
                  divu       t4, s9, a3
                  c.andi     a5, 22
                  nop
                  mul        a1, a3, s8
                  c.srli     a3, 26
                  c.or       a2, a1
                  xori       a3, sp, -368
                  srai       t0, t2, 26
                  srai       s11, s9, 13
                  slti       a0, t5, 710
                  c.or       a0, s0
                  srl        t0, a3, a2
                  csrrw      s0, 0x340, s5
                  lui        a0, 649825
                  c.slli     gp, 14
                  c.addi     a5, -1
                  and        s9, s3, t0
                  lui        s0, 737830
                  remu       s4, a3, a3
                  sltu       a3, a3, s6
                  srl        s2, a5, a6
                  srli       t0, s8, 1
                  csrrci     a0, 0x340, 24
                  csrrci     a2, 0x340, 17
                  csrrs      a4, 0x340, s0
                  c.li       a4, 23
                  c.and      a4, a4
                  srai       a5, t4, 26
                  c.nop
                  andi       t1, zero, -670
                  rem        a7, s11, s2
                  mulhsu     a6, s8, s1
                  c.xor      a2, a0
                  c.srai     s0, 18
                  remu       s9, t4, t4
                  slli       s6, s3, 17
                  slt        s4, sp, a0
                  sltiu      s7, a4, 970
                  mul        t4, t0, a7
                  sltiu      tp, t0, 846
                  c.srli     a0, 17
                  csrrs      t3, 0x340, s10
                  or         s0, a0, s6
                  csrrci     s3, 0x340, 23
                  lui        a3, 383949
                  csrrsi     a6, 0x340, 20
                  div        s0, a5, t4
                  csrrwi     ra, 0x340, 1
                  c.addi     s7, 10
                  srli       s4, gp, 24
                  addi       a0, s7, 39
                  slli       s9, gp, 29
                  mulhsu     tp, gp, s10
                  mulhu      a5, s2, a0
                  andi       t4, t5, -147
                  slti       t6, t1, -320
                  c.andi     s1, -1
                  csrrs      a7, 0x340, gp
                  csrrci     a6, 0x340, 26
                  c.lui      a4, 8
                  auipc      t3, 280961
                  c.xor      a0, a4
                  c.andi     a3, -1
                  sub        s11, s1, gp
                  c.mv       s4, s6
                  csrrc      a3, 0x340, s8
                  csrrci     t0, 0x340, 29
                  slt        gp, s2, a5
                  lui        a4, 7284
                  csrrc      t2, 0x340, t0
                  mulh       t1, s11, a4
                  srai       gp, s4, 22
                  slt        a3, s5, s10
                  c.li       s9, 29
                  csrrsi     s6, 0x340, 15
                  csrrc      s2, 0x340, s1
                  srli       t0, gp, 16
                  slti       a0, zero, 100
                  div        tp, s8, s6
                  nop
                  addi       t3, s8, -843
                  csrrw      t5, 0x340, s2
                  c.add      a4, s8
                  mul        a5, ra, s5
                  c.andi     s0, -1
                  c.mv       s2, s0
                  mulhu      a6, gp, t0
                  andi       s7, s7, -916
                  c.lui      s10, 26
                  slti       a4, zero, 775
                  sub        s3, a6, a6
                  c.nop
                  csrrci     gp, 0x340, 10
                  add        a4, s6, t0
                  csrrci     t6, 0x340, 9
                  rem        t6, s5, a1
                  mulhu      a6, s10, a4
                  slti       ra, s8, 848
                  c.srai     a3, 25
                  c.add      s10, a7
                  srli       t6, s5, 27
                  c.lui      tp, 25
                  srai       s9, t3, 12
                  sltiu      a3, s9, -907
                  auipc      s3, 973658
                  c.mv       s7, s8
                  c.andi     a4, 16
                  c.nop
                  csrrsi     a1, 0x340, 0
                  csrrwi     t4, 0x340, 24
                  sltiu      gp, s5, -447
                  c.and      s1, a0
                  remu       s6, s4, gp
                  mulhu      a4, s1, ra
                  srli       a0, sp, 13
                  add        s3, a0, s10
                  csrrc      a4, 0x340, t2
                  csrrwi     t2, 0x340, 27
                  divu       s3, t2, a1
                  c.li       ra, -1
                  mulhsu     a7, s9, gp
                  c.sub      a0, a5
                  slli       t0, s11, 7
                  csrrs      t1, 0x340, a0
                  auipc      a6, 221956
                  c.li       s10, -1
                  mulh       a3, a4, s7
                  div        a4, t0, gp
                  srai       t2, s2, 18
                  c.andi     s0, 1
                  sll        a2, zero, s3
                  c.and      a4, a1
                  ori        zero, t1, -598
                  c.mv       a5, tp
                  rem        s2, sp, a2
                  andi       a3, t6, -506
                  xori       t2, s4, 953
                  csrrw      t3, 0x340, s4
                  rem        t3, t0, sp
                  c.addi     a4, -1
                  andi       t1, s6, -419
                  c.nop
                  add        ra, a2, t2
                  div        a7, t4, a1
                  and        s9, a6, t2
                  rem        t1, s2, a0
                  sll        tp, a5, t1
                  nop
                  ori        t6, sp, 632
                  addi       t2, a2, -859
                  slt        zero, t5, sp
                  mulhu      s11, t0, s9
                  divu       t1, t0, a0
                  sub        a5, s11, zero
                  c.srli     a5, 4
                  csrrc      s7, 0x340, a2
                  c.nop
                  slt        s3, gp, gp
                  lui        t2, 444969
                  csrrci     a3, 0x340, 16
                  lui        t4, 264789
                  srai       s6, t0, 28
                  andi       t0, t3, 281
                  sltiu      gp, t0, -429
                  csrrwi     s11, 0x340, 13
                  remu       a7, t4, a7
                  c.li       s6, -1
                  c.slli     a6, 12
                  andi       s11, ra, 356
                  sltiu      a6, t3, 783
                  ori        a2, sp, -661
                  c.addi     gp, 28
                  nop
                  sltiu      s9, a2, -484
                  nop
                  c.and      s0, a4
                  sltu       gp, s10, a2
                  div        t0, tp, s6
                  nop
                  c.andi     a3, -1
                  c.or       a2, a4
                  sltiu      t5, a7, 283
                  c.srli     a3, 4
                  or         s10, t0, t0
                  c.add      s6, s1
                  c.andi     s1, -1
                  lui        s9, 710214
                  auipc      a6, 82085
                  c.and      s1, a5
                  sub        zero, t3, t3
                  and        zero, s10, s0
                  csrrw      s10, 0x340, s9
                  auipc      s1, 43064
                  c.lui      t0, 12
                  c.xor      s1, a5
                  c.sub      a5, s1
                  slt        a0, t0, s8
                  c.or       a3, a4
                  or         tp, a4, a6
                  c.mv       s1, t4
                  csrrci     a4, 0x340, 6
                  c.slli     s4, 9
                  nop
                  mul        a6, a4, s7
                  slt        a3, t3, ra
                  sra        a0, s5, s6
                  mulh       t5, s6, sp
                  csrrw      a0, 0x340, a7
                  nop
                  csrrsi     t6, 0x340, 0
                  csrrw      s9, 0x340, a5
                  c.and      a4, a2
                  addi       t1, s5, -286
                  auipc      s9, 299536
                  c.sub      a4, a5
                  remu       s11, gp, tp
                  srli       a0, tp, 29
                  auipc      ra, 274643
                  xori       t4, zero, 913
                  c.sub      a5, a3
                  csrrw      t1, 0x340, s5
                  csrrs      s10, 0x340, t3
                  sra        s9, s5, s10
                  c.and      a2, a1
                  sll        s0, t4, a0
                  c.and      a1, a0
                  c.xor      a4, a1
                  sltiu      a6, t5, 690
                  div        t4, t4, zero
                  c.and      a1, s0
                  c.or       s0, s0
                  sub        a5, sp, a4
                  lui        t3, 104256
                  c.addi     s1, -1
                  xor        t5, t0, t2
                  div        t4, a3, s2
                  rem        a0, t5, tp
                  csrrci     zero, 0x340, 13
                  srl        s1, a5, a3
                  csrrsi     s6, 0x340, 20
                  c.srli     a2, 31
                  slt        a0, a6, s0
                  csrrci     a6, 0x340, 24
                  nop
                  srl        s0, s7, a6
                  sltiu      s7, s3, 930
                  csrrwi     t1, 0x340, 13
                  c.and      a1, a0
                  c.and      a2, a2
                  nop
                  c.andi     a4, -1
                  sltiu      a4, a3, -264
                  sltiu      t4, a7, 251
                  mulhsu     s10, s10, t1
                  csrrci     gp, 0x340, 28
                  mulhsu     t2, t2, gp
                  remu       t1, s7, a3
                  sltu       t0, t0, t4
                  srli       a4, a5, 18
                  c.and      s1, a2
                  nop
                  rem        s1, s0, s9
                  c.add      t4, t3
                  sltiu      s9, a3, -325
                  remu       s9, s2, s10
                  and        s4, a4, s11
                  slti       s2, t5, 582
                  c.xor      a1, a4
                  csrrwi     s2, 0x340, 31
                  mulhu      t6, a3, t3
                  c.add      a6, a0
                  c.or       a2, s1
                  slti       s1, t1, 879
                  remu       a6, t4, zero
                  add        a5, a1, a5
                  add        s6, s2, a7
                  c.xor      a0, s0
                  c.xor      a2, a4
                  sll        s10, t5, a3
                  or         t3, a2, s8
                  mul        t0, a2, s11
                  remu       a4, gp, tp
                  xor        zero, sp, s0
                  c.andi     s0, -1
                  divu       a6, a5, s7
                  mulhu      t4, a3, t4
                  sltu       a5, a0, s6
                  c.sub      a3, a0
                  xori       zero, s6, -892
                  mul        s11, a2, t4
                  csrrci     a0, 0x340, 6
                  c.nop
                  and        s6, t1, s3
                  or         s1, s3, t3
                  mulhu      s3, a5, s3
                  csrrs      s10, 0x340, gp
                  csrrs      a4, 0x340, t5
                  lui        tp, 684475
                  xori       t3, ra, -218
                  auipc      a3, 916925
                  csrrci     s9, 0x340, 4
                  mulhsu     t6, zero, zero
                  add        s9, t2, zero
                  c.srli     s0, 30
                  c.sub      a4, a3
                  c.srai     a1, 31
                  c.lui      s1, 31
                  mulh       s2, s4, a4
                  sltu       ra, s6, s2
                  csrrwi     s2, 0x340, 19
                  rem        tp, s4, t5
                  or         zero, t0, tp
                  csrrw      a5, 0x340, s0
                  c.or       a1, a1
                  nop
                  c.nop
                  slli       gp, s5, 7
                  mul        a3, t6, a3
                  c.slli     s10, 1
                  srl        gp, s0, t4
                  ori        t5, s11, -957
                  remu       t4, a3, s5
                  c.or       a1, s0
                  sltu       ra, a4, s7
                  mulhsu     s4, s4, t2
                  c.add      s1, t1
                  add        s2, s4, a5
                  xori       tp, s9, -551
                  csrrs      a1, 0x340, ra
                  c.srli     s1, 19
                  lui        a1, 322090
                  sltu       zero, ra, s6
                  c.srai     s0, 7
                  csrrc      gp, 0x340, t0
                  c.slli     a7, 3
                  andi       s10, s5, -860
                  mulh       t3, tp, t4
                  slt        s3, ra, t5
                  c.or       a2, a4
                  srli       s6, s3, 26
                  c.or       a1, a3
                  addi       s3, a2, -984
                  c.lui      s6, 4
                  c.mv       t3, s10
                  csrrci     a7, 0x340, 7
                  c.add      s1, s5
                  ori        t5, t3, 839
                  and        s10, t6, t3
                  csrrs      gp, 0x340, s0
                  or         s0, tp, s0
                  c.srai     a2, 10
                  and        s7, s10, s8
                  c.sub      a4, a5
                  c.lui      t3, 13
                  c.srli     s1, 1
                  srli       s7, t3, 16
                  xor        t6, a3, a0
                  c.addi     s11, -1
                  xori       a2, s11, -62
                  slt        s9, t6, s3
                  rem        s9, a5, s6
                  slli       tp, s7, 30
                  c.srli     s0, 2
                  csrrci     s1, 0x340, 19
                  lui        s6, 458832
                  sll        a0, s10, a4
                  slt        a4, ra, s11
                  or         t4, sp, s6
                  csrrsi     t0, 0x340, 23
                  c.slli     s6, 25
                  mulh       s11, s6, t5
                  xor        ra, sp, t6
                  c.sub      s0, a5
                  c.lui      a5, 5
                  lui        t3, 920440
                  c.li       s2, 16
                  c.xor      a1, a0
                  c.mv       a0, a0
                  rem        t6, a7, a7
                  sra        s11, a1, s3
                  c.li       gp, -1
                  ori        zero, s10, 228
                  c.and      s0, a3
                  c.nop
                  c.and      a2, a4
                  c.addi     s1, -1
                  slt        s2, s0, s11
                  mulh       t0, ra, zero
                  or         t3, a0, t6
                  ori        s9, t4, 662
                  c.and      a4, a2
                  and        t0, s3, sp
                  c.andi     a1, 10
                  c.li       t2, -1
                  c.mv       a1, a2
                  add        a2, t2, s3
                  remu       s7, a1, gp
                  divu       s2, t2, t4
                  csrrc      a5, 0x340, s9
                  addi       a5, s4, 717
                  rem        s10, ra, s10
                  srli       zero, s9, 22
                  slti       t0, a1, 783
                  c.add      ra, t6
                  lui        a6, 543756
                  sltiu      s3, ra, 750
                  ori        a3, tp, -11
                  mulhsu     s4, s8, t4
                  ori        t5, s2, -900
                  c.andi     a4, 25
                  c.andi     a1, -1
                  c.xor      s1, a0
                  auipc      t5, 235270
                  add        s6, s5, s2
                  slt        s1, a1, a5
                  c.andi     a3, 12
                  srai       a6, s6, 25
                  mulh       tp, ra, s2
                  mulhu      t0, t2, a2
                  sll        s9, s5, a0
                  c.srai     a2, 5
                  rem        a4, s0, s9
                  slli       s3, t1, 23
                  c.nop
                  csrrc      t6, 0x340, a0
                  c.sub      a4, s0
                  csrrci     a4, 0x340, 3
                  c.nop
                  srl        s3, s9, a6
                  c.srai     s1, 20
                  slt        a7, s8, zero
                  c.srli     s0, 27
                  ori        s6, gp, -282
                  div        s10, s1, a0
                  lui        t5, 1022409
                  c.mv       s9, a1
                  xor        t4, a5, a6
                  mulhsu     s9, s11, a7
                  csrrc      a3, 0x340, s8
                  remu       gp, ra, s10
                  c.or       a0, a5
                  mulhu      t3, a7, s3
                  csrrsi     a0, 0x340, 24
                  mulhu      t4, a7, t5
                  and        a7, t2, s6
                  mul        s3, t6, t1
                  csrrwi     s0, 0x340, 29
                  c.xor      a0, a4
                  or         a1, s4, s7
                  srl        t1, a4, s4
                  mul        a5, zero, s1
                  csrrc      zero, 0x340, t0
                  div        s0, a5, t3
                  slli       s6, s4, 17
                  slt        t1, s10, s0
                  add        s1, t6, tp
                  slti       s3, a3, 879
                  sltu       t1, a4, sp
                  mul        a3, t6, a2
                  auipc      s6, 16295
                  srai       s3, t5, 31
                  slt        a5, gp, a6
                  c.slli     s10, 5
                  c.srai     a4, 4
                  and        s0, zero, t5
                  c.nop
                  sra        a2, a4, s10
                  andi       t3, s9, 110
                  c.or       a4, a0
                  sub        s0, sp, t0
                  srl        t2, a0, tp
                  c.xor      a4, s1
                  mulh       s3, a2, a7
                  sltu       s0, s9, s7
                  csrrw      zero, 0x340, s10
                  c.and      a3, a5
                  div        t2, s3, a2
                  lui        t4, 139298
                  sltu       t0, s7, a2
                  c.xor      a2, s0
                  c.xor      a1, s0
                  lui        a5, 1020210
                  slti       a0, a7, 541
                  rem        a7, t4, s2
                  slli       s11, a7, 18
                  sub        s11, t1, a1
                  mulhu      t6, t5, a4
                  lui        t3, 977814
                  div        t4, ra, a0
                  mulh       s4, s2, s1
                  c.slli     s1, 24
                  sltu       s0, t0, t4
                  slt        a7, a2, s6
                  c.mv       ra, t6
                  csrrc      t1, 0x340, s10
                  sltiu      a7, s11, -153
                  sub        zero, a3, ra
                  sltiu      a5, t2, -261
                  sltu       a2, s5, a0
                  slt        a5, s6, a7
                  or         t4, s11, a0
                  slti       s6, a4, -125
                  csrrc      tp, 0x340, a4
                  sll        s3, a4, a7
                  csrrwi     zero, 0x340, 15
                  slti       a3, a1, 832
                  sra        s3, t4, a0
                  csrrs      s10, 0x340, s4
                  mul        a1, s9, s0
                  mulhsu     s1, a0, a5
                  c.add      t4, tp
                  c.srli     a4, 25
                  c.lui      gp, 28
                  c.sub      a2, a0
                  csrrw      s11, 0x340, s1
                  slti       a6, s2, -864
                  addi       s3, a2, -914
                  csrrwi     s4, 0x340, 7
                  csrrci     s4, 0x340, 19
                  xor        a5, s6, t2
                  c.add      t5, a4
                  c.lui      s0, 23
                  c.xor      s1, s1
                  ori        t0, s11, -138
                  mulh       ra, s4, s5
                  add        s2, s0, zero
                  c.nop
                  c.slli     s9, 3
                  c.xor      s0, s1
                  xori       a5, s8, -496
                  csrrs      s10, 0x340, s9
                  slli       s2, t2, 4
                  sltiu      a7, s3, -664
                  slt        s2, a2, t0
                  srli       t5, sp, 9
                  add        t1, s2, s10
                  div        s11, s0, a6
                  div        a4, t0, s3
                  c.add      a5, sp
                  mul        t2, a0, a2
                  srl        a0, t4, s10
                  c.nop
                  andi       gp, t1, 50
                  csrrc      s6, 0x340, s9
                  div        t2, gp, t1
                  sltu       s9, zero, s6
                  or         t4, a6, gp
                  csrrsi     t3, 0x340, 28
                  csrrwi     a5, 0x340, 22
                  divu       s10, s5, s8
                  rem        gp, s7, s5
                  xori       a7, a4, 485
                  slli       gp, sp, 3
                  c.andi     a1, 11
                  or         s6, s5, s3
                  csrrwi     t6, 0x340, 4
                  ori        s4, a0, 768
                  remu       t5, s5, s5
                  sra        s3, sp, tp
                  sub        s6, ra, s11
                  c.nop
                  slli       s3, s7, 26
                  srai       t4, gp, 11
                  c.nop
                  auipc      a6, 967052
                  or         s6, s11, s3
                  c.lui      ra, 6
                  remu       s0, s11, s9
                  c.mv       a7, a0
                  auipc      t3, 73876
                  xor        a2, s8, sp
                  mul        t2, s1, t3
                  xor        s9, t0, a4
                  sub        a4, s7, sp
                  slli       ra, s9, 15
                  csrrs      gp, 0x340, s7
                  c.li       a5, -1
                  c.mv       ra, t1
                  xori       a5, t6, -359
                  xor        t1, s6, gp
                  c.srli     a4, 4
                  c.li       gp, 21
                  and        t4, s10, t5
                  auipc      s4, 820968
                  div        s4, t2, s4
                  c.srai     a0, 25
                  c.srli     a0, 23
                  ori        s2, t3, -410
                  mul        tp, t0, s9
                  mulhu      t6, gp, t0
                  mulhu      s3, a2, a1
                  sltu       a4, t6, s0
                  or         s0, t5, t3
                  xori       t4, zero, 129
                  c.srai     a3, 6
                  rem        a4, s4, s9
                  srli       a0, s1, 15
                  and        t2, sp, zero
                  c.and      s1, s0
                  csrrw      s2, 0x340, s5
                  xor        s9, s10, s1
                  mulhsu     a5, ra, s5
                  csrrc      a6, 0x340, t6
                  srl        a6, a6, s3
                  csrrci     t5, 0x340, 6
                  mul        a0, a0, s4
                  nop
                  c.sub      a2, s0
                  sll        s4, s0, s10
                  srai       s2, s9, 1
                  sltu       t1, a3, ra
                  rem        a4, gp, a1
                  c.andi     a0, 23
                  remu       a4, t3, s2
                  c.nop
                  rem        t0, ra, sp
                  addi       s7, a1, 952
                  rem        a5, t3, a6
                  c.li       a5, -1
                  slt        s6, a1, a5
                  sub        s0, a1, s4
                  addi       t1, a6, -749
                  csrrs      s2, 0x340, sp
                  auipc      s9, 732211
                  srl        s4, s4, t2
                  c.addi     s2, 8
                  c.nop
                  nop
                  mul        t3, a5, t6
                  xor        s10, gp, s1
                  mulhu      a3, s4, t5
                  c.li       s1, -1
                  c.mv       a5, a7
                  c.or       a1, s1
                  sub        tp, ra, s8
                  sll        a2, a1, ra
                  c.add      s6, s8
                  c.lui      t0, 16
                  remu       s11, a1, zero
                  c.srli     s1, 11
                  sltu       a6, t1, tp
                  div        ra, ra, t2
                  slt        s10, s4, a2
                  slt        s4, a5, ra
                  divu       t5, s11, t6
                  mul        gp, s9, s1
                  csrrc      s3, 0x340, t6
                  mulhsu     gp, s9, s4
                  c.add      s7, s9
                  csrrw      a6, 0x340, tp
                  slt        s3, ra, s9
                  nop
                  andi       a3, s6, -294
                  srai       s4, s9, 29
                  or         s6, t4, s4
                  c.addi     s6, -1
                  c.nop
                  c.nop
                  c.li       s3, 0
                  sltu       t1, s1, a5
                  c.li       t3, 11
                  andi       a2, s8, -923
                  csrrc      a1, 0x340, t4
                  slt        a5, s2, a3
                  c.xor      a3, s0
                  andi       a4, a0, 812
                  c.xor      a4, a2
                  c.srai     a2, 11
                  xor        t5, gp, a2
                  c.or       a1, a1
                  csrrci     t3, 0x340, 7
                  csrrs      a2, 0x340, a7
                  srli       a2, t0, 0
                  c.nop
                  c.li       a4, -1
                  csrrw      t4, 0x340, s4
                  c.addi     a4, -1
                  xor        s9, s6, s0
                  c.or       s0, s1
                  slli       t0, ra, 27
                  c.srai     a0, 27
                  ori        t1, sp, 28
                  rem        t2, a6, a5
                  c.add      s7, a1
                  sll        a3, s2, a5
                  sll        t2, s5, s3
                  andi       s10, s10, 725
                  divu       a4, a1, t2
                  mul        s7, a7, t4
                  mulhu      s7, s0, a3
                  sltiu      s11, a1, 158
                  c.addi     a5, -1
                  rem        gp, t2, t6
                  c.addi     ra, -1
                  xori       t0, s10, 960
                  or         a2, t6, s7
                  c.andi     a1, 20
                  and        a4, s4, t4
                  mulh       s10, t0, s2
                  srli       a1, t5, 30
                  c.or       s1, a1
                  c.or       s0, s0
                  mulh       s11, a7, s3
                  rem        s7, a6, a7
                  c.lui      t2, 4
                  c.andi     s0, 31
                  sub        a5, t6, a6
                  srai       ra, t4, 26
                  sub        ra, s2, tp
                  lui        s1, 890338
                  srli       a2, s8, 17
                  c.srli     a3, 12
                  c.or       s0, a1
                  c.nop
                  rem        a7, t4, a7
                  srli       a6, t4, 12
                  mulhsu     a1, a5, s4
                  add        ra, t4, a0
                  lui        t5, 768507
                  c.srai     a5, 8
                  or         a1, t4, a5
                  srli       s3, t2, 14
                  slt        a7, s11, ra
                  and        s11, s7, a3
                  csrrw      a6, 0x340, a0
                  c.lui      s10, 21
                  srai       s2, gp, 12
                  addi       ra, sp, -892
                  c.lui      a7, 25
                  mul        s3, a2, s2
                  c.andi     a5, 31
                  c.add      t4, s4
                  xor        s10, s5, sp
                  c.srai     s0, 20
                  sub        gp, a3, t0
                  c.andi     a5, -1
                  rem        t6, t1, gp
                  sltiu      s1, s2, -373
                  add        t5, sp, s3
                  sltu       ra, a0, tp
                  sub        a2, a7, s0
                  c.sub      a3, a0
                  sra        a4, t2, s4
                  c.or       a2, a2
                  div        a4, a0, tp
                  csrrw      t1, 0x340, s9
                  sub        a2, t6, gp
                  slt        gp, s5, a6
                  mulhsu     s9, t4, t0
                  sltiu      t1, a0, -786
                  remu       t1, s8, s11
                  c.slli     t5, 13
                  and        a4, gp, t6
                  c.and      a3, a4
                  slti       t0, t0, -1021
                  mulhu      t0, t0, t0
                  and        zero, a0, s6
                  sll        t5, zero, s1
                  csrrs      a6, 0x340, sp
                  c.and      a5, a0
                  ori        a7, zero, 64
                  mulhu      a5, t2, s9
                  srli       s11, s6, 31
                  mulhsu     s0, t5, a0
                  c.slli     a7, 27
                  mulhsu     t5, t0, s1
                  xori       s9, s10, -767
                  srai       a7, sp, 4
                  c.andi     a3, 22
                  xori       a5, s1, -126
                  divu       s1, t0, sp
                  sltu       a3, a4, t5
                  c.add      s1, a5
                  sltu       a3, s4, s7
                  ori        s6, t0, 518
                  mul        s4, s9, tp
                  and        zero, tp, s10
                  c.srai     s0, 21
                  divu       t0, s7, a4
                  sll        s2, t0, a2
                  divu       a3, a0, s11
                  divu       gp, s1, a4
                  rem        t6, t2, ra
                  div        s1, ra, t2
                  div        s10, a0, t0
                  sll        t1, a1, gp
                  remu       a6, sp, a6
                  xori       t4, s9, 135
                  mulhsu     s1, s1, s6
                  c.add      a5, ra
                  div        s11, s6, s9
                  addi       a1, s4, 293
                  c.li       a0, 13
                  mulhsu     s6, s9, t6
                  and        s10, a7, a3
                  sltu       a7, t2, a5
                  lui        zero, 1033806
                  xor        s1, s3, t5
                  c.andi     a1, -1
                  ori        a7, t2, 75
                  sub        tp, tp, s0
                  addi       a4, a0, 700
                  add        s1, s4, s1
                  addi       t0, t1, -75
                  mulhu      t0, t1, a4
                  c.add      a2, s10
                  c.li       a6, 28
                  mulhu      a4, s8, s0
                  mulhsu     a5, zero, a4
                  or         t6, s2, s10
                  divu       s6, ra, s7
                  csrrs      a0, 0x340, tp
                  or         a2, a3, t0
                  c.srli     s0, 9
                  c.or       s1, a4
                  c.lui      s10, 21
                  mul        s9, a7, t2
                  c.srli     a1, 12
                  c.slli     t2, 13
                  ori        t0, a1, 393
                  sltu       t5, a4, a1
                  slt        t2, s4, a5
                  nop
                  csrrci     s1, 0x340, 1
                  sltu       a7, tp, s7
                  csrrs      s9, 0x340, a4
                  srai       s3, t4, 29
                  andi       a2, s7, 41
                  csrrc      t3, 0x340, sp
                  remu       a5, sp, a0
                  sltu       t6, a3, a1
                  mulh       a7, s10, s2
                  csrrs      t0, 0x340, a5
                  mulhsu     t0, a7, t5
                  sub        t3, s3, s0
                  srl        s7, ra, gp
                  csrrwi     a0, 0x340, 14
                  add        ra, s5, a2
                  c.mv       t4, s7
                  divu       a7, s1, a3
                  c.srai     s1, 22
                  c.sub      a0, a0
                  sll        a7, t4, s8
                  or         t4, a1, s3
                  xor        ra, s2, a7
                  srl        a2, s8, t6
                  xor        s7, t3, t5
                  c.xor      a4, a3
                  csrrsi     t6, 0x340, 9
                  div        s6, a6, a0
                  c.addi     s2, 30
                  remu       s9, zero, s1
                  or         s2, a6, t6
                  c.srli     a5, 31
                  and        tp, a3, zero
                  csrrs      t3, 0x340, a7
                  sltiu      a4, s7, -646
                  add        s1, t6, a0
                  c.xor      a1, a3
                  csrrsi     tp, 0x340, 15
                  csrrsi     gp, 0x340, 0
                  c.addi     t3, 21
                  mulh       s1, t5, a3
                  xor        ra, a6, t5
                  c.srai     a3, 5
                  c.and      a3, a3
                  c.srai     a2, 12
                  srai       a0, t4, 5
                  mulhu      s11, t5, t3
                  divu       tp, s1, s9
                  c.addi     a7, -1
                  slt        ra, s10, s4
                  remu       t2, tp, gp
                  c.or       a4, a0
                  remu       t0, s7, a6
                  mulh       a1, a3, sp
                  csrrc      t5, 0x340, t1
                  slti       s6, s11, 621
                  div        s4, a1, ra
                  add        a3, s1, s11
                  andi       a5, s7, 680
                  sll        a6, s6, s7
                  xori       s3, s10, 252
                  csrrsi     t3, 0x340, 6
                  add        a2, t3, s1
                  csrrs      a5, 0x340, s1
                  sub        s0, s0, a4
                  c.li       t1, -1
                  sltiu      a6, t4, -968
                  c.addi     t3, 4
                  c.sub      a2, a1
                  slli       t2, s2, 9
                  c.srai     a0, 11
                  andi       tp, t0, 829
                  csrrc      t3, 0x340, sp
                  mulh       s0, a3, t5
                  c.srai     a0, 22
                  csrrci     s3, 0x340, 30
                  slt        s6, t1, s4
                  csrrc      tp, 0x340, t2
                  c.mv       a3, ra
                  c.sub      s0, s0
                  sltiu      s2, a5, -419
                  srai       s10, s7, 10
                  c.andi     a3, 11
                  slli       s11, s6, 7
                  c.addi     s1, -1
                  csrrwi     s11, 0x340, 12
                  c.xor      a5, a4
                  csrrw      s10, 0x340, s5
                  csrrsi     t1, 0x340, 4
                  xori       t2, s9, 45
                  lui        a4, 658699
                  csrrc      s4, 0x340, s10
                  srl        t0, s9, t4
                  c.or       a2, a5
                  sra        t4, s10, a1
                  srli       a4, s8, 10
                  srl        a4, t6, t4
                  c.lui      tp, 11
                  sltu       a7, s11, s3
                  c.addi     s2, 12
                  c.and      a2, a0
                  xor        s2, sp, s11
                  div        s4, s0, s11
                  c.addi     s0, -1
                  c.srai     a0, 17
                  xori       s3, s3, -357
                  c.add      s7, s9
                  sltiu      gp, s4, 409
                  sltu       a1, sp, a0
                  mulhu      s10, t6, s7
                  srai       t4, a7, 21
                  sltiu      gp, t4, -840
                  sltu       s1, s3, s10
                  c.lui      t0, 20
                  nop
                  xor        s4, a5, s9
                  srl        s11, gp, s9
                  c.mv       a5, s6
                  slli       a0, t5, 7
                  c.nop
                  lui        s11, 901118
                  csrrci     ra, 0x340, 5
                  slti       t6, a6, -278
                  mulhu      a2, sp, s2
                  slli       t4, s8, 10
                  csrrwi     t1, 0x340, 20
                  c.addi     tp, 2
                  or         s2, s7, s10
                  and        t3, s10, t0
                  slti       t1, s11, -258
                  c.lui      s2, 24
                  srai       t5, a4, 20
                  sltu       s7, sp, s11
                  c.nop
                  c.addi     ra, -1
                  div        s3, s6, t2
                  remu       a0, gp, ra
                  slli       t1, t4, 18
                  c.addi     s9, -1
                  c.srai     a0, 18
                  xor        s6, s5, t1
                  csrrsi     s2, 0x340, 13
                  c.add      s1, a5
                  ori        s2, t0, 760
                  xori       s1, ra, 424
                  slti       a7, ra, -520
                  nop
                  sra        t5, tp, a7
                  c.srai     a4, 14
                  div        t3, t6, s6
                  c.nop
                  andi       a2, s8, -1019
                  srl        t1, t6, ra
                  sub        s9, s9, s10
                  srl        s11, a4, s11
                  div        s10, s10, s10
                  c.sub      a0, a2
                  divu       ra, a7, s1
                  xori       t0, s2, -30
                  csrrc      a5, 0x340, t6
                  div        gp, t1, t2
                  c.sub      a2, s1
                  andi       t6, s11, 712
                  c.sub      s0, a0
                  mul        s10, a5, s5
                  c.xor      a1, a4
                  c.add      t1, s2
                  xor        a6, s9, s1
                  srli       t2, t3, 12
                  c.lui      a5, 31
                  sll        t1, s6, s9
                  andi       a6, s9, -943
                  and        a0, t6, s4
                  c.mv       s2, s9
                  divu       a7, zero, t0
                  slli       s9, s1, 11
                  c.li       t3, -1
                  c.srai     a1, 18
                  sll        a7, sp, a1
                  xor        a2, s1, tp
                  c.sub      a2, s0
                  c.and      a3, a0
                  c.li       t5, 10
                  csrrc      a4, 0x340, a4
                  sub        s2, s3, s11
                  csrrc      s6, 0x340, s2
                  c.xor      a2, a3
                  mulh       zero, a4, s6
                  div        s11, t1, s7
                  sltiu      s0, s4, -339
                  csrrw      ra, 0x340, s9
                  csrrc      a3, 0x340, t3
                  csrrw      s2, 0x340, s10
                  sll        s7, a0, a6
                  sub        t0, a5, a3
                  xori       t0, ra, -199
                  or         ra, s4, s10
                  sll        tp, zero, s3
                  add        a5, s7, zero
                  mulhu      a6, a2, t2
                  csrrsi     tp, 0x340, 29
                  div        t3, t5, t1
                  c.xor      a3, a0
                  divu       t2, t2, s7
                  csrrw      gp, 0x340, gp
                  div        t3, s9, a1
                  mulhsu     s3, a6, t2
                  ori        gp, t0, -681
                  c.nop
                  c.srai     a0, 25
                  c.and      a0, a2
                  srli       s4, gp, 2
                  csrrs      a5, 0x340, a3
                  and        a3, a1, t0
                  c.addi     t0, -1
                  c.addi     t2, -1
                  divu       s7, t3, a7
                  mulh       s9, t3, a7
                  sltu       s7, s4, a1
                  and        s7, t5, a4
                  c.mv       t0, t4
                  addi       s6, s7, 684
                  slti       s6, s8, 656
                  or         s0, t3, zero
                  sltu       a3, s3, a6
                  slli       ra, a1, 27
                  c.sub      s1, a5
                  csrrci     s7, 0x340, 19
                  srli       a4, t3, 10
                  addi       a0, s7, -786
                  c.add      t2, s9
                  c.srai     a4, 5
                  csrrs      ra, 0x340, t3
                  mulhu      a5, a1, a4
                  nop
                  c.lui      gp, 9
                  sltiu      tp, s9, 65
                  c.xor      s0, s1
                  c.li       s0, -1
                  ori        s4, s4, 722
                  c.srai     s1, 5
                  slti       t5, s8, 352
                  c.andi     a5, 14
                  c.li       t4, 29
                  c.add      gp, s11
                  csrrs      t2, 0x340, s6
                  c.slli     t2, 13
                  c.xor      a5, s0
                  xori       a4, t2, -820
                  lui        t0, 964179
                  addi       a3, gp, -273
                  ori        gp, zero, -656
                  sra        t1, t2, gp
                  csrrci     a3, 0x340, 28
                  c.li       a3, 20
                  slli       a4, s11, 9
                  sltiu      a0, s7, -247
                  slti       t4, s6, 831
                  c.or       s1, s0
                  c.or       a3, a2
                  sltiu      t5, a1, -804
                  sra        a5, a4, t0
                  mulhu      s11, sp, s5
                  c.and      a3, a5
                  slti       s4, tp, -289
                  remu       a3, t1, s7
                  srai       a3, s4, 14
                  ori        ra, t0, -182
                  mul        s3, t6, a0
                  sra        s7, t1, s11
                  slt        s4, s6, s3
                  c.nop
                  srai       ra, s0, 10
                  csrrc      a0, 0x340, t4
                  c.nop
                  c.xor      a1, a2
                  mulhu      s2, s3, t0
                  slt        a7, a6, a1
                  slti       t2, t0, 287
                  c.and      a4, a3
                  auipc      a5, 170380
                  mulh       a5, s9, gp
                  c.andi     a4, 0
                  slt        zero, t0, a5
                  div        t5, s9, a4
                  sltu       a0, t6, s7
                  mul        a7, a5, s1
                  csrrsi     s3, 0x340, 29
                  sltu       s11, s2, t2
                  c.lui      tp, 30
                  csrrw      t1, 0x340, s9
                  srl        s9, a0, s0
                  c.slli     a7, 6
                  csrrc      s6, 0x340, gp
                  csrrsi     a1, 0x340, 7
                  c.and      s0, a5
                  xor        s10, s4, a6
                  c.and      s0, a4
                  srai       t2, a4, 26
                  srl        a6, s8, a2
                  div        a0, s0, gp
                  and        s3, sp, t1
                  and        s7, sp, a6
                  div        s1, s2, s2
                  csrrs      t3, 0x340, a0
                  srai       a1, t6, 14
                  sltiu      a7, ra, -452
                  nop
                  divu       a5, gp, t6
                  c.or       a2, a3
                  remu       a3, a3, a0
                  c.sub      a0, s1
                  c.andi     a3, 29
                  nop
                  mulhsu     t2, s0, a4
                  mul        gp, s4, a3
                  csrrwi     t4, 0x340, 18
                  mulhu      s6, t3, t4
                  mulhu      t1, s2, s7
                  c.li       t4, -1
                  mulhsu     t0, zero, s8
                  c.li       tp, -1
                  srl        tp, a1, a5
                  lui        a7, 612669
                  div        t2, t2, s7
                  slti       a0, tp, 928
                  mulhu      s11, tp, t4
                  c.srli     s1, 21
                  sll        a5, a6, gp
                  or         t0, ra, a1
                  nop
                  csrrs      a2, 0x340, t0
                  slt        s7, zero, s2
                  c.add      s4, a4
                  c.slli     t5, 22
                  srli       t6, a3, 19
                  sltu       s0, a7, ra
                  slli       t6, a2, 15
                  divu       s11, t2, s9
                  c.addi     s3, -1
                  csrrwi     s1, 0x340, 20
                  lui        a5, 611894
                  slt        a6, t6, gp
                  remu       t5, a3, a0
                  mul        s4, a0, a4
                  c.srli     s0, 3
                  slt        a1, tp, s11
                  lui        a1, 268114
                  srli       a0, s5, 5
                  srli       t3, t0, 9
                  c.and      a5, a2
                  sub        a2, s6, s6
                  c.xor      a3, s1
                  ori        s9, s5, 509
                  mulhsu     a6, s6, ra
                  addi       zero, sp, -666
                  c.mv       ra, t0
                  remu       s2, a0, s11
                  c.add      s4, t0
                  mulh       t1, a0, t4
                  mulh       a0, a3, s1
                  or         a4, s2, t1
                  c.xor      a4, a1
                  csrrc      s9, 0x340, a3
                  c.srai     a4, 20
                  c.srai     a2, 19
                  c.add      s2, s8
                  c.and      a1, a1
                  mulhsu     gp, s11, s8
                  nop
                  srai       s1, t4, 20
                  csrrwi     t1, 0x340, 13
                  csrrci     a3, 0x340, 27
                  c.slli     t1, 25
                  sltiu      a2, a5, -375
                  csrrw      tp, 0x340, a7
                  add        s7, s2, t0
                  nop
                  c.sub      s0, a0
                  mulhsu     a1, a2, t5
                  sll        s1, s9, tp
                  slt        ra, a7, zero
                  xori       t3, a5, 908
                  c.slli     a5, 8
                  remu       t0, s3, s2
                  addi       t3, s6, -954
                  rem        s9, a3, s11
                  div        ra, s10, zero
                  c.andi     a0, 20
                  mulhu      a7, sp, s1
                  add        s2, t2, zero
                  sll        a7, a0, t2
                  slli       s4, a3, 29
                  c.slli     a2, 2
                  add        a5, s0, t1
                  or         s1, a0, s5
                  c.or       a2, a1
                  c.or       s1, a1
                  c.slli     a4, 30
                  sll        gp, s2, t0
                  lui        t5, 576499
                  mulhu      t6, t1, a3
                  c.slli     s6, 11
                  sltu       t5, s6, s1
                  c.slli     a7, 2
                  csrrci     s0, 0x340, 7
                  xori       a2, s2, -323
                  sltiu      s1, s1, 592
                  rem        t2, t0, gp
                  mulhsu     a1, a7, s7
                  xor        a6, s11, a7
                  csrrw      s10, 0x340, s9
                  andi       a7, s4, 357
                  c.slli     t3, 4
                  c.andi     s0, -1
                  srai       s1, s1, 27
                  andi       zero, ra, 95
                  addi       s1, s1, 773
                  csrrci     s11, 0x340, 4
                  c.li       a7, -1
                  slt        t4, t1, s5
                  remu       s7, ra, sp
                  c.li       tp, -1
                  sra        s4, s11, s3
                  ori        zero, t6, -805
                  c.addi     s4, -1
                  c.slli     a2, 15
                  srai       a7, s2, 27
                  mul        s0, s0, a6
                  c.srai     s0, 28
                  c.add      t5, s5
                  c.srli     s1, 15
                  csrrw      a7, 0x340, s5
                  mul        s0, sp, s7
                  xori       a3, ra, -993
                  srli       a6, s1, 20
                  slli       a0, ra, 29
                  mul        t4, t0, a4
                  srl        s0, s1, t2
                  c.and      a0, a4
                  csrrs      tp, 0x340, t5
                  addi       s10, a1, 361
                  auipc      a2, 322763
                  sub        t0, zero, a5
                  c.or       a2, a3
                  c.andi     s1, 8
                  csrrc      a0, 0x340, sp
                  rem        s10, a1, t0
                  nop
                  c.and      a5, a3
                  mulhu      s10, t3, a3
                  c.sub      a0, a4
                  mulhsu     t3, a4, s1
                  c.srai     a2, 26
                  remu       ra, s2, s7
                  mulhu      s7, s3, a2
                  c.add      gp, gp
                  add        t0, s11, s5
                  c.slli     a2, 28
                  csrrw      zero, 0x340, t3
                  mulhu      t0, sp, zero
                  c.nop
                  add        s9, a6, t5
                  csrrci     s11, 0x340, 1
                  mulh       t3, a2, a7
                  c.lui      a5, 1
                  ori        t3, t2, 425
                  csrrsi     a0, 0x340, 24
                  slt        s6, gp, s6
                  csrrci     t2, 0x340, 26
                  c.srai     a3, 11
                  srl        s2, s10, gp
                  divu       a1, s0, s8
                  lui        s7, 493231
                  ori        gp, s10, 593
                  csrrci     a2, 0x340, 14
                  c.xor      s1, s1
                  mul        a6, a1, t3
                  srl        a5, s8, a0
                  c.xor      s0, s0
                  sltu       a4, t0, s3
                  csrrs      gp, 0x340, a1
                  c.slli     tp, 22
                  csrrc      s4, 0x340, a3
                  csrrc      a0, 0x340, s8
                  c.srai     a4, 7
                  div        t6, a2, s1
                  auipc      a7, 54253
                  sltiu      s11, s7, -177
                  rem        a5, a5, t4
                  c.add      t0, a0
                  c.andi     a3, -1
                  c.and      a3, a4
                  and        a1, gp, s3
                  c.sub      a2, s0
                  sub        tp, s10, t6
                  c.xor      s0, a4
                  c.srli     a2, 22
                  csrrsi     t4, 0x340, 31
                  c.lui      a6, 26
                  mulhu      a0, s5, a3
                  c.slli     s1, 14
                  srai       a6, t4, 0
                  c.add      t0, gp
                  mulhsu     t0, s5, a2
                  csrrsi     a2, 0x340, 0
                  xori       ra, s9, 764
                  c.lui      s7, 6
                  lui        t6, 977104
                  c.add      s1, tp
                  csrrw      a6, 0x340, a1
                  slti       s9, a1, -482
                  xor        t2, a5, a5
                  or         a5, s6, s6
                  srli       s3, s11, 9
                  addi       t4, a5, 709
                  sltu       a1, a4, a1
                  mulh       t3, s7, a0
                  c.srli     a5, 3
                  mulh       s0, s6, a4
                  slti       s3, ra, -715
                  c.andi     a2, -1
                  c.srli     a1, 13
                  srl        s9, t3, t5
                  c.or       a3, a2
                  or         t2, t6, a6
                  nop
                  csrrc      t4, 0x340, s6
                  c.li       a7, -1
                  sltiu      t4, s9, 421
                  xori       s1, a4, -701
                  c.or       a0, s1
                  csrrwi     s3, 0x340, 3
                  c.xor      a1, a2
                  c.and      s0, a1
                  srai       ra, t1, 1
                  sltu       t3, s11, zero
                  sltu       a1, t1, t5
                  csrrs      s10, 0x340, a3
                  c.xor      a3, a4
                  mulh       a4, gp, a3
                  divu       t6, s11, a4
                  c.lui      t3, 13
                  sub        t0, s10, a3
                  addi       s6, sp, 764
                  slt        t0, s7, s0
                  c.slli     t5, 24
                  c.lui      s11, 17
                  sltu       t1, s11, a0
                  div        a3, t1, t0
                  sltu       s6, s7, a0
                  ori        t6, s1, 549
                  c.and      s0, a4
                  add        s11, t0, s7
                  nop
                  c.or       a2, a3
                  slli       a0, s6, 0
                  c.and      s1, s1
                  srai       gp, a7, 20
                  mulhsu     s0, a2, ra
                  srai       zero, a2, 4
                  mulhsu     a2, s4, t1
                  c.addi     tp, 28
                  c.slli     s11, 9
                  mulhu      a2, t0, s9
                  addi       s6, s3, -632
                  c.mv       s4, t4
                  mulhu      s10, a2, s1
                  div        a0, t6, s10
                  mulhu      t5, s7, s2
                  sltu       a3, s9, a3
                  c.or       a4, s1
                  c.slli     s10, 12
                  remu       a2, t0, a3
                  auipc      a0, 805015
                  sltu       t0, s4, gp
                  c.andi     a1, 13
                  c.li       a2, -1
                  mulhsu     s6, s9, s7
                  xori       s9, s5, 734
                  add        s6, tp, t6
                  csrrc      t3, 0x340, t5
                  csrrs      t2, 0x340, s1
                  slli       t6, ra, 28
                  addi       tp, s2, -837
                  srli       t5, zero, 19
                  c.add      a6, a2
                  sra        gp, a5, t0
                  slt        t3, a2, ra
                  divu       zero, a0, sp
                  srai       s4, s2, 3
                  mulhu      a7, a3, a5
                  csrrsi     s9, 0x340, 6
                  rem        a7, s11, t6
                  csrrsi     s0, 0x340, 11
                  c.xor      a1, s1
                  srl        tp, s0, s6
                  c.srli     s1, 9
                  or         t5, a5, s9
                  c.mv       t0, a7
                  mulh       t1, gp, s2
                  srli       s2, a3, 31
                  mulh       s11, s11, sp
                  c.srli     a1, 8
                  c.sub      a5, a1
                  c.lui      s1, 15
                  c.lui      s3, 27
                  slt        s7, tp, a3
                  rem        a0, a3, t4
                  csrrw      s9, 0x340, s5
                  csrrwi     s1, 0x340, 17
                  mulhu      s4, t5, s7
                  c.nop
                  csrrwi     a6, 0x340, 11
                  srli       s3, s2, 23
                  nop
                  addi       zero, a2, 477
                  divu       s3, s8, s6
                  c.li       s6, 8
                  c.xor      a0, a5
                  lui        s11, 1005739
                  c.nop
                  nop
                  mul        tp, t1, a3
                  nop
                  auipc      s3, 131917
                  csrrsi     s4, 0x340, 7
                  rem        ra, t1, a4
                  c.and      s0, a3
                  c.and      s0, a0
                  lui        t6, 597308
                  xor        t6, s1, s10
                  slli       t0, s5, 20
                  sltu       s0, a6, s7
                  xor        a6, s8, s3
                  mulhsu     ra, a1, t1
                  srl        t4, s11, s0
                  slti       a7, s7, -183
                  csrrs      ra, 0x340, a0
                  slli       a3, t6, 27
                  div        a2, t2, s0
                  remu       t2, sp, s2
                  mulhu      a2, a0, s6
                  srli       t1, a6, 0
                  slti       s4, s7, -900
                  srai       zero, t0, 31
                  sll        t2, a0, a7
                  mulhsu     s6, gp, a2
                  c.and      s1, a1
                  and        t5, s6, a0
                  mulhsu     s6, s8, a7
                  sltu       a3, t1, s3
                  mul        t4, a1, a6
                  csrrci     s9, 0x340, 18
                  c.xor      a1, a5
                  or         t2, t2, tp
                  csrrsi     t1, 0x340, 20
                  divu       s10, t5, s4
                  c.lui      s3, 27
                  nop
                  c.sub      a2, a5
                  slt        s4, s4, s4
                  csrrwi     s3, 0x340, 18
                  lui        a2, 63322
                  xor        s2, t1, a7
                  c.add      s3, a5
                  sltu       t3, a7, s4
                  sltu       t0, s10, a4
                  remu       t1, sp, a5
                  mulh       s0, t6, t0
                  or         t1, t5, t0
                  srai       tp, t0, 6
                  c.slli     t3, 2
                  srai       a1, t4, 28
                  c.add      a1, a1
                  xori       s10, ra, -900
                  lui        t3, 557129
                  div        t0, t1, s3
                  c.nop
                  divu       s2, t3, s11
                  sltiu      s1, t5, -292
                  rem        s1, s5, zero
                  rem        a2, s10, a5
                  slt        zero, t6, zero
                  c.addi     s11, 20
                  divu       s2, sp, t4
                  sll        s7, s10, s6
                  xori       s0, s8, 756
                  sub        s10, a7, t3
                  xor        s10, t3, s0
                  c.mv       a2, t1
                  slti       s9, tp, -732
                  c.lui      a2, 22
                  add        t6, tp, a7
                  srl        t6, a5, s3
                  auipc      s3, 178181
                  mulhu      zero, t6, t3
                  c.or       a0, a0
                  csrrc      t5, 0x340, tp
                  divu       t3, s1, t5
                  div        a0, zero, s9
                  slt        a2, s5, zero
                  csrrwi     s0, 0x340, 11
                  c.and      a3, s0
                  and        s11, s7, t4
                  sll        tp, s2, tp
                  sub        t1, t2, a5
                  xor        s4, s2, t2
                  c.srai     a4, 3
                  slti       a4, t1, 1018
                  lui        s10, 808512
                  div        a3, s3, s0
                  xori       a6, ra, 110
                  sub        s7, s3, s4
                  c.nop
                  csrrc      s11, 0x340, s1
                  csrrw      tp, 0x340, a2
                  addi       zero, s8, -659
                  remu       t3, s0, gp
                  c.xor      a3, s1
                  slli       s0, gp, 0
                  lui        ra, 520524
                  mulhsu     s6, t6, a4
                  c.xor      s0, a5
                  sltiu      t1, t4, 986
                  rem        a5, t0, s7
                  c.or       a0, s0
                  c.srai     a0, 29
                  lui        t0, 666268
                  addi       t3, t4, 206
                  c.or       a3, a1
                  remu       a7, a0, s6
                  slli       a1, s6, 0
                  xor        s3, s0, a1
                  c.xor      a1, a4
                  csrrs      a2, 0x340, s2
                  c.lui      a3, 25
                  c.sub      a5, s1
                  c.andi     a5, -1
                  csrrw      a4, 0x340, s2
                  xor        s2, a2, a2
                  c.srai     s0, 7
                  sltu       s11, s3, sp
                  csrrwi     s6, 0x340, 1
                  c.nop
                  xor        a0, s11, s9
                  add        a5, s4, t5
                  mulh       ra, a3, a7
                  mulh       s10, s7, s10
                  c.lui      a5, 2
                  c.add      gp, sp
                  csrrci     ra, 0x340, 9
                  c.mv       a1, t1
                  add        t3, a3, s3
                  add        t2, sp, a2
                  sltu       a7, s6, gp
                  sub        s0, a4, t4
                  and        s6, s9, s11
                  c.lui      gp, 20
                  rem        a6, t4, a7
                  sltiu      s3, a0, -667
                  csrrwi     a3, 0x340, 11
                  sub        t0, t2, t4
                  xori       s7, s6, 990
                  csrrci     gp, 0x340, 7
                  xori       t4, a1, 111
                  slli       s9, t0, 30
                  divu       s1, s9, tp
                  rem        s9, a5, s9
                  remu       a3, t3, a6
                  c.li       s6, 15
                  csrrs      s9, 0x340, t5
                  slti       tp, a6, -1024
                  c.srai     s1, 27
                  c.mv       a7, a1
                  slt        s2, zero, a2
                  slli       s10, s10, 0
                  c.mv       a0, gp
                  c.mv       s3, s6
                  mulh       s10, s0, a7
                  c.srai     a1, 17
                  and        t3, t5, sp
                  xor        t6, s0, a2
                  and        t6, s4, t2
                  auipc      t4, 948932
                  c.nop
                  addi       s4, ra, -678
                  c.slli     gp, 27
                  c.xor      a0, s0
                  rem        t0, t4, t2
                  c.xor      a5, a0
                  c.lui      s4, 20
                  c.addi     t6, -1
                  auipc      t4, 416684
                  mulh       a3, a0, ra
                  remu       s2, s4, zero
                  csrrwi     a3, 0x340, 27
                  c.andi     a2, -1
                  c.add      s11, t1
                  mulhsu     s11, t5, s1
                  srai       s4, a7, 3
                  xori       a4, gp, -680
                  rem        tp, s1, t2
                  or         s4, s3, s10
                  divu       t4, a2, a3
                  slti       s0, a6, -519
                  csrrwi     s10, 0x340, 19
                  c.slli     t0, 24
                  srai       gp, ra, 4
                  c.andi     a2, 6
                  mulhu      zero, s6, sp
                  csrrs      a7, 0x340, t5
                  c.add      t5, a3
                  xori       a4, s9, 883
                  lui        t2, 961334
                  mulh       a6, t4, s2
                  lui        t1, 398562
                  c.mv       s0, s8
                  xori       ra, s9, 220
                  andi       a6, a6, 348
                  mulhsu     gp, t0, t2
                  srai       a4, s10, 29
                  mulhsu     zero, s9, a2
                  or         zero, s5, s7
                  c.sub      s1, a5
                  c.andi     a2, 13
                  c.xor      a5, a4
                  csrrsi     s1, 0x340, 20
                  addi       t5, s3, 715
                  c.srai     a0, 31
                  rem        t0, t2, s4
                  c.add      s0, a3
                  mul        t1, a6, a6
                  c.li       t0, 14
                  c.sub      a2, a5
                  srai       t5, ra, 21
                  andi       zero, t5, 837
                  c.nop
                  sltu       s0, t5, a2
                  c.srai     a0, 3
                  c.addi     a6, -1
                  mul        a0, s5, t2
                  csrrsi     t2, 0x340, 27
                  sll        s0, a3, sp
                  slt        zero, s5, t0
                  sra        s4, t2, zero
                  csrrc      s4, 0x340, t6
                  csrrw      t2, 0x340, s5
                  c.li       s6, 22
                  slt        a7, t2, t3
                  or         a3, t5, s5
                  mul        a3, t0, s4
                  c.srli     a0, 14
                  sll        a7, t3, zero
                  csrrw      s7, 0x340, t3
                  c.or       s0, a5
                  slt        s3, a4, a7
                  c.xor      s1, a3
                  c.or       a2, s1
                  sltu       gp, t4, a5
                  csrrw      t1, 0x340, s5
                  addi       s2, s11, 221
                  div        s4, a5, t4
                  srl        s2, a4, s9
                  csrrwi     ra, 0x340, 3
                  c.slli     t1, 9
                  nop
                  mulhsu     a1, t2, tp
                  c.li       a7, -1
                  srli       a3, zero, 26
                  sltu       t5, s5, a2
                  slt        t0, zero, a7
                  sltu       a1, a2, s11
                  c.mv       s11, t1
                  div        s7, ra, ra
                  csrrc      a2, 0x340, s6
                  csrrc      s1, 0x340, zero
                  mulhsu     a2, a4, t1
                  mulh       s7, t5, a0
                  srai       a1, s5, 21
                  sltiu      a3, ra, -667
                  xori       zero, t5, 863
                  c.xor      s0, a5
                  c.or       a4, a2
                  csrrci     tp, 0x340, 27
                  c.or       a0, a1
                  srli       t5, a6, 0
                  mulhsu     s9, s9, s8
                  c.or       a3, a3
                  srli       s11, s11, 23
                  c.xor      s0, a3
                  mulh       tp, tp, s5
                  nop
                  ori        ra, a0, -921
                  c.andi     a0, -1
                  rem        a4, t2, s0
                  addi       t0, a7, -511
                  or         a6, s3, s6
                  mul        a4, s2, a7
                  c.sub      a3, s0
                  mulh       t6, a2, s2
                  csrrci     s7, 0x340, 8
                  csrrci     t5, 0x340, 24
                  c.slli     ra, 3
                  or         t3, a4, s1
                  sub        s1, s10, s4
                  c.nop
                  c.sub      a2, a2
                  sll        s4, a2, tp
                  or         a4, zero, s7
                  c.andi     a3, 6
                  csrrwi     s11, 0x340, 25
                  addi       t2, a4, -603
                  csrrs      t6, 0x340, t5
                  sltu       t6, s6, t3
                  c.or       s1, a5
                  c.nop
                  c.li       t1, 10
                  c.or       a0, s0
                  slt        tp, sp, ra
                  sltiu      s4, ra, -873
                  addi       a7, a6, -2
                  sll        s2, a0, s0
                  c.lui      s0, 27
                  or         s1, tp, a4
                  slli       a1, t6, 22
                  sll        t0, t2, t6
                  c.mv       ra, t0
                  nop
                  sra        a4, t5, t2
                  xori       a3, s3, 294
                  sra        s1, s11, a2
                  c.li       a1, -1
                  andi       gp, s3, 996
                  c.nop
                  srai       a6, a1, 1
                  auipc      t2, 834669
                  div        a5, s1, s11
                  sll        s6, a2, s5
                  srl        a4, a0, a3
                  c.or       s0, a3
                  csrrsi     a2, 0x340, 29
                  rem        t4, s9, s1
                  c.addi     a1, 10
                  mulhu      t4, a6, a7
                  sltiu      t3, a1, -405
                  andi       a4, zero, -173
                  csrrc      t3, 0x340, a7
                  xori       t6, s3, -1009
                  c.srli     a4, 17
                  c.srai     a0, 23
                  csrrw      s0, 0x340, t3
                  slli       s7, a0, 9
                  nop
                  c.mv       a7, s0
                  c.xor      a3, s0
                  and        s9, t4, t1
                  and        s4, s2, s9
                  csrrci     s4, 0x340, 4
                  mulh       t6, zero, a6
                  and        a0, s0, s11
                  c.and      a4, s0
                  ori        t3, t5, -114
                  add        s3, zero, sp
                  addi       t4, s0, -62
                  mulhsu     t1, t6, zero
                  or         s9, gp, s1
                  div        s4, s1, a2
                  csrrsi     tp, 0x340, 31
                  divu       s6, a2, gp
                  c.slli     gp, 28
                  c.slli     a5, 26
                  csrrwi     s10, 0x340, 0
                  or         ra, a6, t6
                  c.srli     a4, 10
                  c.andi     s0, -1
                  csrrsi     a2, 0x340, 0
                  sub        t3, t6, s9
                  csrrwi     s2, 0x340, 8
                  andi       s4, a3, -678
                  mul        t3, a4, ra
                  c.andi     s1, 9
                  c.mv       s3, t0
                  c.sub      a2, a1
                  mulhu      t1, ra, t6
                  sltiu      s9, s9, -48
                  csrrci     t3, 0x340, 22
                  c.sub      a4, a5
                  and        a7, t3, s8
                  xori       s10, s2, -690
                  xori       t3, ra, 289
                  and        a4, s10, sp
                  mul        s11, s11, t3
                  rem        t2, s0, a1
                  mulhsu     t1, s2, s1
                  or         a5, tp, sp
                  mulh       a2, s6, s7
                  csrrci     s7, 0x340, 16
                  c.xor      a4, s1
                  csrrwi     zero, 0x340, 1
                  mulhsu     a1, s7, t3
                  sub        t6, a5, sp
                  c.li       s9, -1
                  xor        s0, tp, s8
                  c.or       a5, a0
                  c.lui      s9, 21
                  and        t4, zero, a2
                  c.andi     a4, 20
                  c.lui      gp, 4
                  c.mv       ra, s1
                  addi       s7, s11, -970
                  c.and      a1, a5
                  csrrsi     t5, 0x340, 3
                  div        t6, s3, a6
                  auipc      tp, 1044887
                  csrrs      s4, 0x340, a2
                  xor        t5, a1, a6
                  slt        s10, t1, a0
                  sra        a4, t2, s11
                  c.li       s6, 22
                  c.sub      a2, a1
                  csrrsi     a3, 0x340, 12
                  mulhsu     s3, a7, a3
                  divu       gp, s9, a3
                  srl        s6, a5, t2
                  div        t1, tp, s3
                  addi       a5, a5, -204
                  c.or       a0, s1
                  c.xor      a5, a4
                  sltiu      a3, s11, 578
                  sltiu      t5, t2, -836
                  c.mv       ra, a0
                  sll        s4, s3, a7
                  divu       t0, t1, s0
                  rem        s7, s9, a2
                  c.srai     s0, 31
                  sll        a2, zero, s2
                  nop
                  xor        t4, a3, t6
                  c.li       a5, -1
                  mul        a2, s11, zero
                  c.and      a1, s0
                  add        s11, a0, tp
                  c.mv       a6, a4
                  c.li       s11, 12
                  csrrwi     a5, 0x340, 31
                  mulhsu     a3, t4, t2
                  slti       s7, a0, -466
                  nop
                  lui        s1, 597847
                  nop
                  csrrsi     s7, 0x340, 11
                  nop
                  csrrw      t5, 0x340, a4
                  and        a0, t3, s2
                  c.add      s9, s4
                  srl        tp, s6, t0
                  mulhsu     s3, zero, a5
                  csrrs      s0, 0x340, s8
                  auipc      s0, 177858
                  c.srai     a1, 30
                  c.li       a3, 26
                  addi       a0, s7, -260
                  ori        t3, sp, 790
                  c.srli     s1, 2
                  andi       tp, t5, -537
                  c.sub      s1, a2
                  csrrc      t1, 0x340, s2
                  csrrc      a3, 0x340, a3
                  mulhsu     ra, s10, s2
                  sltu       s4, zero, a5
                  csrrci     tp, 0x340, 2
                  c.nop
                  ori        s10, a2, -825
                  c.lui      ra, 1
                  divu       t5, a0, s9
                  mul        a0, a4, s2
                  csrrwi     t4, 0x340, 29
                  ori        a3, a1, 396
                  slli       t0, t5, 3
                  xori       s10, t4, -413
                  and        a2, s2, a2
                  rem        s11, gp, s5
                  add        t4, s4, a3
                  csrrw      t4, 0x340, t6
                  c.and      a1, a3
                  sltiu      s0, t1, -374
                  c.addi     a1, -1
                  xori       s7, zero, -776
                  c.li       a1, -1
                  slti       s3, s7, 233
                  xor        t6, a1, t3
                  mulhu      t5, s8, s3
                  xor        s4, a5, a6
                  ori        t2, a0, 16
                  slli       a3, s0, 29
                  c.or       a1, a0
                  c.lui      a3, 25
                  c.slli     a0, 31
                  srli       gp, s7, 19
                  sltu       t3, t6, s9
                  slti       s2, s6, 315
                  c.li       s3, 15
                  sub        a4, a1, s0
                  c.add      gp, a3
                  divu       a1, t3, t0
                  add        s9, s0, a4
                  slt        a4, a3, s0
                  csrrw      gp, 0x340, a6
                  srli       t5, a2, 22
                  c.mv       t2, t5
                  slli       s11, s7, 19
                  mulhu      a4, t6, t0
                  sll        a4, s2, a7
                  csrrw      s7, 0x340, s1
                  ori        s1, s2, -946
                  addi       s0, sp, -580
                  mulhu      a3, s9, t3
                  csrrsi     a5, 0x340, 18
                  or         t6, a5, a2
                  srl        a6, s9, a1
                  ori        t4, s5, 955
                  rem        t0, t2, a6
                  csrrsi     s4, 0x340, 7
                  auipc      a5, 510422
                  mul        tp, a1, s8
                  mulhu      s0, a7, t4
                  ori        tp, s8, 280
                  mulh       s10, t0, s0
                  srai       a2, s9, 12
                  csrrci     t5, 0x340, 7
                  sra        a6, t2, s2
                  c.add      a6, t3
                  slti       s10, t2, -193
                  divu       s4, s6, zero
                  slt        s3, sp, t0
                  csrrci     s9, 0x340, 14
                  srli       s1, s7, 31
                  div        gp, t0, s8
                  csrrc      s9, 0x340, tp
                  srli       s2, s4, 24
                  c.xor      a4, s1
                  csrrsi     a0, 0x340, 10
                  slti       t0, t5, -993
                  c.li       s3, -1
                  slti       s10, s9, 937
                  mulhsu     s3, t5, t4
                  mul        s6, t2, s5
                  csrrwi     a5, 0x340, 7
                  c.and      s1, a5
                  csrrsi     s11, 0x340, 12
                  lui        gp, 64100
                  srl        a0, s3, s2
                  slti       t2, s9, 134
                  csrrc      a7, 0x340, a1
                  mulhu      t2, s8, s3
                  divu       s4, s5, s4
                  div        a1, sp, tp
                  addi       a4, t2, -593
                  csrrs      ra, 0x340, a0
                  c.sub      a2, a1
                  div        a6, s3, a5
                  slti       t3, a1, -357
                  csrrw      ra, 0x340, s3
                  xori       a1, t0, 300
                  mulh       s3, t4, s7
                  c.srli     s1, 31
                  div        a7, a1, a0
                  c.nop
                  xori       s7, a5, 289
                  csrrsi     s2, 0x340, 27
                  csrrc      tp, 0x340, a2
                  auipc      t0, 437657
                  andi       s3, s2, -951
                  lui        t5, 841929
                  rem        a0, zero, a6
                  nop
                  and        t5, s8, s5
                  sub        zero, s11, s9
                  c.andi     a5, 24
                  csrrci     s9, 0x340, 27
                  nop
                  c.lui      s0, 5
                  rem        a3, s1, s0
                  mul        s7, s5, a5
                  csrrsi     a4, 0x340, 5
                  csrrwi     t3, 0x340, 22
                  mulhu      t1, a5, t5
                  c.addi     a3, -1
                  sltiu      a2, tp, -55
                  c.nop
                  c.srli     a4, 5
                  xor        s9, s11, t0
                  mulhsu     s0, gp, a0
                  mulhu      s4, s9, t6
                  nop
                  andi       s10, a1, 776
                  or         s10, t4, sp
                  csrrs      zero, 0x340, s11
                  addi       a6, tp, 685
                  divu       s10, t4, t5
                  mulhsu     a1, sp, s6
                  c.andi     a1, -1
                  slti       s9, tp, -328
                  remu       s7, gp, s9
                  c.srai     a1, 20
                  and        t4, ra, tp
                  c.sub      a5, a4
                  c.nop
                  mulhsu     s6, s3, t4
                  xori       a0, a6, -675
                  csrrsi     t3, 0x340, 0
                  slli       zero, ra, 15
                  csrrc      a4, 0x340, zero
                  mulh       s6, sp, t2
                  auipc      ra, 461196
                  or         t0, s3, sp
                  sll        t6, t1, a7
                  c.li       a1, -1
                  csrrci     s9, 0x340, 17
                  rem        s10, a3, s8
                  c.mv       s7, s0
                  c.sub      a1, a1
                  divu       ra, s3, gp
                  c.mv       s6, a1
                  c.srli     a1, 2
                  c.xor      a1, a0
                  sltu       s0, a5, t3
                  csrrs      s4, 0x340, ra
                  remu       a5, s8, s9
                  and        t0, t3, t5
                  mulhu      a3, s6, gp
                  mulhsu     s9, s1, t4
                  csrrc      s9, 0x340, t0
                  xor        a6, t5, s8
                  slt        t3, t4, s0
                  c.add      s4, a6
                  c.add      a6, tp
                  csrrc      s3, 0x340, a0
                  csrrw      t2, 0x340, t6
                  sll        s2, a0, a0
                  ori        s9, t1, 655
                  srai       zero, a6, 1
                  c.srli     a2, 3
                  div        s0, s4, a0
                  nop
                  mulhsu     s7, a1, a7
                  mul        t4, s11, t6
                  and        ra, s7, s3
                  csrrsi     a5, 0x340, 6
                  slli       tp, t5, 8
                  srl        t4, a6, s4
                  rem        s9, s2, t0
                  slt        a4, a7, a6
                  la x21, test_done
                  jalr x0, x21, 0
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

debug_rom:        
                  dret

debug_exception:  
                  dret

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
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
                  csrr  x16, 0x341
                  addi  x16, x16, 4
                  csrw  0x341, x16
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 124
                  mret

illegal_instr_handler:
                  csrr  x16, 0x341
                  addi  x16, x16, 4
                  csrw  0x341, x16
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x16, 0x300 # MSTATUS;
                  csrr  x16, 0x304 # MIE;
                  csrr  x16, 0x344 # MIP;
                  csrrc x16, 0x344, x16 # MIP;
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 124
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
