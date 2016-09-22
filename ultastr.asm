.model small
.stack 100h
.data
	src byte "younas$"
	trg byte "$sanuoy"
.code

main proc
mov ax,@data
mov ds,ax

mov si,lengthof src
mov di,0

mov cx,lengthof src

dec cx

dec si

compare:
mov bl,trg[di]
cmp src[si],bl
jne term
inc di
dec si
loop compare


popup:
mov ah,2
mov dl,'y'
int 21h

term:
mov ah,4ch
int 21h
main endp
end main