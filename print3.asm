.model small
.stack 100h
.data
i byte 0
.code
main proc
mov ax,@data
mov ds,ax



condition:
cmp i,10
jl for_loop
jmp L1
for_loop:
mov ah,2
mov dl,'*'
int 21h
inc i
jmp condition

L1:
mov ah,4ch
int 21h
main endp
end main