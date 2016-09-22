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

sub cx,1

L1:
	mov bl,src[si]
	mov trg[si],bl
	inc si
loop L1

mov cx,lengthof trg

;sub cx,2

inc cx

mov si,sizeof trg

sub cx,2

sub si,2

L2:
	mov ah,2
	;mov si,cx
	mov dl,trg[si]
	int 21h
	dec si
loop L2


mov ah,4ch
int 21h
main endp
end main