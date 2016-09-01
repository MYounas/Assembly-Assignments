.model small
.stack 100h
.data
i byte 0
.code
main proc

;first string print
mov ax,@data
mov ds,ax

mov ah,2
condition:
cmp i,10
jl for_loop
jmp L1
for_loop:
mov dl,'*'
inc i
jmp condition

L1:
;terminate
mov ah,4ch
int 21h
main endp
end main
