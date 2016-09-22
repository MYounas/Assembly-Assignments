.model small
.stack 100h
.data
	src byte "This is Younas.$"
	trg byte sizeof src dup(0)
.code

main proc
mov ax,@data
mov ds,ax
mov si,lengthof src
mov cx,lengthof src

dec si
dec si


mov di,0

L1:
	;mov si,cx
	mov bl,src[si]
	mov trg[di],bl
	inc di
	dec si
loop L1

mov si,lengthof src
dec si

mov trg[si],'$'

mov ah,9
mov dx,offset trg
int 21h

mov si,lengthof src
mov di,0

mov cx,lengthof src

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
mov ah,2
mov dl,'n'
int 21h
mov ah,4ch
int 21h
main endp
end main