    .global build_color
build_color:
    LSL X11 , X1, #24   // A
    LSL X12, X2, #16    // R
    LSL X13, X3, #8     // G
    ORR X4, X4, X11
    ORR X4, X4, X12
    ORR X4, X4, X13     // Final color in X4
    RET
