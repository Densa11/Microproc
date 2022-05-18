.686
.model flat,stdcall
.stack 100h
.data
arr dw 0B8F7h,03DA6h,0E77Fh,06633h ; ������ �������� ������
m dw 0000000010000000b ; ���������� ����� ��� �������� ������� ������ � X Y Z Q
.code
ExitProcess PROTO STDCALL :DWORD
Start:
xor eax,eax ;������� �������� EAX 
xor ebx,ebx ;������� �������� EBX 
xor ecx,ecx ;������� �������� ECX 
xor edx,edx ;������� �������� EDX 
lea esi,[arr] ; ��� ���������� ������
lea edi,[arr] ; ��� ���������� ������ 
mov cx,4 ; ��������� � �������� ECX 4
mov bx,m ; ������� ����� � bx
@cycle: ; ������ �����
lodsw ; �������� ����� �� ������
xor ax,bx ; ������� ����� �� �����, ������� ��������� � bx
stosw ; ������� ����� � ������
loop @cycle ; ����� �����
lea esi,[arr]
mov edx,eax ; �������� � �������� EAX � ������� EDX Q
lodsw
mov edi,eax ; �������� � �������� EAX � ������� EDI X
lodsw
mov ebx,eax ; �������� � �������� EAX � ������� EBX Y
lodsw
mov ecx,eax ; �������� � �������� EAX � ������� ECX Z
mov eax,edi ; �������� � �������� EAX � ������� EDI X
and eax,ebx ; X & Y
or ecx,edx ; Z or Q
add eax,ecx ; �������� ����������� (�)
mov ecx,4
xor edx,edx ; �������� EDX
mov dl,al ; �������� �������� ����� ������������ � EDX
cmp edx,ecx ; ������� (�� M < 4)
jb pp1
jae pp2

pp1:
mov ecx,4h ; �������� 4 ������������ � ������� ECX
add eax,ebx ; ���������� 1 �������
;mov eax,-2 ; ��� �������� �������� � adr1
jmp foma
jmp exit

pp2:
mov edx,999h ; �������� 999 ������������ � ������� EDX
sub eax,edx ; ���������� �� M �������� 999
mov edx,eax ; �������� � �������� EAX � ������� EDX
xor eax,eax ; �������� �������� EAX
xor ecx,ecx ; �������� �������� E�X
lahf ; ������ �������� ������ � ������� EAX
mov cl,ah ; �������� � �������� EAX � ������� ECX
shl cl,7 ; ����� ����� �� 7 �����
shr cl,7 ; ����� ������ �� 7 �����
sub edx,ecx ; ��������� �� � �������� ����� CY
mov eax,edx ; �������� � �������� EDX � ������� EAX
jmp foma

foma:
mov ebx,0
cmp eax,ebx ; ��������� (R < 0)
jl adr1
jg adr2

adr1:
xor eax,edi
jmp exit

adr2:
xor eax,1011h

exit:
Invoke ExitProcess,1
End Start