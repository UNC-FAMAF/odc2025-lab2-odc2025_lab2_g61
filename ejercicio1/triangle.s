    .equ SCREEN_WIDTH,   640
    .equ SCREEN_HEIGH,   480

    .text
    .globl triangle_0
triangle_0:
    // --------------------------------------------------------
    // Registros de entrada (convención):
    //   X0 = base del framebuffer
    //   W4 = color ARGB ya armado (build_color)
    //
    //   X5 = x_start   (columna donde inicia el triángulo)
    //   X6 = x_length  (ancho total de la base del triángulo)
    //   X7 = tx        (no se usa aquí; lo reservamos)
    //   X8 = y_start   (fila donde inicia el triángulo)
    //   X9 = y_length  (altura del triángulo)
    //   X10..X19: registros libres
    //   X20: registro libre para calculo de dirección
    // --------------------------------------------------------

    // 1) Calcular y_top  = y_start + y_length
    ADD   X10, X8, X9       // X10 := y_top

    // 2) Calcular x_top  = x_start + x_length  (puede servir si quieres “área llena” total)
    ADD   X7,  X5, X6       // X7 := x_top

    // 3) Calcular step_x = (x_length << 10) / y_length
    LSL   X11, X6, #10      // X11 = x_length * 1024
    UDIV  X11, X11, X9      // X11 = (x_length*1024) / y_length

    // 4) Preparamos el bucle sobre filas:
    MOV   X12, X8          // X12 = fila_actual (“row”), arranca en y_start
    MOV   X13, #0         // X13 = delta_y = row – y_start (inicialmente 0)

row_loop:
    CMP   X12, X10        // si row_actual ≥ y_top, terminamos
    B.GE  triangle_1_done

    // 5) Calcular x_end_this_row = x_start + (delta_y * step_x) >> 10
    //    a) delta_scaled = delta_y * step_x
    MUL   X14, X13, X11     // X14 = delta_y * ((x_length*1024)/y_length)
    //    b) x_offset  = X14 >> 10
    LSR   X14, X14, #10     // X14 = (delta_y * x_length/ y_length)
    //    c) x_end = x_start + x_offset
    ADD   X15, X5, X14      // X15 = x_end_this_row

    // 6) Bucle interno: “col” recorre desde x_start (X5) hasta x_end (X15)
    MOV   X16, X5          // X16 = col_actual = x_start

col_loop:
    CMP   X16, X15        // si col_actual > x_end, saltar a siguiente fila
    B.GT  next_row

    // 7) Calcular offset en bytes = (row_actual * SCREEN_WIDTH + col_actual) * 4
    MOV   X17, #SCREEN_WIDTH
    MUL   X17, X12, X17    // X17 = row_actual * SCREEN_WIDTH
    ADD   X17, X17, X16    // X17 = row_actual*SW + col_actual
    LSL   X17, X17, #2     // X17 <<= 2  → offset en bytes

    // 8) Dirección final = base_fb + offset
    ADD   X20, X0, X17     // X20 = &framebuffer[row][col]

    // 9) Escribir color (32 bits)
    STR   W4, [X20]

    // 10) Incrementar columna y repetir
    ADD   X16, X16, #1     // col_actual++
    B     col_loop

next_row:
    // 11) Incrementar fila
    ADD   X12, X12, #1     // row_actual++
    ADD   X13, X13, #1     // delta_y = delta_y + 1
    B     row_loop

triangle_1_done:
    RET

    .text
    .globl triangle_1
triangle_1:
    // --------------------------------------------------------
    // Entrada (convención de registros):
    //   X0 = base del framebuffer
    //   W4 = color ARGB ya armado (build_color)
    //
    //   X5 = x_start   (columna inicial de la base)
    //   X6 = x_length  (ancho total de la base)
    //   X7 = tx        (registro libre, se usará para x_base_right)
    //   X8 = y_start   (fila inicial de la base)
    //   X9 = y_length  (altura del triángulo)
    //   X10..X19: registros libres
    //   X20: registro libre para puntero en FB
    //
    // Precondición: Antes de llamar a triangle_2,
    //               ya se invocó build_color para que X4 contenga ARGB.
    // --------------------------------------------------------

    // 1) Calcular y_top = y_start + y_length → X10
    ADD   X10, X8, X9       // X10 := y_top

    // 2) Calcular x_base_right = x_start + x_length → X7
    ADD   X7,  X5, X6       // X7 := x_base_right

    // 3) Calcular step_x = (x_length << 10) / y_length → X11
    LSL   X11, X6, #10      // X11 = x_length * 1024
    UDIV  X11, X11, X9      // X11 = (x_length*1024)/y_length

    // 4) Iniciar bucle de filas:
    MOV   X12, X8          // X12 = row_actual = y_start
    MOV   X13, #0          // X13 = delta_y = 0

