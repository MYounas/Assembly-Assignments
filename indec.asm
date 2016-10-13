.model small
.stack 100h
.data
arr1 dw 3 dup(?)
.code

main proc

mov ax,@data
mov ds,ax

mov cx,lengthof arr1
mov si,0

inputArr:
	call indecProc
	mov word ptr arr1[si],ax
	add si,2
loop inputArr

mov cx,lengthof arr1

mov si,0

printArr1:
	mov ax,word ptr arr1[si]
	call outdecProc
	add si,2
loop printArr1

mov ah,4ch
int 21h
main endp

indecProc proc

push bx
push cx
push dx

begin:
	mov cx,0
	mov bx,0
	mov ah,1
	int 21h

cmp al,'-'
je minus

cmp al,'+'
je plus

jmp rep_loop

minus:
	mov cx,1

plus:
	int 21h

rep_loop:
	cmp al,'0'
	jl invalid
	cmp al,'9'
	jg invalid
	sub al,30h
	mov ah,0
	push ax

mov ax,10
mul bx
pop bx
add bx,ax
mov ah,1
int 21h
cmp al,13
jne rep_loop

mov ax,bx
cmp cx,0
je exit
neg ax

exit:
	pop dx
	pop cx
	pop bx

ret

invalid:
	mov ah,2
	mov dl,0ah
	int 21h
	mov dl,0dh
	int 21h
	jmp begin

indecProc endp

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