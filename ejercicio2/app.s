.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480
.equ BITS_PER_PIXEL, 32
.equ CUADRADO_SIZE,  40
.equ CUADRADO_BYTES, 2560

.globl main

.data
colores:
    .word 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50
    .word 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50
    .word 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50
    .word 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50
    .word 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50
    .word 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50
    .word 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50
    .word 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50
    .word 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x0032CD32, 0x004CAF50
    .word 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50
    .word 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50
    .word 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50, 0x004CAF50

.text
main:
    mov x21, x0  // Framebuffer base

    mov x5, 0
loop_filas:
    cmp x5, 12
    b.ge FinFondo

    mov x6, 0
loop_columnas:
    cmp x6, 16
    b.ge fin_col

    mov x0, x5
    lsl x0, x0, 4
    add x0, x0, x6
    lsl x0, x0, 2

    adrp x7, colores
    add  x7, x7, :lo12:colores
    add  x7, x7, x0
    ldr  w10, [x7]

    mov x3, x6
    mov x4, x5
    mov x0, CUADRADO_SIZE
    mul x3, x3, x0
    mul x4, x4, x0

    mov x1, CUADRADO_SIZE
    mov x2, CUADRADO_SIZE
    BL dibujar_cuadrado

    add x6, x6, 1
    b loop_columnas

fin_col:
    add x5, x5, 1
    b loop_filas

FinFondo:

// Color negro cara Creeper
movz w10, 0x00, lsl 16
movk w10, 0x0000, lsl 00
mov x1, 40
mov x2, 40

// Cara del Creeper
mov x3, 200; mov x4, 140; BL dibujar_cuadrado
mov x3, 240; mov x4, 140; BL dibujar_cuadrado
mov x3, 360; mov x4, 140; BL dibujar_cuadrado
mov x3, 400; mov x4, 140; BL dibujar_cuadrado
mov x3, 200; mov x4, 180; BL dibujar_cuadrado
mov x3, 240; mov x4, 180; BL dibujar_cuadrado
mov x3, 360; mov x4, 180; BL dibujar_cuadrado
mov x3, 400; mov x4, 180; BL dibujar_cuadrado
mov x3, 280; mov x4, 220; BL dibujar_cuadrado
mov x3, 320; mov x4, 220; BL dibujar_cuadrado
mov x3, 240; mov x4, 260; BL dibujar_cuadrado
mov x3, 280; mov x4, 260; BL dibujar_cuadrado
mov x3, 320; mov x4, 260; BL dibujar_cuadrado
mov x3, 360; mov x4, 260; BL dibujar_cuadrado
mov x3, 240; mov x4, 300; BL dibujar_cuadrado
mov x3, 280; mov x4, 300; BL dibujar_cuadrado
mov x3, 320; mov x4, 300; BL dibujar_cuadrado
mov x3, 360; mov x4, 300; BL dibujar_cuadrado
mov x3, 240; mov x4, 340; BL dibujar_cuadrado
mov x3, 360; mov x4, 340; BL dibujar_cuadrado

// Letras ODC 2025 abajo a la izquierda
movz w10, 0xFF, lsl 16      // Color blanco
movk w10, 0xFFFF, lsl 0

mov x1, 10       // ancho cuadrado
mov x2, 10       // alto cuadrado

mov x6, 0        // x inicial
mov x7, 410      // y inicial (cerca del borde inferior, altura = 480)

// ----------- Letra O -----------
mov x3, x6;        mov x4, x7;        BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #10;   BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #20;   BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #30;   BL dibujar_cuadrado

add x3, x6, #10;   mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #10;   add x4, x7, #30;   BL dibujar_cuadrado

add x3, x6, #20;   mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #10;   BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #20;   BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #30;   BL dibujar_cuadrado

// ----------- Letra D -----------
add x6, x6, #35

mov x3, x6;        mov x4, x7;        BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #10;   BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #20;   BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #30;   BL dibujar_cuadrado

add x3, x6, #10;   mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #10;   add x4, x7, #30;   BL dibujar_cuadrado

add x3, x6, #20;   add x4, x7, #10;   BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #20;   BL dibujar_cuadrado

// ----------- Letra C -----------
add x6, x6, #35

