[org 0x0100]

    jmp start 

greeting:     db   'Welcome to guessing game'   
length:      dw   24
dash: dw '__'
C_len : dw 19
press: db 'Press 1 to continue'

get_out : db 'You have exited the game'
G_len: dw 24
C_H : dw 'h'
C_L : dw 'l'
C_S : dw 'y'
Rules : dw 'Please guess a number and Press enter to begin. '
R_len : dw 48
first : dw 0
ask : dw 'Is this your number : '
a_len : dw 22
same : dw 'if yes press y '
S_len: dw 14
higher: dw 'if your number is higher than press h  '
H_len : dw 40
lower : dw 'if your number is lower than press l  '
L_len : dw 38
last : dw 100
mid : dw 50

clrscr:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret



greet:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 
	push bx

	
    mov ax, 0xb851 
    mov es, ax 
    mov di, 22             


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 67  

    nextchar: 
        mov al, [si]
        mov [es:di], ax
        add di, 2 
        add si, 1  
        loop nextchar 


	pop bx
    pop di 
    pop si
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4  

choice:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 
	push bx

	
    mov ax, 0xb863 
    mov es, ax 
    mov di, 60               


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x63

    next: 
        mov al, [si]
        mov [es:di], ax
        add di, 2 
        add si, 1  
        loop next 


	pop bx
    pop di 
    pop si
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4  
;..................................Paused here ...................
outt:
   push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 
	push bx

	
    mov ax, 0xb845
    mov es, ax 
    mov di, 60               


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x07 ; only need to do this once 

    L: 
        mov al, [si]
        mov [es:di], ax
        add di, 2 
        add si, 1  
        loop L 


	pop bx
    pop di 
    pop si
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4  

	input:
		push bp
		mov bp , sp
		MOV ah, 00h ; Read character from STDIN into AL (for DOS interrupt)
    	INT 16h
		pop bp
	ret


begin:
	push bp
	mov bp , sp

	call clrscr
	mov ax , Rules
	push ax 
	push word [R_len]
	call rules
	mov ah , 0x01
	int 21h
	call setval

	pop ax
	pop bp
	ret


check:
	
	push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 
	push bx
	call clrscr
    mov ax, 0xb832
    mov es, ax 
    mov di, 2               


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x17 ; only need to do this once 

    T: 
        mov al, [si]
        mov [es:di], ax
        add di, 2 
        add si, 1  
        loop T
	
	mov di , 66
	mov si , same
	mov cx , [S_len]
	mov ax , 0xb838
	mov es , ax
	xor ax , ax
	mov ah, 0x43 
	TTT: 
        mov al, [si]
        mov [es:di], ax
        add di, 2 
        add si, 1  
        loop TTT
	mov di , 2
	mov si , higher
	mov cx , [H_len]
	mov ax , 0xb850
	mov es , ax
	xor ax , ax
	mov ah, 0x40 
	R: 
        mov al, [si]
        mov [es:di], ax
        add di, 2 
        add si, 1  
        loop R

	mov di , 18
	mov si , lower
	mov cx , [L_len]
	mov ax , 0xb859	
	mov es , ax
	xor ax , ax
	mov ah, 0x41 
	YY: 
        mov al, [si]
        mov [es:di], ax
        add di, 2 
        add si, 1  
        loop YY

	call printnum
    
	pop bx
    pop di 
    pop si
    pop cx 
    pop ax 
    pop es 
    pop bp 

	ret 4
printnum: 
    push bp 
    mov  bp, sp
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 

    ; first, let's split digits and push them onto the stack 

    mov ax, [mid]   ; number to print 
    mov bx, 10       ; division base 10 
    mov cx, 0        ; total digit counter 

    nextdigit: 
        mov dx, 0    ; zero out  
        div bx       ; divides ax/bx .. quotient in ax, remainder in dl 
        add dl, 0x30 ; convert to ASCII 
        push dx      ; push to stack for later printing 
        inc cx       ; have another digit 
        cmp ax, 0    ; is there something in quotient? 
        jnz nextdigit 

    ; now let's do the printing 

    mov ax, 0xb833 
    mov es, ax 

    mov di, 30 
    nextpos: 
        pop dx          ; digit to output. Already in ASCII 
        mov dh, 0x83    ; why is this inside the loop here? 
        mov [es:di], dx 
        add di, 2 
        loop nextpos    ; cx has already been set, use that 

    pop di 
    pop dx 
    pop cx 
    pop bx 
    pop ax 
    pop es
    pop bp 
    ret 

setval:

	push bp 
	mov bp , sp
	come_here:
	mov ax , ask
	push ax
	push word [a_len]
	call check
	call input
	cmp al , [C_H]
	je hi
	cmp al , [C_L]
	je Lw
	cmp al , [C_S]
	je sem

	jmp outtt
	hi:
		call hig
		mov dx , [mid]
		jmp outtt
	Lw:
		call loww
		mov dx , [mid]
		jmp outtt
	sem:
		;call sem_sem
		jmp get
	
	outtt:
	cmp dx , 0
	je there
	cmp al , [C_S]
	jne come_here
	there:
		;call sem_sem
	get:
	pop bp
	ret


hig:
	push bp
	mov bp , sp
	push ax
	push bx
	sub sp , 2
	mov ax , [mid]
	mov [first] , ax
	mov ax , [first]
	mov bx , [last]
	sub bx , ax
	mov [bp-2] , bx
	push word [bp-2]
	call RANDSTART
	add [mid] , dl
	add sp , 2
	pop bx
	pop ax
	pop bp
	ret

loww:
	push bp
	mov bp , sp
	push ax
	push bx

	sub sp , 2

	mov ax , [mid]

	mov [last] , ax

	mov bx , [first]

	sub ax , bx

	mov [bp-2] , ax
	push word [bp-2]
 	call RANDSTART
	sub [mid] , dl
	add sp , 2
	pop bx
	pop ax
	pop bp
	ret





RANDSTART:
   push bp
   mov bp , sp
   push ax
   push cx
   
   mov AH, 00h  ; interrupts to get system time        
   int 1AH      ; CX:DX now hold number of clock ticks since midnight      

   mov  ax, dx
   xor  dx, dx
   mov  cx, [bp + 4]    
   div  cx
   
   
   pop cx
   pop ax
   pop bp
RET 2
rules:
	push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 
	push bx

	
    mov ax, 0xb847
    mov es, ax 
    mov di, 2               


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x40 ; only need to do this once 

    xx: 
        mov al, [si]
        mov [es:di], ax
        add di, 2 
        add si, 1  
        loop xx

    mov cx , 48
    mov di , 18
    mov ax , 0xb850
    mov es , ax
    xor ax , ax
    mov al , [dash]
    mov ah , 0x83
    BOD:
        mov word [es:di] , ax 
        add di , 2
        sub cx , 1
    jne BOD

	pop bx
    pop di 
    pop si
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4  

start: 
    call clrscr 

    mov ax, greeting 
    push ax
    push word [length]
	 
    call greet ; calling greeting msg
	mov ax, press 
    push ax
    push word [C_len] 
	call choice ;calling choice

	call input ;calling input
	SUB al, 30h
	mov dl , al
	cmp dl, 1
	jne exit
	call begin
	exit:
		call clrscr
		mov ax, get_out 
    	push ax
    	push word [G_len]
		call outt
    ; wait for keypress
	
    mov ah, 0x1        ; input char is 0x1 in ah 
    int 0x21 

    mov ax, 0x4c00 
    int 0x21 
