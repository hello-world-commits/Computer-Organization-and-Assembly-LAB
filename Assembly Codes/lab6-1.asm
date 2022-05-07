[org 0x0100]

jmp start

    num : dw 2,1,8,3,4,5,9,7
    length : dw 8
    max : dw 0
    second_largest : dw 0


nextlargest :

    mov dx , [max]
    mov [second_largest],dx 

    mov ax, [num+bx]
    mov [max],ax
    
    add bx,2
    sub cx,1
    jz terminate
    jnz compareloop

start : 
    mov ax,[num]
    mov [max],ax
    mov bx,2
    sub cx,[length]

compareloop : 
    cmp ax,[num +bx]
    jnae nextlargest
        add bx,2
        sub cx,1
        jnz compareloop
        jz terminate

terminate : 
mov ax,0x4c00
int 0x21
