.686
.model flat,stdcall
.stack 100h
.data
m dd 5h
temp dd 0.0h
temp2 dd 0.0h
n dd 2h
result dd 0.0
matrix  dd 1.0h
		dd 2.0h
		dd 3.0h
		dd 4.0h
		dd 5.0h
		dd 6.0h
		dd 7.0h
		dd 8.0h
		dd 9.0h
		dd 10.0h
		dd 11.0h
		dd 12.0h
		dd 13.0h
		dd 14.0h
		dd 15.0h
		dd 16.0h
		
arr_sum dd 0.0
		dd 0.0
	
newM    dd 0.0
		dd 0.0
		dd 0.0
		dd 0.0
		dd 0.0
		dd 0.0
		dd 0.0
		dd 0.0

.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov ebx,5h; ��� 4x4 ebx=5h, ��� 5x5 ebx=6h
mov eax,5h; ��� 4x4 eax=5h, ��� 5x5 eax=6h
mov ecx,2h
mov esi,0h
finit
fld matrix [0*4]
fst temp ; ��������� ����������

l1:
add ecx,1h
fld matrix [eax*4]
fadd temp  ; ��������� ����������
fst temp ; ��������� ����������
fstp arr_sum[esi*4]
add eax,ebx
cmp ebx,ecx
jne l1

fld arr_sum [0*4]
fidiv n ; ������� �� 2
fprem ; �������� ������� ������� �� �������
fstp arr_sum[1*4]
cmp arr_sum[1*4],0
je l2

fld arr_sum [0*4]
fidiv m ; ������� �� 5
fprem ; �������� ������� ������� �� �������
fstp arr_sum[1*4]
cmp arr_sum[1*4],0
je l2

; ������ ��������� ������� � �������� ���������� � ������
l2:
mov ecx,2h ; ������� �������� 2<5
mov eax,5h ; ��� ������� 4�4
mov edx,3h ; ��� ������� 4�4
mov esi,0h
mov edi,3h
fld matrix [esi*4]
fst temp ; ��������� ����������
fstp newM[esi*4]
fld matrix [edx*4]
fst temp2 ; ��������� ����������
fstp newM[edx+1*4]
je P1

P1:
add ecx,1h
fld matrix [eax*4]
fst temp ; ��������� ����������
add esi,1h
fstp newM[esi*4]
add eax,ebx
add edx,edi
fld matrix [edx*4]
fst temp2 ; ��������� ����������
fstp newM[esi+4*4]
cmp ebx,ecx
jne P1

; ���������� ��������� ������� ��������� �� ������� � �������, � �� �������� ��������� � ��������
mov ecx,0h ; ������� �������� 0<3
mov eax,3h ; ��� ������� 4�4
mov ebx,3h ; ��� ������� 4�4
mov edx,5h ; ��� ������� 4�4
mov esi,0h 
mov edi,5h ; ��� ������� 4�4
fld newM [esi*4]
fst temp ; ��������� ����������
fstp matrix[ebx*4]
fld newM [ebx+1*4];
fst temp2 ; ��������� ����������
fstp matrix[esi*4]
add esi,1h

P2:
add ecx,1h
add eax,ebx
fld newM [esi*4]
fst temp ; ��������� ����������
fstp matrix[eax*4]
add esi,1h ; ��� ������ ����������� esi=2
fld newM [ebx+esi*4];
fst temp2 ; ��������� ����������
fstp matrix[edx*4]
add edx,edi
cmp ebx,ecx
jne P2

exit:
Invoke ExitProcess,1
End Start