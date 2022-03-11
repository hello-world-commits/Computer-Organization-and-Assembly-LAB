[org 0x0100]

mov cx,3

outerloop :
    mov bx,cx
    

    innerloop :
        mov ax,bx
        sub bx,1
        jnz innerloop
            sub cx,1

            jnz outerloop

            mov ax,0x4c00
            int 0x21