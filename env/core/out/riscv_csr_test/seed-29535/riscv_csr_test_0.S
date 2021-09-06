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
	li x11, 0xa5a5a5a5
	csrrs x13, 769, x11
	li x11, 0x40101104
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 769, x11
	li x11, 0x40101104
	bne x11, x13, csr_fail
	li x11, 0x1b72f622
	csrrs x13, 769, x11
	li x11, 0x40101104
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 769, x11
	li x11, 0x40101104
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 769, x11
	li x11, 0x40101104
	bne x11, x13, csr_fail
	li x11, 0xd12717c8
	csrrc x13, 769, x11
	li x11, 0x40101104
	bne x11, x13, csr_fail
	csrrwi x13, 769, 0b00101
	li x11, 0x40101104
	bne x11, x13, csr_fail
	csrrwi x13, 769, 0b11010
	li x11, 0x40101104
	bne x11, x13, csr_fail
	csrrwi x13, 769, 0b01110
	li x11, 0x40101104
	bne x11, x13, csr_fail
	csrrsi x13, 769, 0b00101
	li x11, 0x40101104
	bne x11, x13, csr_fail
	csrrsi x13, 769, 0b11010
	li x11, 0x40101104
	bne x11, x13, csr_fail
	csrrsi x13, 769, 0b10001
	li x11, 0x40101104
	bne x11, x13, csr_fail
	csrrci x13, 769, 0b00101
	li x11, 0x40101104
	bne x11, x13, csr_fail
	csrrci x13, 769, 0b11010
	li x11, 0x40101104
	bne x11, x13, csr_fail
	csrrci x13, 769, 0b11010
	li x11, 0x40101104
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
	li x11, 0xa5a5a5a5
	csrrs x13, 836, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 836, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x972ca483
	csrrs x13, 836, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 836, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 836, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x56de9c1e
	csrrc x13, 836, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 836, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 836, 0b11010
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 836, 0b00011
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrsi x13, 836, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrsi x13, 836, 0b11010
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrsi x13, 836, 0b00100
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrci x13, 836, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrci x13, 836, 0b11010
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrci x13, 836, 0b11000
	li x11, 0x00000000
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
	li x11, 0xa5a5a5a5
	csrrs x13, 772, x11
	li x11, 0x76590800
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 772, x11
	li x11, 0x77fd0880
	bne x11, x13, csr_fail
	li x11, 0xc5177dce
	csrrs x13, 772, x11
	li x11, 0x7fff0888
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 772, x11
	li x11, 0x7fff0888
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 772, x11
	li x11, 0x5a5a0808
	bne x11, x13, csr_fail
	li x11, 0x4a9a0041
	csrrc x13, 772, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 772, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 772, 0b11010
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 772, 0b01011
	li x11, 0x00000008
	bne x11, x13, csr_fail
	csrrsi x13, 772, 0b00101
	li x11, 0x00000008
	bne x11, x13, csr_fail
	csrrsi x13, 772, 0b11010
	li x11, 0x00000008
	bne x11, x13, csr_fail
	csrrsi x13, 772, 0b10001
	li x11, 0x00000008
	bne x11, x13, csr_fail
	csrrci x13, 772, 0b00101
	li x11, 0x00000008
	bne x11, x13, csr_fail
	csrrci x13, 772, 0b11010
	li x11, 0x00000008
	bne x11, x13, csr_fail
	csrrci x13, 772, 0b11000
	li x11, 0x00000000
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
	li x11, 0xa5a5a5a5
	csrrs x13, 832, x11
	li x11, 0x1638e599
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 832, x11
	li x11, 0xb7bde5bd
	bne x11, x13, csr_fail
	li x11, 0x6b215750
	csrrs x13, 832, x11
	li x11, 0xffffffff
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 832, x11
	li x11, 0xffffffff
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 832, x11
	li x11, 0x5a5a5a5a
	bne x11, x13, csr_fail
	li x11, 0x29f09736
	csrrc x13, 832, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 832, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 832, 0b11010
	li x11, 0x00000005
	bne x11, x13, csr_fail
	csrrwi x13, 832, 0b01000
	li x11, 0x0000001a
	bne x11, x13, csr_fail
	csrrsi x13, 832, 0b00101
	li x11, 0x00000008
	bne x11, x13, csr_fail
	csrrsi x13, 832, 0b11010
	li x11, 0x0000000d
	bne x11, x13, csr_fail
	csrrsi x13, 832, 0b00100
	li x11, 0x0000001f
	bne x11, x13, csr_fail
	csrrci x13, 832, 0b00101
	li x11, 0x0000001f
	bne x11, x13, csr_fail
	csrrci x13, 832, 0b11010
	li x11, 0x0000001a
	bne x11, x13, csr_fail
	csrrci x13, 832, 0b01100
	li x11, 0x00000000
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
	li x11, 0xa5a5a5a5
	csrrs x13, 833, x11
	li x11, 0xee1a51ac
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 833, x11
	li x11, 0xefbff5ac
	bne x11, x13, csr_fail
	li x11, 0x9d2efe32
	csrrs x13, 833, x11
	li x11, 0xfffffffe
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 833, x11
	li x11, 0xfffffffe
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 833, x11
	li x11, 0x5a5a5a5a
	bne x11, x13, csr_fail
	li x11, 0x5f46dc40
	csrrc x13, 833, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 833, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 833, 0b11010
	li x11, 0x00000004
	bne x11, x13, csr_fail
	csrrwi x13, 833, 0b11001
	li x11, 0x0000001a
	bne x11, x13, csr_fail
	csrrsi x13, 833, 0b00101
	li x11, 0x00000018
	bne x11, x13, csr_fail
	csrrsi x13, 833, 0b11010
	li x11, 0x0000001c
	bne x11, x13, csr_fail
	csrrsi x13, 833, 0b11011
	li x11, 0x0000001e
	bne x11, x13, csr_fail
	csrrci x13, 833, 0b00101
	li x11, 0x0000001e
	bne x11, x13, csr_fail
	csrrci x13, 833, 0b11010
	li x11, 0x0000001a
	bne x11, x13, csr_fail
	csrrci x13, 833, 0b11000
	li x11, 0x00000000
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
	li x11, 0xa5a5a5a5
	csrrs x13, 834, x11
	li x11, 0x00000019
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 834, x11
	li x11, 0x8000001d
	bne x11, x13, csr_fail
	li x11, 0x1a36b2b7
	csrrs x13, 834, x11
	li x11, 0x8000001f
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 834, x11
	li x11, 0x8000001f
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 834, x11
	li x11, 0x0000001a
	bne x11, x13, csr_fail
	li x11, 0xae5e0ffc
	csrrc x13, 834, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 834, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 834, 0b11010
	li x11, 0x00000005
	bne x11, x13, csr_fail
	csrrwi x13, 834, 0b11011
	li x11, 0x0000001a
	bne x11, x13, csr_fail
	csrrsi x13, 834, 0b00101
	li x11, 0x0000001b
	bne x11, x13, csr_fail
	csrrsi x13, 834, 0b11010
	li x11, 0x0000001f
	bne x11, x13, csr_fail
	csrrsi x13, 834, 0b00100
	li x11, 0x0000001f
	bne x11, x13, csr_fail
	csrrci x13, 834, 0b00101
	li x11, 0x0000001f
	bne x11, x13, csr_fail
	csrrci x13, 834, 0b11010
	li x11, 0x0000001a
	bne x11, x13, csr_fail
	csrrci x13, 834, 0b10111
	li x11, 0x00000000
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
	li x11, 0xa5a5a5a5
	csrrs x13, 835, x11
	li x11, 0x45c7a1fc
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 835, x11
	li x11, 0xe5e7a5fd
	bne x11, x13, csr_fail
	li x11, 0x4119c685
	csrrs x13, 835, x11
	li x11, 0xffffffff
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 835, x11
	li x11, 0xffffffff
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 835, x11
	li x11, 0x5a5a5a5a
	bne x11, x13, csr_fail
	li x11, 0x0b26f072
	csrrc x13, 835, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 835, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 835, 0b11010
	li x11, 0x00000005
	bne x11, x13, csr_fail
	csrrwi x13, 835, 0b11101
	li x11, 0x0000001a
	bne x11, x13, csr_fail
	csrrsi x13, 835, 0b00101
	li x11, 0x0000001d
	bne x11, x13, csr_fail
	csrrsi x13, 835, 0b11010
	li x11, 0x0000001d
	bne x11, x13, csr_fail
	csrrsi x13, 835, 0b10110
	li x11, 0x0000001f
	bne x11, x13, csr_fail
	csrrci x13, 835, 0b00101
	li x11, 0x0000001f
	bne x11, x13, csr_fail
	csrrci x13, 835, 0b11010
	li x11, 0x0000001a
	bne x11, x13, csr_fail
	csrrci x13, 835, 0b11000
	li x11, 0x00000000
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
	li x11, 0xa5a5a5a5
	csrrs x13, 773, x11
	li x11, 0xa6db6201
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 773, x11
	li x11, 0xa7ffe701
	bne x11, x13, csr_fail
	li x11, 0x1acc5506
	csrrs x13, 773, x11
	li x11, 0xffffff01
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 773, x11
	li x11, 0xffffff01
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 773, x11
	li x11, 0x5a5a5a01
	bne x11, x13, csr_fail
	li x11, 0x12244da5
	csrrc x13, 773, x11
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrwi x13, 773, 0b00101
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrwi x13, 773, 0b11010
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrwi x13, 773, 0b01110
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrsi x13, 773, 0b00101
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrsi x13, 773, 0b11010
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrsi x13, 773, 0b00111
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrci x13, 773, 0b00101
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrci x13, 773, 0b11010
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrci x13, 773, 0b10011
	li x11, 0x00000001
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
	li x11, 0xa5a5a5a5
	csrrs x13, 1984, x11
	li x11, 0x00000001
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 1984, x11
	li x11, 0x00000001
	bne x11, x13, csr_fail
	li x11, 0x22081877
	csrrs x13, 1984, x11
	li x11, 0x00000001
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 1984, x11
	li x11, 0x00000001
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 1984, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0xa7f39bdf
	csrrc x13, 1984, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 1984, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 1984, 0b11010
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrwi x13, 1984, 0b10001
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrsi x13, 1984, 0b00101
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrsi x13, 1984, 0b11010
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrsi x13, 1984, 0b00011
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrci x13, 1984, 0b00101
	li x11, 0x00000001
	bne x11, x13, csr_fail
	csrrci x13, 1984, 0b11010
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrci x13, 1984, 0b00110
	li x11, 0x00000000
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
	li x11, 0xa5a5a5a5
	csrrs x13, 1985, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrs x13, 1985, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x2fe96bac
	csrrs x13, 1985, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0xa5a5a5a5
	csrrc x13, 1985, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0x5a5a5a5a
	csrrc x13, 1985, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	li x11, 0xafc78854
	csrrc x13, 1985, x11
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 1985, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 1985, 0b11010
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrwi x13, 1985, 0b11011
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrsi x13, 1985, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrsi x13, 1985, 0b11010
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrsi x13, 1985, 0b10001
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrci x13, 1985, 0b00101
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrci x13, 1985, 0b11010
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrrci x13, 1985, 0b11000
	li x11, 0x00000000
	bne x11, x13, csr_fail
	csrr x13, 1985
	li x11, 0x00000000
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
