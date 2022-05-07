[org 0x0100]

jmp start

num1 : dw 1,2,3,4,5,6,7,8,9,10   
max : dw 0
min : dw 0
sum : dw 0

start :

    mov bx,0
    mov ax , [num1+bx]
    mov word[max],ax

    outerloop:
        cmp ax , [num1+bx]
        jb update
        add bx,2
        cmp bx,8
        jnz outerloop
        jmp finding_min 

    update : 
        mov dx,[num1+bx]
        mov word[max], dx
        add bx,2
        cmp bx,10
        jnz outerloop

    finding_min :
        jmp findmin

findmin : 
    
    mov bx,10
    mov ax,[num1+bx]
    
    mov word[min],ax

    outerloop2:
        cmp ax , [num1+bx]
        ja update2
        add bx,2
        cmp bx,20
        jnz outerloop2
        jmp findingsum 

    update2 : 
        mov dx,[num1+bx]
        mov word[max], dx
        add bx,2
        cmp bx,20
        jnz outerloop2

    findingsum :
        mov ax,[max]
        mov bx,[min]
        add ax,bx
        mov word[sum],ax
       
 mov ax,0x4c00
 int 0x21
        
