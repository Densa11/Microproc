; Вариант 14
.686
.model flat,stdcall
.stack 100h
.data
X dw 15
Y dw -10
Z dw 65
M dw ?
.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov ax,X
mov bx,Y
rcr ax,5
rcr bx,5

imul ax,bx
add ax,Z
mov cx,X
rcr cx,5
add cx,bx
xor ax,cx

mov M,ax

exit:
Invoke ExitProcess,M
End Start