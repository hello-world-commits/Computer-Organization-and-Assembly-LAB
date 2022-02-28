[org 0x0100]

mov ax,0 ;reset the accumulator
mov cx,3
mov bx,0 ;set the counter



outerloop :
    mov ax,[num1+bx]
    cmp ax,0
    jne outerloop2
    je skip

outerloop2 :

    add bx,2
    add ax,[num1+bx]
    
    sub cx,1
    jnz outerloop2

    mov [result],ax

    mov ax,0x4c00

    int 0x21


skip :
    add bx,2
    sub cx,1
    jnz outerloop2




num1: dw 5,0,1,5

result: dw 0
