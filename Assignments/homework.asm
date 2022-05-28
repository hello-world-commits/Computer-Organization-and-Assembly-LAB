[org 0x0100]

jmp start

sum :

    push bp
    mov bp,sp 

    push ax
    push bx

    mov bx,[bp+4]

    mov ax,[bp+6]

    add ax,bx

    pop bx
    pop ax
    pop bp

    ret 4 


start :

    mov ax,10
    mov bx,5

    push ax
    push bx

    call sum

    mov ax,0x4c00

    int 0x21
