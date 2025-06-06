  .equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480

  .global rectangle
rectangle:
    add x10, x8, x9
    add x7, x5, x6
    mov x9, x8         // y_offset

sq_loop_y:
    cmp x9, x10
    b.ge sq_done

    mov x6, x5         // x_offset
sq_loop_x:
    cmp x6, x7
    b.ge sq_next_line
    
    mov x12, SCREEN_WIDTH
    mul x12, x9, x12 // dy
    add x11, x6, x12
    lsl x11, x11, #2 // pixel position, color bias corrected
    
    mov x20, x0 // frame buffer start
    add x20, x20, x11

    stur w4, [x20]

    add x6, x6, #1
    B sq_loop_x

sq_next_line:
    add x9, x9, #1
    B sq_loop_y

sq_done:
    RET
