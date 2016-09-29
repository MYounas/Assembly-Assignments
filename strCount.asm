.model small
.stack 100h
.data
	temp byte "Av tm2H1I$"
	var byte "Number of vowels:$"
	var1 byte "Number of consonants:$"
	var3 byte "Number of digit:$"
	var4 byte "Number of white-spaces:$"
	v byte 0
	s byte 0
	con byte 0
	d byte 0

.code
	main proc
	mov ax,@data
	mov ds,ax
	mov ah,2

mov cx,lengthof temp

mov si,0
dec cx

spaces:
	push cx
	cmp temp[si],' '
	je inc_spaces
	inc si	
pop cx
Loop spaces

inc_spaces:
	cmp cx,0
	je bahr
	inc si
	inc s
	pop cx
	jmp spaces

bahr:
	mov cx,lengthof temp
	mov ah,2
	mov si,0
	dec cx

digits:
	push cx
	cmp temp[si],'0'
	jge inc_digits
in_digits:
inc si
pop cx
Loop digits	
	
inc_digits:
	cmp cx,0
	je bahr1
	cmp temp[si],'9'
	jg in_digits
	inc d
	inc si
	pop cx
	jmp digits

bahr1:
	mov cx,lengthof temp
	mov si,0
	dec cx

vowels:
	push cx
	cmp temp[si],'A'
	je inc_vowels
	cmp temp[si],'a'
	je inc_vowels
	cmp temp[si],'E'
	je inc_vowels
	cmp temp[si],'e'
	je inc_vowels
	cmp temp[si],'I'
	je inc_vowels
	cmp temp[si],'i'
	je inc_vowels
	cmp temp[si],'O'
	je inc_vowels
	cmp temp[si],'o'
	je inc_vowels
	cmp temp[si],'U'
	je inc_vowels
	cmp temp[si],'u'
	je inc_vowels
inc si
pop cx
Loop vowels

inc_vowels:
	cmp cx,0
	je consonants
	inc v	
	inc si
	pop cx
	jmp vowels

consonants:
	mov con,lengthof temp
	dec con
	mov bl,v
	sub con,bl
	mov bl,s
	sub con,bl
	mov bl,d
	sub con,bl

term:
mov ah,2

add s,48
add d,48
add v,48
add con,48

mov dl,10
int 21h
mov dl,13
int 21h

mov dl,s
int 21h

mov dl,10
int 21h
mov dl,13
int 21h

mov dl,d
int 21h

mov dl,10
int 21h
mov dl,13
int 21h

mov dl,v
int 21h

mov dl,10
int 21h
mov dl,13
int 21h

mov dl,con
int 21h

mov ah,4ch
int 21h
main endp
end main