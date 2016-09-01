.model small
.stack 100h
.data
var byte 1
.code
main proc
mov ax,@data
mov ds,ax
mov cx,256
L:
mov ah,2
mov dl,cl
int 21h
loop L

mov ah,4ch
int 21h
main endp
end main