.model small
.stack 100h
.data
.code

main proc

mov ax,32767
call outdecProc

mov ah,4ch
int 21h
main endp
outdecProc proc

push ax
push bx
push cx
push dx

mov bx,10
mov cx,0

cmp ax,0
jge elseLabel
push ax
mov ah,2
mov dl,'-'
int 21h

pop ax
neg ax

elseLabel:
	mov dx,0
	div bx
	push dx
	inc cx
	
	cmp ax,0
	jne elseLabel

mov ah,2

printLabel:
	pop dx
	add dl,30h
	int 21h
loop printLabel

pop dx
pop cx
pop bx
pop ax

ret
outdecProc endp
end main