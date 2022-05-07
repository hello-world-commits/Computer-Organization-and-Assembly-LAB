[org 0x0100]

jmp start

data : dw 8,7
swapflag : db 0

swap : 
    push ax 
    mov ax , [bx + si]
    xchg ax , [bx + si + 2]
    mov [bx + si] , ax
    pop ax

    ret

bubblesort : 

    push bp

    mov bp,sp 

    sub sp,6
    
    push ax
    push bx
    push cx 
    push si 
    mov bx , [bp + 6]
    mov cx , [bp + 4 ]

    dec cx
    shl cx,1 

    mainloop :  
        mov  si, 0                  

        innerloop : 
            mov  ax, [bx + si]
            cmp  ax, [bx + si + 2]
            jbe  noswap 

               call swap     
               mov  byte[swapflag], 1

            noswap: 
            add  si, 2 
            cmp  si, cx
            jne  innerloop

        cmp  byte[swap], 1 
        je   mainloop     

        pop si 
        pop cx 
        pop bx       
        ; pop ax 
        pop bp       
   
        ret 4

    start : 
        mov  bx, data 
        mov  cx, 2 

        push bx 
        push cx 

        call bubblesort 

        mov ax, 0x4c00 
        int 0x21             