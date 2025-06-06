  .globl nose1
nose1:
	
	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 320
	movz x6, 80
	movz x8, 240
	movz x9, 80
	bl ellipse

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xF0
	bl build_color
	movz x5, 500
	movz x8, 80
	movz x6, 100
	movz x9, 120
	bl triangle_0

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xF0
	bl build_color
	movz x5, 400
	movz x8, 80
	movz x6, 100
	movz x9, 120
	bl triangle_1

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xF0
	bl build_color
	movz x5, 400
	movz x8, 200
	movz x6, 100
	movz x9, 120
	bl triangle_3

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xF0
	bl build_color
	movz x5, 500
	movz x8, 200
	movz x6, 100
	movz x9, 120
	bl triangle_2

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x8C
	movz x4, 0x8C
	bl build_color
	movz x5, 300
	movz x6, 40
	movz x8, 220
	movz x9, 40
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0xF0
	movz x4, 0xF0
	bl build_color
	movz x5, 280
	movz x6, 20
	movz x8, 200
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xF0
	bl build_color
	movz x5, 58
	movz x8, 220
	movz x6, 82
	movz x9, 80
	bl triangle_3

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xF0
	bl build_color
	movz x5, 140
	movz x8, 220
	movz x6, 82
	movz x9, 80
	bl triangle_2

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xF0
	bl build_color
	movz x5, 100
	movz x6, 60
	movz x8, 170
	movz x9, 70
	bl ellipse

	movz x1, 0xFF
	movz x2, 0x46
	movz x3, 0x46
	movz x4, 0xF0
	bl build_color
	movz x5, 180
	movz x6, 60
	movz x8, 170
	movz x9, 70
	bl ellipse

	movz x1, 0xFF
	movz x2, 0x28
	movz x3, 0x00
	movz x4, 0x0A
	bl build_color
	movz x5, 140
	movz x6, 40
	movz x8, 200
	movz x9, 60
	bl ellipse

	movz x1, 0xFF
	movz x2, 0x28
	movz x3, 0x00
	movz x4, 0x0A
	bl build_color
	movz x5, 500
	movz x6, 40
	movz x8, 200
	movz x9, 60
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0xF0
	movz x4, 0xF0
	bl build_color
	movz x5, 130
	movz x6, 10
	movz x8, 180
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0xF0
	movz x4, 0xF0
	bl build_color
	movz x5, 490
	movz x6, 10
	movz x8, 180
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0x28
	movz x3, 0x00
	movz x4, 0x0A
	bl build_color
	movz x5, 220
	movz x6, 60
	movz x8, 340
	movz x9, 60
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0xF0
	movz x4, 0xF0
	bl build_color
	movz x5, 160
	movz x8, 280
	movz x6, 80
	movz x9, 60
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0xF0
	movz x4, 0xF0
	bl build_color
	movz x5, 240
	movz x8, 280
	movz x6, 80
	movz x9, 60
	bl triangle_0

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0xF0
	movz x4, 0xF0
	bl build_color
	movz x5, 220
	movz x6, 40
	movz x8, 340
	movz x9, 40
	bl ellipse



	ret
