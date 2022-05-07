[org 0x0100]

jmp start

num1 : dw 20
start :
mov ax,0
mov cx,20
multiply :
    add ax,[num1]
    dec cx
    jnz multiply

    mov ax,0x4c00
    int 0x21

