.model small
.stack 100h

.code
main proc

mov cx,5
loop1:
push cx
mov cx,5
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