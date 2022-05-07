[org 0x0100]

jmp start
data : dw 0

fact : 
    push bp 
    mov bp ,sp
    push ax
    push bx
    push cx 

    
    mov ax , [bp+4]
    mov dx,ax 
    mov bx , 5
    mov cx,ax

    looppp :
        mov ax,cx
        mul dx 
        sub cx,1
        mov dx,cx
        sub bx,1
        
        jnz looppp
        
    pop cx 
    pop bx
    pop ax 
    mov sp,bp
    pop bp 

    ret 4    
        

    


start : 
        mov ax, 5
        push ax 
        call fact

        mov ax , 0x4c00
        int 0x21 
