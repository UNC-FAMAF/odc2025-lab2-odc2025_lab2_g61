  .globl odc
odc:
  
  SUB    SP, SP, #16
  STP    X29, X30, [SP]     // store old FP, old LR at [SP+0] and [SP+8]
  MOV    X29, SP            // new frame pointer (not used here except to restore

  movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 250
	movz x6, 20
	movz x8, 430
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 250
	movz x6, 20
	movz x8, 450
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 310
	movz x6, 20
	movz x8, 425
	movz x9, 15
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 310
	movz x6, 20
	movz x8, 450
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 370
	movz x6, 20
	movz x8, 430
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 370
	movz x6, 20
	movz x8, 450
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 430
	movz x6, 20
	movz x8, 430
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 490
	movz x6, 20
	movz x8, 430
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 490
	movz x6, 20
	movz x8, 450
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 550
	movz x6, 20
	movz x8, 430
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 610
	movz x6, 20
	movz x8, 450
	movz x9, 20
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 590
	movz x8, 410
	movz x6, 40
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 530
	movz x8, 450
	movz x6, 40
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 470
	movz x8, 430
	movz x6, 40
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 410
	movz x8, 450
	movz x6, 40
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 350
	movz x8, 430
	movz x6, 30
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 290
	movz x8, 430
	movz x6, 40
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 230
	movz x8, 430
	movz x6, 40
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 410
	movz x8, 440
	movz x6, 20
	movz x9, 10
	bl triangle_1

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 530
	movz x8, 440
	movz x6, 20
	movz x9, 10
	bl triangle_1

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 590
	movz x8, 430
	movz x6, 20
	movz x9, 10
	bl triangle_3

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 250
	movz x6, 10
	movz x8, 430
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 250
	movz x6, 10
	movz x8, 450
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 310
	movz x6, 10
	movz x8, 430
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 310
	movz x6, 10
	movz x8, 450
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 290
	movz x8, 410
	movz x6, 10
	movz x9, 60
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 370
	movz x6, 10
	movz x8, 430
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 370
	movz x6, 10
	movz x8, 450
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 430
	movz x6, 10
	movz x8, 430
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 490
	movz x6, 10
	movz x8, 430
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 490
	movz x6, 10
	movz x8, 450
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 550
	movz x6, 10
	movz x8, 430
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 610
	movz x6, 10
	movz x8, 450
	movz x9, 10
	bl ellipse

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 540
	movz x8, 430
	movz x6, 40
	movz x9, 30
	bl triangle_1

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 510
	movz x8, 440
	movz x6, 40
	movz x9, 30
	bl triangle_2

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 390
	movz x8, 440
	movz x6, 40
	movz x9, 30
	bl triangle_2

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 420
	movz x8, 430
	movz x6, 40
	movz x9, 30
	bl triangle_1

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 360
	movz x8, 430
	movz x6, 20
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 310
	movz x8, 430
	movz x6, 10
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 300
	movz x8, 420
	movz x6, 10
	movz x9, 40
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 240
	movz x8, 430
	movz x6, 20
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 380
	movz x8, 430
	movz x6, 10
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 410
	movz x8, 430
	movz x6, 20
	movz x9, 10
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 530
	movz x8, 430
	movz x6, 20
	movz x9, 10
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 480
	movz x8, 430
	movz x6, 20
	movz x9, 20
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 600
	movz x8, 420
	movz x6, 30
	movz x9, 10
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color
	movz x5, 590
	movz x8, 440
	movz x6, 20
	movz x9, 10
	bl rectangle

	movz x1, 0xFF
	movz x2, 0xF0
	movz x3, 0x46
	movz x4, 0x46
	bl build_color
	movz x5, 590
	movz x8, 430
	movz x6, 10
	movz x9, 10
	bl rectangle

  LDP    X29, X30, [SP]     // restore old FP, old LR
  ADD    SP, SP, #16

  RET
