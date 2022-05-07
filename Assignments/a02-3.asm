[org 0x0100]

jmp start

add2 : 
    push bp
    mov bp,sp
    push ax
    push bx
    push cx 
    push dx ;sum 

    mov ax,[bp+4]
    mov bx,[bp+6]
    mov cx,[bp+8]

    add ax,bx
    add ax,cx

    mov dx,ax

    pop dx
    pop cx
    pop bx
    pop ax
    mov sp,bp 
    pop bp

    ret 6



add1 :
    push bp
    mov bp,sp
    push ax
    push bx
    push dx ;sum 

    mov ax,[bp + 4]
    mov bx,[bp + 6]

    push ax
    push bx 

    add ax,bx  ; sum = a + b 
    mov dx , ax

    push dx 

    call add2

    pop dx
    pop bx
    pop ax
    mov sp,bp
    pop bp

    ret 4



start :
    mov ax,12
    mov bx,12

    push ax
    push bx 

    call add1
    

    mov ax ,0x4c00
    int 0x21