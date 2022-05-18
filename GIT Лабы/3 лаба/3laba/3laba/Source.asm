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
mov ebx,5h; для 4x4 ebx=5h, для 5x5 ebx=6h
mov eax,5h; для 4x4 eax=5h, для 5x5 eax=6h
mov ecx,2h
mov esi,0h
finit
fld matrix [0*4]
fst temp ; временная переменная

l1:
add ecx,1h
fld matrix [eax*4]
fadd temp  ; временная переменная
fst temp ; временная переменная
fstp arr_sum[esi*4]
add eax,ebx
cmp ebx,ecx
jne l1

fld arr_sum [0*4]
fidiv n ; деление на 2
fprem ; проверка наличия остатка от деления
fstp arr_sum[1*4]
cmp arr_sum[1*4],0
je l2

fld arr_sum [0*4]
fidiv m ; деление на 5
fprem ; проверка наличия остатка от деления
fstp arr_sum[1*4]
cmp arr_sum[1*4],0
je l2

; запись элементов главной и побочной диагоналей в массив
l2:
mov ecx,2h ; счетчик итераций 2<5
mov eax,5h ; для матрицы 4х4
mov edx,3h ; для матрицы 4х4
mov esi,0h
mov edi,3h
fld matrix [esi*4]
fst temp ; временная переменная
fstp newM[esi*4]
fld matrix [edx*4]
fst temp2 ; временная переменная
fstp newM[edx+1*4]
je P1

P1:
add ecx,1h
fld matrix [eax*4]
fst temp ; временная переменная
add esi,1h
fstp newM[esi*4]
add eax,ebx
add edx,edi
fld matrix [edx*4]
fst temp2 ; временная переменная
fstp newM[esi+4*4]
cmp ebx,ecx
jne P1

; считывание элементов главной диагонали из массива в матрицу, в ее побочную диагональ и наоборот
mov ecx,0h ; счетчик итераций 0<3
mov eax,3h ; для матрицы 4х4
mov ebx,3h ; для матрицы 4х4
mov edx,5h ; для матрицы 4х4
mov esi,0h 
mov edi,5h ; для матрицы 4х4
fld newM [esi*4]
fst temp ; временная переменная
fstp matrix[ebx*4]
fld newM [ebx+1*4];
fst temp2 ; временная переменная
fstp matrix[esi*4]
add esi,1h

P2:
add ecx,1h
add eax,ebx
fld newM [esi*4]
fst temp ; временная переменная
fstp matrix[eax*4]
add esi,1h ; при первом прохождении esi=2
fld newM [ebx+esi*4];
fst temp2 ; временная переменная
fstp matrix[edx*4]
add edx,edi
cmp ebx,ecx
jne P2

exit:
Invoke ExitProcess,1
End Start