row_loop2:
    CMP   X12, X10        // si row_actual ≥ y_top, salimos
    B.GE  triangle_2_done

    // 5) Calcular dx_scaled = (delta_y * step_x) >> 10 → X14
    MUL   X14, X13, X11     // X14 = delta_y * step_x*1024/y_length
    LSR   X14, X14, #10     // X14 = delta_y * (x_length/y_length)

    // 6) Calcular x_min_this_row = x_base_right - dx_scaled → X15
    SUB   X15, X7, X14      // X15 = x_base_right - dx_scaled

    // 7) Bucle interno: “col” recorre de X15 (x_min) hasta X7 (x_base_right)
    MOV   X16, X15         // X16 = col_actual = x_min_this_row

col_loop2:
    CMP   X16, X7         // si col_actual > x_base_right, saltar
    B.GT  next_row2

    // 8) Calcular offset en bytes = (row_actual * SCREEN_WIDTH + col_actual) * 4
    MOV   X17, #SCREEN_WIDTH
    MUL   X17, X12, X17    // X17 = row_actual * SCREEN_WIDTH
    ADD   X17, X17, X16    // X17 = row_actual*SW + col_actual
    LSL   X17, X17, #2     // X17 <<= 2 → offset en bytes

    // 9) Dirección final = base + offset → X20
    ADD   X20, X0, X17     // X20 = &framebuffer[row][col]

    // 10) Escribir color ARGB (32 bits)
    STR   W4, [X20]

    // 11) Incrementar columna y repetir
    ADD   X16, X16, #1     // col_actual++
    B     col_loop2

next_row2:
    // 12) Incrementar fila
    ADD   X12, X12, #1     // row_actual++
    ADD   X13, X13, #1     // delta_y++
    B     row_loop2

triangle_2_done:
    RET

  
    .text
    .globl triangle_2
triangle_2:
    // --------------------------------------------------------
    // Entrada (convenio de registros):
    //   X0 = base del framebuffer
    //   W4 = color ARGB ya armado (build_color)
    //
    //   X5 = x_start   ; columna donde comienza la base
    //   X6 = x_length  ; ancho total de la base
    //   X7 = tx        ; registro libre, se usará para x_base_right
    //   X8 = y_start   ; fila de la base
    //   X9 = y_length  ; altura del triángulo
    //   X10..X19: registros libres
    //   X20: registro libre para puntero a framebuffer
    //
    // Precondición: Antes de llamar a triangle_3,
    //               debe haberse llamado a build_color → W4 contiene ARGB.
    // --------------------------------------------------------

    // 1) Calcular y_base   = y_start + y_length  → X10
    ADD   X10, X8, X9       // X10 := y_base

    // 2) y_top = y_start (no hay que calcular: X8)

    // 3) Calcular x_base_right = x_start + x_length → X7
    ADD   X7,  X5, X6       // X7 := x_base_right

    // 4) Calcular step_x = (x_length << 10) / y_length → X11
    LSL   X11, X6, #10      // X11 = x_length * 1024
    UDIV  X11, X11, X9      // X11 = (x_length*1024) / y_length

    // 5) Iniciar bucle de filas de abajo hacia arriba:
    MOV   X12, X10         // X12 = row_actual = y_base
    MOV   X13, #0          // X13 = delta_y = 0 (distancia desde la base)

row_loop3:
    // 6) Si row_actual < y_start, hemos llegado al vértice → salimos
    CMP   X12, X8
    BLT   triangle_3_done

    // 7) Calcular dx_scaled = (delta_y * step_x) >> 10 → X14
    MUL   X14, X13, X11    // X14 = delta_y * (x_length*1024/y_length)
    LSR   X14, X14, #10    // X14 = delta_y * (x_length / y_length)

    // 8) Calcular x_end_this_row = x_start + dx_scaled → X15
    ADD   X15, X5, X14     // X15 = x_start + dx_scaled

    // 9) Bucle interno: “col” recorre de x_start (X5) hasta x_end_this_row (X15)
    MOV   X16, X5         // X16 = col_actual = x_start

