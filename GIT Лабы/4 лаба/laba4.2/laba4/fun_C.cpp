#include <math.h>
#include <cmath>

extern "C" float fun_el(float x)
{
	float f;
	f = ((1 / tan(x)) + cos(x)) / pow(2.71828, x);
	return f;
}

