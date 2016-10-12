.model small
.stack 100h
.data
var byte 0
.code

main proc

mov ax,@data
mov ds,ax

mov ah,1
int 21h
mov var,al

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

cmp var,'e'
je evenBody

cmp var,'o'
je oddBody

jmp term

evenBody:
mov cx,20
mov ax,0
mov bl,2

evenFun:
	push ax
	div bl
	cmp ah,0
	pop ax
	je funCall
	backFun:
		inc ax
loop evenFun

jmp term

funCall:
	call outdecProc
	jmp backFun

oddBody:
mov cx,20
mov ax,1
mov bl,2

oddFun:
	push ax
	div bl
	cmp ah,1
	pop ax
	jge funCall2
	backFun2:
		inc ax
loop oddFun

jmp term

funCall2:
	call outdecProc
	jmp backFun2

term:
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

mov ah,2
mov dl,' '
int 21h

pop dx
pop cx
pop bx
pop ax

ret
outdecProc endp
end main