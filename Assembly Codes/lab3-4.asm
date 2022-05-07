[org 0x0100]

;for (int i =3 ; i > 0 ; i++){
    ; result += data[i]

  mov ax, 0x8787 
  mov ax, 0    ;reset accumulator
  mov cx, 3    ; set iteration count
  mov bx, num1 ; set the base

  outerloop:
    add ax, [bx]
    add bx, 2

    sub cx, 1

    jnz outerloop 

    mov [result], ax

    mov ax,0x4c00
    int 0x21

num1 : dw 5,10,15
result : dw 0