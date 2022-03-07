[org 0x0100]

jmp start

data : dw 10,3,2,5


start :

mov cx,4

outerloop :
    mov bx,0

    innerloop :
        mov ax, [data + bx]
        cmp ax , [data + bx + 2]
        jbe noswap

            ;swaping
            mov dx, [data + bx + 2]
            mov [data + bx + 2], dx
            mov [data + bx ],dx

        noswap :
            add bx,2
            cmp bx,6
            jne innerloop

;outerloop termination
sub cx,1
jnz outerloop


mov ax, 0x4c00
int 0x21