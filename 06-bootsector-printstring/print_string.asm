print_string:
    pusha
    mov ah, 0x0e

    loop:
        cmp byte [bx], 0
        je end
        mov al, [bx]
        int 0x10
        inc bx
        jmp loop

    end:

    popa
    ret