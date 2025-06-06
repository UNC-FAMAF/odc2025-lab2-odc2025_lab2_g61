 .globl nose
nose:
  
	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xFF
	bl build_color
	movz x5, 500
	movz x8, 40
	movz x6, 60
	movz x9, 120
	bl triangle_0

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xFF
	bl build_color
	movz x5, 500
	movz x8, 40
	movz x6, 60
	movz x9, 120
	bl triangle_1

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xFF
	bl build_color
	movz x5, 500
	movz x8, 160
	movz x6, 60
	movz x9, 120
	bl triangle_2

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xFF
	bl build_color
	movz x5, 440
	movz x8, 160
	movz x6, 60
	movz x9, 120
	bl triangle_3

  RET
