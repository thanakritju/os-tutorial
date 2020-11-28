[org 0x7c00]
mov ah, 0x0e

mov bx, hello_world

loop:
    cmp byte [bx], 0
    je end
    mov al, [bx]
    int 0x10
    add bx, 1
    jmp loop


hello_world:
    db "Hello, World!", 0

end:

jmp $

times 510-($-$$) db 0
dw 0xaa55