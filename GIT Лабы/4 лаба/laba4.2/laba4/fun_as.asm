.586 
.MODEL flat,C
.DATA
SUM dd 0.0
i_local DD 0
n dd 0
.CODE
extern fun_el:near ; ���������� ������� ������� fun_el
public SumR
SumR proc C
	push ebp;
	mov ebp,esp;
	mov i_local,1
	mov ecx, dword ptr [ebp+8];�������� � ecx ����� �������� ����� n
	mov n, ecx
	mov esi, [ebp + 12];��������� ����� ������� � esi
		L1:
		mov ebx, i_local
		sub ebx, 1;����� 1, ����� ������������ � ��������� � ��������� �������
		push dword ptr [esi + ebx*4];������� ������� ������� ������� � ������� fun_el
		call fun_el
		fld SUM
		fadd
		inc i_local;����������� ������� �� 1
		fstp SUM
		mov ecx, SUM
		mov [esi + ebx*4], ecx;�������� � ������� ������� ������� �������� �� ecx
		mov SUM, 0
		mov eax, n
	inc eax;����������� n �� 1
	mov ebx, i_local
	cmp ebx, eax;���������� ������� �������� �������� � n
	jne L1;���� ��� �� ����� ��������� � L1
	mov eax, esi;�������� ����� ������� � eax ��� �������� � C++
	mov esp,ebp;
	pop ebp;
	ret
SumR endp
End