mov x3, x6;        mov x4, x7;        BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #10;   BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #20;   BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #30;   BL dibujar_cuadrado

add x3, x6, #10;   mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #20;   mov x4, x7;        BL dibujar_cuadrado

add x3, x6, #10;   add x4, x7, #30;   BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #30;   BL dibujar_cuadrado

// ----------- Espacio -----------
add x6, x6, #35

// ----------- Número 2 -----------
mov x3, x6;        mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #10;   mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #20;   mov x4, x7;        BL dibujar_cuadrado

add x3, x6, #20;   add x4, x7, #10;   BL dibujar_cuadrado

add x3, x6, #10;   add x4, x7, #20;   BL dibujar_cuadrado

mov x3, x6;        add x4, x7, #30;   BL dibujar_cuadrado
add x3, x6, #10;   add x4, x7, #30;   BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #30;   BL dibujar_cuadrado

// ----------- Número 0 -----------
add x6, x6, #35

mov x3, x6;        mov x4, x7;        BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #10;   BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #20;   BL dibujar_cuadrado
mov x3, x6;        add x4, x7, #30;   BL dibujar_cuadrado

add x3, x6, #20;   mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #10;   BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #20;   BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #30;   BL dibujar_cuadrado

add x3, x6, #10;   add x4, x7, #30;   BL dibujar_cuadrado
add x3, x6, #10;   mov x4, x7;        BL dibujar_cuadrado

// ----------- Número 2 -----------
add x6, x6, #35

mov x3, x6;        mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #10;   mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #20;   mov x4, x7;        BL dibujar_cuadrado

add x3, x6, #20;   add x4, x7, #10;   BL dibujar_cuadrado

add x3, x6, #10;   add x4, x7, #20;   BL dibujar_cuadrado

mov x3, x6;        add x4, x7, #30;   BL dibujar_cuadrado
add x3, x6, #10;   add x4, x7, #30;   BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #30;   BL dibujar_cuadrado

// ----------- Número 5 -----------
add x6, x6, #35

mov x3, x6;        mov x4, x7;        BL dibujar_cuadrado       // fila superior
add x3, x6, #10;   mov x4, x7;        BL dibujar_cuadrado
add x3, x6, #20;   mov x4, x7;        BL dibujar_cuadrado

mov x3, x6;        add x4, x7, #10;   BL dibujar_cuadrado       // barra vertical izquierda

mov x3, x6;        add x4, x7, #20;   BL dibujar_cuadrado       // fila intermedia
add x3, x6, #10;   add x4, x7, #20;   BL dibujar_cuadrado
add x3, x6, #20;   add x4, x7, #20;   BL dibujar_cuadrado

add x3, x6, #10;   add x4, x7, #30;   BL dibujar_cuadrado       // fila inferior (centrada)
add x3, x6, #20;   add x4, x7, #30;   BL dibujar_cuadrado


// === ANIMACIÓN TRIÁNGULO BLANCO ===

// Posición inicial
mov x19, 500       // X inicial
mov x20, 0       // Y inicial

anim_loop:
    // === BORRAR triángulo 1 anterior ===
    mov x3, x19
    mov x4, x20
    BL get_color_fondo
    mov x1, 40
    mov x2, 40
    BL dibujar_cuadrado

    // === BORRAR triángulo 2 anterior ===
    mov x3, x22
    mov x4, x23
    BL get_color_fondo
    mov x1, 40
    mov x2, 40
    BL dibujar_cuadrado

    // === ACTUALIZAR POSICIONES ===
    add x20, x20, 10
    cmp x20, 400
    b.lt ok_t1
    mov x20, 0
ok_t1:

    add x23, x23, 15   // este baja más rápido
    cmp x23, 400
    b.lt ok_t2
    mov x23, 0
ok_t2:

    // === DIBUJAR triángulo 1 ===
    movz w10, 0xFFFF, lsl 0
    movk w10, 0x00FF, lsl 16
    mov x1, 40
    mov x2, 2
    mov x3, x19
    mov x4, x20
    BL dibujar_triangulo

    // === DIBUJAR triángulo 2 ===
    movz w10, 0x00FF, lsl 16  // R: FF0000
    movk w10, 0x0000, lsl 0
    mov x1, 40
    mov x2, 2
    mov x3, x22
    mov x4, x23
    BL dibujar_triangulo

    // === Delay ===
    BL delay_corto

    b anim_loop

