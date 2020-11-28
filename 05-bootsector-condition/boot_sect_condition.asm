mov ah, 0x0e

mov al, 48

loop:
    cmp al, 58
    je the_end
    int 0x10
    add al, 1
    jmp loop

the_end:

jmp $

times 510-($-$$) db 0
dw 0xaa55