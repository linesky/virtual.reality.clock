section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
mov rcx,len
mov rbx,msg
call LOWERSTRING

 mov rdx, len    ;message length
 mov rcx, msg    ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel

str64:
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
          mov rsi,rbx
          mov rdi,rdx
          mov rax,[rsi]
          mov rbp, 1000000000000000000
          STR321:                
                    xor rdx,rdx
                    xor rcx,rcx
                    mov rbx,rbp
                    clc                 
                    div rbx                
                    mov rsi,rdx
                    mov ah,'0'
                    clc                
                    add al,ah
                    mov [rdi],al
                    inc rdi                
                    mov rax,rbp
                    xor rdx,rdx
                    xor rcx,rcx
                    mov rbx,10
                    clc                
                    div rbx                
                    mov rbp,rax
                    mov rax,rsi
                    cmp rbp,0
                    JNZ STR321

          pop rbp                
          pop rsi                
          pop rdi                
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
ret

           LOWERSTRING:
          push rax                
          push rbx                
          push rcx                
          push rdx                
          mov rcx,0                
          LOWERSTRING1:
                    mov al,[rbx]
                    cmp al,0                
                    JZ LOWERSTRING2
                    cmp al,'A'
                    JB LOWERSTRING3
                    cmp al,'Z'
                    JA LOWERSTRING3
                    mov ah,'a'-'A'
                    add al,ah
                    mov [rbx],al
                    LOWERSTRING3:
                    inc rbx                
                    inc rcx                
                    cmp rcx,255
                    JNZ LOWERSTRING1
          LOWERSTRING2:
          mov rax,rcx
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
          RET                
                    
                
                
                     

                
                
                

section .data

endf db " "

number dq 987654321,0
msg db 'THIS IS A STRING ._________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string



