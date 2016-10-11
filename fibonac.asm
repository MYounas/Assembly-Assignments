.model small
.stack 100h
.data
var word 0
var1 word 1
.code

main proc

mov ax, @data
mov ds, ax

mov ah, 2
mov dl, '0'
int 21h
mov dl, ' '
int 21h
mov dl, '1'
int 21h
mov dl, ' '
int 21h

mov ax, 1
mov cx, 18

fibo:
add ax, var
call outdecProc
mov bx,var
mov var1,bx
mov var,ax
mov ax,var1
loop fibo

mov ah, 4ch
int 21h
main endp
outdecProc proc

push ax
push bx
push cx
push dx

mov bx, 10
mov cx, 0

cmp ax, 0
jge elseLabel
push ax
mov ah, 2
mov dl, '-'
int 21h

pop ax
neg ax

elseLabel :
mov dx, 0
div bx
push dx
inc cx

cmp ax, 0
jne elseLabel

mov ah, 2

printLabel:
pop dx
add dl, 30h
int 21h
loop printLabel

mov ah, 2
mov dl, ' '
int 21h

pop dx
pop cx
pop bx
pop ax

ret
outdecProc endp
end main