// === Delay simple ===
delay_corto:
    mov x0, 0xF00000
delay_loop:
    subs x0, x0, 1
    b.ne delay_loop
    ret

// FUNCIONES
calcular_pixel:
    mov x0, SCREEN_WIDTH
    mul x0, x0, x4
    add x0, x0, x3
    lsl x0, x0, 2
    add x0, x0, x21
    ret

redibujar_fondo:
    mov x5, 0
rf_loop_filas:
    cmp x5, 12
    b.ge rf_fin_fondo

    mov x6, 0
rf_loop_columnas:
    cmp x6, 16
    b.ge rf_fin_col

    mov x0, x5
    lsl x0, x0, 4
    add x0, x0, x6
    lsl x0, x0, 2

    adrp x7, colores
    add  x7, x7, :lo12:colores
    add  x7, x7, x0
    ldr  w10, [x7]

    mov x3, x6
    mov x4, x5
    mov x0, CUADRADO_SIZE
    mul x3, x3, x0
    mul x4, x4, x0

    mov x1, CUADRADO_SIZE
    mov x2, CUADRADO_SIZE
    BL dibujar_cuadrado

    add x6, x6, 1
    b rf_loop_columnas

rf_fin_col:
    add x5, x5, 1
    b rf_loop_filas

rf_fin_fondo:
    ret


dibujar_cuadrado:
    SUB SP, SP, 40
    STUR x30, [SP, 32]
    STUR x13, [SP, 24]
    STUR x12, [SP, 16]
    STUR x11, [SP, 8]
    STUR x9,  [SP, 0]

    BL calcular_pixel
    mov x9, x2
    mov x13, x0

pintar_cuadrado_filas:
    mov x11, x1
    mov x12, x13

pintar_cuadrado_columnas:
    str w10, [x13]
    add x13, x13, 4
    sub x11, x11, 1
    cbnz x11, pintar_cuadrado_columnas

    mov x13, x12
    add x13, x13, CUADRADO_BYTES
    sub x9, x9, 1
    cbnz x9, pintar_cuadrado_filas

    LDR x9,  [SP, 0]
    LDR x11, [SP, 8]
    LDR x12, [SP, 16]
    LDR x13, [SP, 24]
    LDR x30, [SP, 32]
    ADD SP, SP, 40
    ret

dibujar_triangulo:
    SUB SP, SP, 48
    STUR x30, [SP, 40]
    STUR x15, [SP, 32]
    STUR x14, [SP, 24]
    STUR x13, [SP, 16]
    STUR x12, [SP, 8]
    STUR x11, [SP, 0]

    BL calcular_pixel
    mov x13, x0
    mov x14, x1

pintar_triangulo:
    mov x15, x2
pintar_fila:
    mov x11, x14
    mov x12, x13
color_triangulo:
    str w10, [x13]
    add x13, x13, 4
    sub x11, x11, 1
    cbnz x11, color_triangulo

    mov x13, x12
    add x13, x13, CUADRADO_BYTES
    sub x15, x15, 1
    cbnz x15, pintar_fila

    mov x13, x12
    add x13, x13, CUADRADO_BYTES
    add x13, x13, 4
    sub x14, x14, 2
    cbnz x14, pintar_triangulo

    LDR x11, [SP, 0]
    LDR x12, [SP, 8]
    LDR x13, [SP, 16]
    LDR x14, [SP, 24]
    LDR x15, [SP, 32]
    LDR x30, [SP, 40]
    ADD SP, SP, 48
    ret
    
get_color_fondo:
    // x3 = posX, x4 = posY
    mov x5, CUADRADO_SIZE
    udiv x6, x3, x5     // columna = posX / 40
    udiv x7, x4, x5     // fila    = posY / 40

    mov x0, x7
    lsl x0, x0, 4       // fila * 16
    add x0, x0, x6      // + columna
    lsl x0, x0, 2       // * 4 bytes por pixel

    adrp x8, colores
    add  x8, x8, :lo12:colores
    add  x8, x8, x0
    ldr  w10, [x8]      // devuelve color en w10
    ret
