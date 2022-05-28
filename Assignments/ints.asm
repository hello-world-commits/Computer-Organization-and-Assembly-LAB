org 100h

jmp start

data: db 'Assembly Language - Course, FAST UNIVERSITY PESHAWAR '
msglend: ;equ $-data 

data1: db ' I love pakistan '
msg2end:

clrscr:
	MOV AH,06H
	XOR AL,AL
	XOR CX,CX
	
	MOV DX,184FH
	MOV BH,00h
	INT 10H
	
ret


setmode:
	mov al,03h
	mov ah,00h
	int 10h
ret

setcursor:
	mov dh,13
	mov dl,35
	mov bh,0
	mov ah,02h
	int 10h
ret


printchr:
	mov cx,5

	mov bx,0007h
	
	mov ah, 09h
	
	mov al,2ah
	int 10h
ret

printstr:
    mov cx, msglend - data
    ;mov bx,0001h

    mov al,1
    mov bh,0
    mov bl,07
    mov dh,5
    mov dl,13
    push cs 
    pop es
    mov bp, data
    mov ah, 13h    ;to print string on screen we use 
    int 10H

        ;mov ah, 00h
        ;int 16h

ret 

setbordercolor:
    ;set side column 

    mov ah,06H
    xor al, al 
    xor cx, cx

    ; mov dx,3501h

    mov dh,23
    mov dl,01
    mov bh,05fh  ;whiteonmagenta
    int 10H

;..............top
    mov ah,06H
    xor al, al 
    xor cx, cx

    ; mov dx,3501h

    mov dh,1
    mov dl,79
    mov bh,05fh  ;whiteonmagenta
    int 10H
;...............bottom
    mov ah,06H
    xor al, al 
    ;xor cx, cx
    mov ch,23
    mov cl,0
    ; mov dx,3501h

    mov dh,24
    mov dl,79
    mov bh,05fh  ;whiteonmagenta
    int 10H

;...............right side 

    mov ah,06H
    xor al, al 
    xor cx, cx
    mov ch,0
    mov cl,78
    ; mov dx,3501h

    mov dh,23
    mov dl,79
    mov bh,05fh  ;whiteonmagenta
    int 10H

ret

drawrectangle:

    mov ah , 06H ;scroll down func
    XOR al,AL ;no of lines by which to scroll
    mov ch,07  ; upper left coener cl = col
    mov cl, 20  ; lower right corner dh = row 
    mov dh, 16  ;lower right corner  
    mov dl, 60  
    mov bh,0adh   ; ascii for green 

    int 10H

;print msg in rectangle 

    mov cx, msg2end - data1 ;calculate
    ;bh is displaypage (0) , bl is attribute (brightwidth)
    mov al, 1
    mov bh, 0
    mov bl,07 ;color the text and background
    mov dh, 11  ;row number 12
    mov dl, 31  ;col 20

    push cs
    pop es

    mov bp, data1
    mov ah , 13h ;to print string on screen 
    int 10H

ret 

whitepart:
	mov ah,06h
	mov al,10
	mov ch,7 ; upper left coener cl = col
	mov cl,15 ; lower right corner dh = row 
	mov dh,16  ;lower right corner
	mov dl,25
	mov bh,0ffh
	int 10h
ret



start:
	call clrscr
	call setmode
	call setcursor
    call printchr
    call printstr
    call setbordercolor
    call drawrectangle
    call whitepart
	mov ax,0x4c00
	int 0x21