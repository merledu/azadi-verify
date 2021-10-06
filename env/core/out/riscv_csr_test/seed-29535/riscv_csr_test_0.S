.macro init
.endm
.section .text.init
.globl _start
.option norvc
_start:
	# misa
	li x11, 0xa5a5a5a5
	csrrw x13, 769, x11
	li x11, 0x40101104
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 769, x11
	li x11, 0x40101104
	bne x11, x13, csr_fail
	li x11, 0x6eb59ba1
	csrrw x13, 769, x11
	li x11, 0x40101104
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
    # mip
	li x11, 0xa5a5a5a5
	csrrw x13, 836, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 836, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0xb732f8b1
	csrrw x13, 836, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
    # mie
	li x11, 0xa5a5a5a5
	csrrw x13, 772, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 772, x11
	li x11, 0x25a50080
	bne x11, x13, csr_fail
	li x11, 0xf6599b70
	csrrw x13, 772, x11
	li x11, 0x5a5a0808
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
    # mscratch
	li x11, 0xa5a5a5a5
	csrrw x13, 832, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 832, x11
	li x11, 0xa5a5a5a5
	bne x11, x13, csr_fail
	li x11, 0x1638e599
	csrrw x13, 832, x11
	li x11, 0x5a5a5a5a
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
    # mepc
	li x11, 0xa5a5a5a5
	csrrw x13, 833, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 833, x11
	li x11, 0xa5a5a5a4
	bne x11, x13, csr_fail
	li x11, 0xee1a51ac
	csrrw x13, 833, x11
	li x11, 0x5a5a5a5a
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
    # mcause
	li x11, 0xa5a5a5a5
	csrrw x13, 834, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 834, x11
	li x11, 0x80000005
	bne x11, x13, csr_fail
	li x11, 0x3b648599
	csrrw x13, 834, x11
	li x11, 0x0000001a
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
    # mtval
	li x11, 0xa5a5a5a5
	csrrw x13, 835, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 835, x11
	li x11, 0xa5a5a5a5
	bne x11, x13, csr_fail
	li x11, 0x45c7a1fc
	csrrw x13, 835, x11
	li x11, 0x5a5a5a5a
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
    # mtvec
	li x11, 0xa5a5a5a5
	csrrw x13, 773, x11
	li x11, 0x80000001
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 773, x11
	li x11, 0xa5a5a501
	bne x11, x13, csr_fail
	li x11, 0xa6db628c
	csrrw x13, 773, x11
	li x11, 0x5a5a5a01
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
    # cpuctrl
	li x11, 0xa5a5a5a5
	csrrw x13, 1984, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 1984, x11
	li x11, 0x00000001
	bne x11, x13, csr_fail
	li x11, 0xb0952ea9
	csrrw x13, 1984, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
    # secureseed
	li x11, 0xa5a5a5a5
	csrrw x13, 1985, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrw x13, 1985, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x1ae83481
	csrrw x13, 1985, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
    ...
    bne x11, x13, csr_fail
csr_pass:
	li x1, 0
	slli x1, x1, 8
	addi x1, x1, 1
	li x2, 0x8ffffffc
	sw x1, 0(x2)
	j csr_pass
csr_fail:
	li x1, 1
	slli x1, x1, 8
	addi x1, x1, 1
	li x2, 0x8ffffffc
	sw x1, 0(x2)
	j csr_fail