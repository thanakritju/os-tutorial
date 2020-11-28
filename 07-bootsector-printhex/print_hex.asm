print_hex:
    pusha
    mov bx, HEX_OUT
    add bx, 2 ; skip first two chars '0x'

    ; first hex char
    mov ax, dx
    and ax, 0xf000
    shr ax, 12
    mov cx, ax
    call convert_to_ascii
    mov [bx], cx
    inc bx
    ; second hex char
    mov ax, dx
    and ax, 0x0f00
    shr ax, 8
    mov cx, ax
    call convert_to_ascii
    mov [bx], cx
    inc bx
    ; third hex char
    mov ax, dx
    and ax, 0x00f0
    shr ax, 4
    mov cx, ax
    call convert_to_ascii
    mov [bx], cx
    inc bx
    ; forth hex char
    mov ax, dx
    and ax, 0x000f
    mov cx, ax
    call convert_to_ascii
    mov [bx], cx

    mov bx, HEX_OUT
    call print_string
    popa
    ret

convert_to_ascii: ; using cx
    cmp cx, 0xf
    jg out_of_range
    cmp cx, 0x9
    jle numbers
    jmp non_numbers

    numbers: ; 0-9
        add cx, 48 ; 0 in ascci table is 48, 0x30
        jmp end_convert

    non_numbers: ; a-f
        add cx, 87 ; a in ascci table is 97, 0x61
        jmp end_convert

    out_of_range:
        mov cx, 0
        jmp end_convert

    end_convert:
    ret

%include "../06-bootsector-printstring/print_string.asm"

HEX_OUT:
    db "0x0000", 0