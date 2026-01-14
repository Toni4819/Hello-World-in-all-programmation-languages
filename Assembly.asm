section .data
    msg db "Hello World", 0xA   ; message + saut de ligne
    len equ $ - msg             ; longueur du message

section .text
    global _start

_start:
    ; write(1, msg, len)
    mov rax, 1      ; syscall: write
    mov rdi, 1      ; file descriptor: stdout
    mov rsi, msg    ; adresse du message
    mov rdx, len    ; longueur
    syscall

    ; exit(0)
    mov rax, 60     ; syscall: exit
    xor rdi, rdi    ; code retour 0
    syscall
