#include <htc.h>

void main()
{
	double f0 = 12000000;
	double tp = 1/f0;
	double t0 = 0.02;
	double t1 = t0/tp;
	
	double s1 = 0.6;
	double s2 = 0.3;
	
	int tCurrent = t1*0.5;
	int isStart = 0;
	int isS1 = 1;

	int i=1;
 
	P1 = 0xFE; 
	RCAP2H = 0xD8;
	RCAP2L = 0xFF; 
	T2CON &= 0xFC;
	ET2 = 1; 
	EA = 1; 
	T2CON |= 0x4; 
	P3=0;

	while(1)
	{
		if(isStart == 0)
		{
			if(P3==0x1 && !isS1)
			{
				isS1 = 1;
				tCurrent = t1*s1;
			}
			if(P3==0x2 && isS1)
			{
				isS1 = 0;
				tCurrent = t1*s2;
			}
			isStart = 1;
		}
		if(i<tCurrent) P10 = 1;
		else P10 = 0;
			
		i = i+1;
		if(i == t1){
			isStart = 0;
			i=1;
		}
	}
}