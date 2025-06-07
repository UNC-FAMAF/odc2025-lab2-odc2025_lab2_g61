  .globl nose1
nose1:

  SUB    SP, SP, #16
  STP    X29, X30, [SP]     // store old FP, old LR at [SP+0] and [SP+8]
  MOV    X29, SP            // new frame pointer (not used here except to restore)

// background

    // Rombo 1
    movz x22, #20
    movz x23, #34
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0

    // Rombo 2
    movz x22, #360
    movz x23, #120
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0

    // Rombo 3
    movz x22, #440
    movz x23, #13
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0


    // Rombo 4
    movz x22, #70
    movz x23, #320
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0

    // Rombo 5
    movz x22, #400
    movz x23, #325
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0

    // Rombo 6
    movz x22, #560
    movz x23, #320
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0

    // Rombo 7
    movz x22, #25
    movz x23, #420
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0

    // Rombo 8
    movz x22, #300
    movz x23, #30
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0

    // Rombo 9
    movz x22, #160
    movz x23, #10
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0

    // Rombo 10
    movz x22, #600
    movz x23, #100
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0

    // Rombo 11
	movz x22, #5
    movz x23, #240
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; mov x8, x23; movz x6, 60; movz x9, 30; bl rectangle
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; add x5, x22, #30; mov x8, x23; movz x6, 30; movz x9, 30; bl triangle_0
    movz x1, 0xFF; movz x2, 0x95; movz x3, 0xA5; movz x4, 0xA6; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 60; movz x9, 30; bl rectangle
    movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; add x5, x22, #30; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_1
	movz x1, 0xFF; movz x2, 0xB5; movz x3, 0xCA; movz x4, 0xD5; bl build_color; mov x5, x22; add x8, x23, #30; movz x6, 30; movz x9, 30; bl triangle_0
 
































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
 	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 160
	movz x8, 280
	movz x6, 80
	movz x9, 60
	bl rectangle

	movz x1, 0xFF
 	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 240
	movz x8, 280
	movz x6, 80
	movz x9, 60
	bl triangle_0

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 220
	movz x6, 40
	movz x8, 340
	movz x9, 40
	bl ellipse

  LDP    X29, X30, [SP]     // restore old FP, old LR
  ADD    SP, SP, #16

	RET
