section .data
hello: db "Hello world!",10 ; ’Hello world!’ plus a linefeed character
 helloLen: equ $-hello ; Length of the ’Hello world!’ string

 section .text
 global _start

 _start:
 mov eax,4 ; The system call for write (sys_write)
 mov ebx,1 ; File descriptor 1 - standard output
 mov ecx,hello ; Put the offset of hello in ecx
 mov edx,helloLen ; helloLen is a constant
 int 80h ; ??

 mov eax,1
 mov ebx,0
 int 80h
