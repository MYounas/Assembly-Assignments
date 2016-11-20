.model small
.stack 100h
.data
strMy byte "ABCXYZ$"
keyval byte 123
falto byte 0

.code

main proc

mov ax,@data
mov ds,ax

labelLogic:

mov cx,lengthof strMy
mov si,0

mov bl,keyval

dec cx
dec cx


myLabel:
	xor strMy[si],bl
	inc si
loop myLabel

mov ah,9
mov dx,offset strMy
int 21h

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov cx,lengthof strMy
mov si,0

mov bl,keyval

dec cx
dec cx


myLabel2:
	xor strMy[si],bl
	inc si
loop myLabel2

mov ah,9
mov dx,offset strMy
int 21h

term:
mov ah,4ch
int 21h
main endp


end main