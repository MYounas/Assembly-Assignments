.model small
.stack 100h
.data
	src byte "This is Younas.$"
	trg byte sizeof src dup(0)
.code

main proc
mov ax,@data
mov ds,ax
mov si,0
mov cx,lengthof src

L1:
	mov bl,src[si]
	mov trg[si],bl

	inc si
loop L1

mov ah,9
mov dx,offset trg
int 21h

mov ah,4ch
int 21h
main endp
end main