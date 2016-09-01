.model small
.stack 100h
.data
.code
	main proc
	mov ah,2
	mov dl,'y'
	int 21h
	mov dl,'o'
	int 21h
	mov dl,'u'
	int 21h
	mov dl,'n'
	int 21h
	mov dl,'a'
	int 21h
	mov dl,10
	int 21h
	mov dl,13
	int 21h
	mov dl,'s'
	int 21h
	mov ah,4ch
	int 21h
	main endp
	end main
