#include <8051.h>

void main(){
	int i = 0;
	int s = 1;
	int sprev = 0;
	int temp = 0;
	char xdata* ptr = (char xdata*) 0x00;
	for(i=2; i<1024; i++){
		temp = s;
		s = s+sprev;
		sprev = temp;
	}
	*ptr = s;
}
