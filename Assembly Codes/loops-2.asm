[org 0x0100]

mov cx,3
mov bx,0
outerloop :
    mov ax,0
    

    innerloop :
       
        add ax,1
        add bx,1
        sub ax,bx
        
        jne innerloop 
        
            sub cx,1

            jnz outerloop

            mov ax,0x4c00
            int 0x21