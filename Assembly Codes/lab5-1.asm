[org 0x0100]

jmp start

data : dw 2,8,3,4,2,5

start :

mov cx,6

outerloop :
    mov bx,0

    innerloop :
        mov ax, [data + bx]

        cmp ax,2

        je noswap

        cmp ax , [data + bx + 2]
        
        jbe noswap

            ;swaping
            mov dx, [data + bx + 2]
            mov [data + bx + 2], ax
            mov [data + bx ],dx

        noswap :
            add bx,2
            cmp bx,10
            jne innerloop

            

;outerloop termination
sub cx,1
jnz outerloop


mov ax, 0x4c00
int 0x21

