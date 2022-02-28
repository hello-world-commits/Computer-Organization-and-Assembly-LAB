[org 0x0100]

mov ax,0 ;reset the accumulator

mov bx,0 ;set the counter

outerloop:

    add ax,[num1+bx]

    add bx,2

    sub ax,0 ; set zf=0   first time the value of bx is 2 

    jnz outerloop ; 

mov [result],ax

mov ax,0x4c00

int 0x21

num1: dw 0,0,1,5

result: dw 0
