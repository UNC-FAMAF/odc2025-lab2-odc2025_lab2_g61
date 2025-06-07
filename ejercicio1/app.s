	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

	movz x1, 0xFF
 	movz x2, 0xB5
	movz x3, 0xCA
	movz x4, 0xD5
	bl build_color

	mov x2, SCREEN_HEIGH         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w4,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto

	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b10

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 1
  
  MOV X0, X20

  // 2) Armar el color ARGB en W4:
  MOV   X1, #0x80     // A = 255
  MOV   X2, #0x00     // R =   0
  MOV   X3, #0x80     // G = 128
  MOV   X4, #0xFF     // B = 255
  BL    build_color  // después de esto, X4 (o W4) = 0xFF0080FF

  // 3) Parámetros del rectángulo:
  MOV   X5, #100     // x_start = 100
  MOV   X6, #50      // width   =  50
  MOV   X8, #20      // y_start =  20
  MOV   X9, #80      // height  =  80

  // BL rectangle
  //BL triangle_2

  BL odc
  BL nose1

