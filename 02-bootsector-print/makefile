FILENAME=boot_sect_hello

build:
	nasm ${FILENAME}.asm -f bin -o ${FILENAME}.bin

run: build
	qemu-system-x86_64 ${FILENAME}.bin

xxd: build
	xxd ${FILENAME}.bin