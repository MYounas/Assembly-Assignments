.model small
.stack 100h

.code
main proc

mov ah,1
int 21h

mov bl,al

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h

mov al,bl

sub al,30h


MOV AH, 0
mov cx,ax
loop1:
mov bx,cx
push cx
mov cx,bx
loop2:
mov ah,2
mov dl,'*'
int 21h
loop loop2

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
pop cx
loop loop1


;terminate
terminate:
mov ah,4ch
int 21h
main endp
end main