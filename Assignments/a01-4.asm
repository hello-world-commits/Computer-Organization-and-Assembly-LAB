[org 0x0100]

jmp start

data : dw 1,2,3,4,5,6
size : dw 6

start : 
    mov bx, data

    mov si , 0 

    mov cx , [size]
    shl cx,1
    sub cx , 2 

    mov di,cx

    loop1 :

        mov ax , [bx + si]

        mov dx , [bx + di]

        xchg ax , [bx + di]

        xchg dx , [bx + si]
        
        add si , 2

        sub di , 2

        cmp si , di 

        jb loop1 

        mov ax , 0x4c00 
        int 0x21 


