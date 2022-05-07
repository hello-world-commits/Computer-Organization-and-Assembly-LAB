
[org 0x0100]

jmp start
mode : dw 0
num1 : dw 3,6,5,4,3,3,2,8


start :
mov dx , 0 
mov si , 0
 
outerloop :
    mov di ,  0 
    mov bx , 0
    mov ax , [num1 + bx]
    mov cx , 8

    innerloop :
        cmp ax,[num1 + bx + 2]
        je move
        add bx , 2
        dec cx  
        jnz innerloop

        add bx , 2
        cmp bx , 12
        jne outerloop

        jmp terminate 


move :
    add di,1
    mov word[mode],di
    cmp di, dx
    ja count

    add bx,2
    sub cx,1 
    jnz innerloop 

    mov [ num1 + si ],di
    add si ,2
    cmp si , 12
    jne outerloop

terminate : 
    mov ax , 0x4c00 
    int 0x21 

count : 
    mov dx , [ num1 + bx + 2 ]

    add bx,2
    sub cx,1 
    jnz innerloop 
    








