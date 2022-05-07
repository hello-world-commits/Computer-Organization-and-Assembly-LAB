[org 0x0100]

jmp start 

data : dw 47, 72, 31
max : dw 0 

sum :
    push bp 
    mov bp,sp
    push ax
    push bx

    mov ax,[bp+4]
    add ax,[bp+6]
    cmp ax,[max]

    jbe nochange 
    
    mov word[max] , ax
    

nochange :
       pop ax
       pop bp 
       ret 4 

maximum :
    push bp 
    mov bp,sp
    push ax 
    push bx
    push cx
    push dx 
    push di

    mov bx,[bp+4]
    mov cx,3
    mov di,0
    mov si , 10

    outerloop :
    mov ax , [bx + di]
    
    innerloop :    
        div si
        push dx
        xor dx,dx
        cmp ax,0
        
        jne innerloop

        call sum 

        sub cx,1 
        add di, 2
        cmp cx , 0
        jnz outerloop 

    pop di
    pop dx
    pop cx
    pop bx 
    pop ax 
    mov sp,bp
    pop bp 

    ret 2 
         

start :
    mov word[max],0
    mov ax,data
    push ax 
    call maximum

    mov ax, 0x4c00
    int 0x21
