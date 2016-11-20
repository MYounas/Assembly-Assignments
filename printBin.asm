.model small
.stack 100h
.data
.code

main proc

mov ax,@data
mov ds,ax

call indecProc
mov cx,16
myLabel:
	;shl ax,1
	rol ax,1
	jc print1
	jnc print0
	backLoop:
loop myLabel

jmp term

print1:
	push ax
	mov ah,2
	mov dl,'1'
	int 21h
	pop ax
	jmp backLoop

print0:
	push ax
	mov ah,2
	mov dl,'0'
	int 21h
	pop ax
	jmp backLoop

term:
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

end main