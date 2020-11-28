mov bx, 30

cmp bx, 4
jle condition1
cmp bx, 40
jge condition2
mov al, 'B'
jmp end

condition1:
    mov al, 'A'
    jmp end

condition2:
    mov al, 'C'
    jmp end

end:
    mov ah, 0x0e
    int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55