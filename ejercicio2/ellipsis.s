    .equ SCREEN_WIDTH, 		640
	  .equ SCREEN_HEIGH, 		480

    .text
    .globl ellipse
ellipse:
    // ------------------------------------------------------------
    // Inputs (register convention):
    //   X0 = base address of the framebuffer
    //   X1 = A (alpha, 0..255)
    //   X2 = R (red,   0..255)
    //   X3 = G (green, 0..255)
    //   X4 = B (blue,  0..255)
    //       —————————————————————————————————————————————————
    //   After calling build_color, X4 contains the 32-bit ARGB color.
    //
    //   X5  = cx   (center X of ellipse)
    //   X6  = rx   (horizontal radius)
    //   X7  = unused/free
    //   X8  = cy   (center Y of ellipse)
    //   X9  = ry   (vertical radius)
    //   X10 = unused/free
    //
    //   X11..X19: registers free for temporary calculations
    //   X20 = register free for final pixel address
    //
    // Precondition: build_color was already called, so X4 contains ARGB.
    // ------------------------------------------------------------

    // 1) Precompute rx² and ry²
    MUL   X11, X6, X6      // X11 = rx²
    MUL   X12, X9, X9      // X12 = ry²

    // 2) Compute rx² * ry² → X13
    MUL   X13, X11, X12    // X13 = rx² * ry²

    // 3) Initialize dy = –ry → X14 = –X9
    NEG   X14, X9          // X14 = –ry

dy_loop:
    // 4) If dy > ry, exit
    CMP   X14, X9
    B.GT  ellipse_done

    // 5) Initialize dx = –rx → X15 = –X6
    NEG   X15, X6          // X15 = –rx

dx_loop:
    // 6) If dx > rx, skip to next dy
    CMP   X15, X6
    B.GT  next_dy

    // 7) term_x = (dx²) * (ry²)
    MUL   X16, X15, X15    // X16 = dx²
    MUL   X16, X16, X12    // X16 = dx² * ry²

    // 8) term_y = (dy²) * (rx²)
    MUL   X17, X14, X14    // X17 = dy²
    MUL   X17, X17, X11    // X17 = dy² * rx²

    // 9) sum = term_x + term_y
    ADD   X18, X16, X17    // X18 = term_x + term_y

    // 10) If sum > rx²*ry² (X13), skip this pixel
    CMP   X18, X13
    B.GT  skip_pixel

    // 11) Compute screen coordinates:
    //     screen_x = cx + dx → X7  = X5 + X15
    //     screen_y = cy + dy → X10 = X8 + X14
    ADD   X7,  X5, X15     // X7  = cx + dx
    ADD   X10, X8, X14     // X10 = cy + dy

    // 12) Bound check: 0 ≤ screen_x < SCREEN_WIDTH and 0 ≤ screen_y < SCREEN_HEIGH
    CMP   X7,  #0
    BLT   skip_pixel
    CMP   X10, #0
    BLT   skip_pixel
    CMP   X7,  #SCREEN_WIDTH
    B.GE  skip_pixel
    CMP   X10, #SCREEN_HEIGH
    B.GE  skip_pixel

    // 13) Compute byte offset = ((screen_y * SCREEN_WIDTH) + screen_x) << 2
    MOV   X19, #SCREEN_WIDTH
    MUL   X19, X10, X19    // X19 = screen_y * SCREEN_WIDTH
    ADD   X19, X19, X7     // X19 = screen_y*SW + screen_x
    LSL   X19, X19, #2     // X19 <<= 2: convert to byte offset

    // 14) Compute final pixel address = framebuffer_base + offset → X20
    ADD   X20, X0, X19     // X20 = &framebuffer[screen_y][screen_x]

    // 15) Store ARGB color (32 bits)
    STR   W4, [X20]

skip_pixel:
    // 16) dx = dx + 1
    ADD   X15, X15, #1
    B     dx_loop

next_dy:
    // 17) dy = dy + 1
    ADD   X14, X14, #1
    B     dy_loop

ellipse_done:
    RET
