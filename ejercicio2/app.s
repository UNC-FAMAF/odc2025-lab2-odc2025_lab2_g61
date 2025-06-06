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

// === ANIMACIÓN TRIÁNGULO BLANCO ===

// Posición inicial
mov x19, 500       // X inicial
mov x20, 0       // Y inicial

anim_loop:
    // === BORRAR triángulo con color del fondo ===
    movz w10, 0xAF50, lsl 0      // Parte baja del color fondo
    movk w10, 0x004C, lsl 16     // Parte alta => 0x004CAF50
    mov x1, 40                   // base
    mov x2, 2                    // repetición (altura)
    mov x3, x19                  // X
    mov x4, x20                  // Y
    BL dibujar_triangulo

    // === ACTUALIZAR POSICIÓN Y ===
    add x20, x20, 10             // mueve hacia abajo
    cmp x20, 400                 // límite inferior (puede ajustar)
    b.lt continuar_anim
    mov x20, 0                 // vuelve arriba si se pasa
continuar_anim:

    // === DIBUJAR triángulo blanco ===
    movz w10, 0xFFFF, lsl 0
    movk w10, 0x00FF, lsl 16     // 0x00FFFFFF blanco
    mov x1, 40
    mov x2, 2
    mov x3, x19
    mov x4, x20
    BL dibujar_triangulo

    // === Delay para ver la animación ===
    BL delay_corto

    // Repetir animación
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
