.model small
.stack 100h
.code
main proc

mov ax,@data
mov dx,ax

mov ah,1
int 21h

cmp al,'A'
jge convert
cmp al,'0'
jge simple	
jmp terminate

convert:
mov ah,2
cmp al,'F'
jg terminate
mov bl,al
sub bl,17
mov dl,10
int 21h
mov dl,13
int 21h
mov dl,'1'
int 21h
mov dl,bl
int 21h
jmp terminate

simple:
cmp al,'9'
jg terminate
mov bl,al
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
mov dl,bl
int 21h

terminate:
mov ah,4ch
int 21h
main endp
end main