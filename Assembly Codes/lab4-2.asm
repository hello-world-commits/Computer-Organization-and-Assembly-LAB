[org 0x0100]

mov ax,0 ;reset the accumulator

mov bx,0 ;set the counter

gulbadin :

    add ax,[num1+bx]

    add bx,2

    cmp bx,20 ; set zf=0   first time the value of bx is 2 

    jne gulbadin ; jump back to the label if the previous instructions are not equal

mov [result],ax

mov ax,0x4c00

int 0x21

num1: dw 10,20,30,40,50,10,20,30,40,50

result: dw 0
