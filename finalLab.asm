.model small
.stack 100h
.data
count=50
keyboard struct
maxInput byte count
inputCount byte ?
buffer byte count dup(?)
keyboard ends

print_line macro
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
endm

kb keyboard<>
.code

main proc
mov ax,@data
mov ds,ax

mov ah,0ah
mov dx,offset kb
int 21h

print_line

MOV AL,kb.inputCount
MOV AH,0

mov di,AX
inc di
mov kb.buffer[di],'$'

mov ah,9
mov dx,offset kb.buffer
int 21h

mov ah,4ch
int 21h
main endp
end main