col_loop3:
    CMP   X16, X15       // si col_actual > x_end, salta al siguiente row
    B.GT  next_row3

    // 10) Calcular offset en bytes = (row_actual * SCREEN_WIDTH + col_actual) * 4
    MOV   X17, #SCREEN_WIDTH
    MUL   X17, X12, X17    // X17 = row_actual * SCREEN_WIDTH
    ADD   X17, X17, X16    // X17 = row_actual*SW + col_actual
    LSL   X17, X17, #2     // X17 <<= 2 → offset en bytes

    // 11) Dirección final = base + offset → X20
    ADD   X20, X0, X17     // X20 = &framebuffer[row][col]

    // 12) Escribir color ARGB (32 bits)
    STR   W4, [X20]

    // 13) Incrementar columna y repetir
    ADD   X16, X16, #1     // col_actual++
    B     col_loop3

next_row3:
    // 14) Movernos a la siguiente fila (hacia arriba)
    SUB   X12, X12, #1     // row_actual--
    ADD   X13, X13, #1     // delta_y++
    B     row_loop3

triangle_3_done:
    RET

    .text
    .globl triangle_3
triangle_3:
    // --------------------------------------------------------
    // Entrada (convenio de registros):
    //   X0 = base del framebuffer
    //   W4 = color ARGB ya armado (build_color)
    //
    //   X5 = x_start   ; columna donde comienza el vértice de la base
    //   X6 = x_length  ; ancho total de la base
    //   X7 = tx        ; registro libre, se usará para x_base_right
    //   X8 = y_start   ; fila donde está la base (vértice superior)
    //   X9 = y_length  ; altura del triángulo
    //   X10..X19: registros libres
    //   X20: registro libre para puntero en FB
    //
    // Precondición: Antes de llamar a triangle_4,
    //               debe haberse llamado a build_color para que W4 contenga ARGB.
    // --------------------------------------------------------

    // 1) Calcular y_base = y_start + y_length → X10
    ADD   X10, X8, X9       // X10 := fila de la base invertida

    // 2) y_top = y_start (no hay que calcular; permanece en X8)

    // 3) Calcular x_base_right = x_start + x_length → X7
    ADD   X7,  X5, X6       // X7 := columna del vértice derecho de la base

    // 4) Calcular step_x = (x_length << 10) / y_length → X11
    LSL   X11, X6, #10      // X11 = x_length * 1024
    UDIV  X11, X11, X9      // X11 = (x_length*1024) / y_length

    // 5) Iniciar bucle sobre filas desde la base hacia el vértice:
    MOV   X12, X10         // X12 = row_actual = y_base
    MOV   X13, #0          // X13 = delta_y = 0

row_loop4:
    // 6) Si row_actual < y_start, llegamos al vértice → salimos
    CMP   X12, X8
    BLT   triangle_4_done

    // 7) Calcular dx_scaled = (delta_y * step_x) >> 10 → X14
    MUL   X14, X13, X11    // X14 = delta_y * (x_length*1024/y_length)
    LSR   X14, X14, #10    // X14 = delta_y * (x_length / y_length)

    // 8) Calcular x_start_this_row = x_base_right - dx_scaled → X15
    SUB   X15, X7, X14     // X15 = x_base_right - dx_scaled

    // 9) Bucle interno: “col” recorre de X15 (x_start_this_row) hasta X7 (x_base_right)
    MOV   X16, X15        // X16 = col_actual = x_start_this_row

col_loop4:
    CMP   X16, X7        // si col_actual > x_base_right, salta
    B.GT  next_row4

    // 10) Calcular offset en bytes = (row_actual * SCREEN_WIDTH + col_actual) * 4
    MOV   X17, #SCREEN_WIDTH
    MUL   X17, X12, X17   // X17 = row_actual * SCREEN_WIDTH
    ADD   X17, X17, X16   // X17 = row_actual*SW + col_actual
    LSL   X17, X17, #2    // X17 <<= 2 → offset en bytes

    // 11) Dirección final = base + offset → X20
    ADD   X20, X0, X17    // X20 = &framebuffer[row_actual][col_actual]

    // 12) Escribir color ARGB (32 bits)
    STR   W4, [X20]

    // 13) Incrementar columna y repetir
    ADD   X16, X16, #1    // col_actual++
    B     col_loop4

next_row4:
    // 14) Preparar siguiente fila (hacia el vértice)
    SUB   X12, X12, #1    // row_actual-- (sube una fila)
    ADD   X13, X13, #1    // delta_y++ 
    B     row_loop4

triangle_4_done:
    RET
