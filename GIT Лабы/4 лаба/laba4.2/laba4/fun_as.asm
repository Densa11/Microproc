.586 
.MODEL flat,C
.DATA
SUM dd 0.0
i_local DD 0
n dd 0
.CODE
extern fun_el:near ; объ€вление внешней функции fun_el
public SumR
SumR proc C
	push ebp;
	mov ebp,esp;
	mov i_local,1
	mov ecx, dword ptr [ebp+8];помещаем в ecx число итераций цикла n
	mov n, ecx
	mov esi, [ebp + 12];поместили адрес массива в esi
		L1:
		mov ebx, i_local
		sub ebx, 1;вычли 1, чтобы использовать в обращении к элементам массива
		push dword ptr [esi + ebx*4];передаЄм текущий элемент массива в функцию fun_el
		call fun_el
		fld SUM
		fadd
		inc i_local;увеличиваем счЄтчик на 1
		fstp SUM
		mov ecx, SUM
		mov [esi + ebx*4], ecx;помещаем в текущий элемент массива значение из ecx
		mov SUM, 0
		mov eax, n
	inc eax;увеличиваем n на 1
	mov ebx, i_local
	cmp ebx, eax;сравниваем текущее значение счЄтчика и n
	jne L1;если они не равны переходим к L1
	mov eax, esi;помещаем адрес массива в eax дл€ возврата в C++
	mov esp,ebp;
	pop ebp;
	ret
SumR endp
End
