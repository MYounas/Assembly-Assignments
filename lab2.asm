.model small
.stack 100h
.data
var byte "Enter a character?$"
var2 byte " *$"
var3 byte "***$"
.code
main proc
mov ax,@data
mov ds,ax

mov ah,9
mov dx,offset var
int 21h

mov ah,1
int 21h
mov bl,al
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov ah,9
mov dx,offset var2
int 21h
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov ah,9
mov dx,offset var3
int 21h
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov ah,2
mov dl,bl
int 21h
mov ah,4ch
int 21h
main endp
end main
