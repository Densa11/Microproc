#include <iostream>

extern "C" float* SumR(int, float*);
using namespace std;

int main() {

	setlocale(LC_ALL, "Russian");

	int n = 0;// количество точек функции
	float x = 0;
	float* y = nullptr;// массив y
	cout << "Введите n: ";
	cin >> n;

	y = new float[n]; // у = массиву точек

	for (int i = 0; i < n; i++) {
		y[i] = x + 0.1;
		x = x + 0.1;
	}

	float* R = nullptr;
	R = SumR(n, y);// обращение к файлу asm

	cout << "\nРезультаты Y:\n";
	for (int i = 0; i < n; i++) {
		cout << "Y[" << i << "] = " << R[i] << endl;
	}
	return 0;
}