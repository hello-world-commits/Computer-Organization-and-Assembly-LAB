[org 0x0100]

jmp start 

data : dw  3, 9, 56, 43, 1, 2, 23
odd : dw 0
even : dw 0

count : 
    push bp 
    mov bp,sp
    push ax 
    push bx 
    push cx 
    push dx
    push di
    push si 

    mov bx,[bp+4]
    mov cx , 7
    mov di,0
    mov si,2 

    iterate : 
            xor dx,dx
            mov ax,[bx+di]  
            div si
            cmp dx,0
            jne oddinc

            add word[even],1
            add di,2
            loop iterate

            jmp terminate

    oddinc : 
        add word[odd],1
        add di,2
        loop iterate 

    terminate :
        pop si
        pop di
        pop dx
        pop cx 
        pop bx
        pop ax 
        mov sp,bp
        pop bp 

        ret 2     



start :
    mov word[odd],0
    mov word[even],0
    

    mov ax,data
    push ax
    
    call count

    mov ax,0x4c00
    int 0x21