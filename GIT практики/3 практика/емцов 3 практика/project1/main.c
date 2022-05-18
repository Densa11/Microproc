#include <8051.h>  
//#include <1602 rus>
#include <string.h>
void main()

{
	unsigned int i, k, j, p;
	unsigned char* str = "Hello!";
	unsigned char* str2 = "Friends";
	unsigned char* str3 = " ";
	P0 = 0x38;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0xC2;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0xC;
	P2 = 0x1;
	P2 = 0x0;
	p = 0x80;

//for(i=0;i<8;i++){
 				//P0 = str2[i];
 				P0 = 0xB2;
 				//P0 = str3[i];
 				P2 = 0x3;  
 				P2 = 0x2;
 				P0 = 0xA0;
 				//P0 = str3[i];
 				P2 = 0x3;  
 				P2 = 0x2;
 				P0 = 0xAD;
 				//P0 = str3[i];
 				P2 = 0x3;  
 				P2 = 0x2;
 				P0 = 0xA0;
 				//P0 = str3[i];
 				P2 = 0x3;  
 				P2 = 0x2;
 				P0 = 0xB1;
 				//P0 = str3[i];
 				P2 = 0x3;  
 				P2 = 0x2;
 				P0 = 0xA9;
 				//P0 = str3[i];
 				P2 = 0x3;  
 				P2 = 0x2;
 				P0 = 0xAE;
 				//P0 = str3[i];
 				P2 = 0x3;  
 				P2 = 0x2;
/*for (k=0;k<1;k++){
 				P0 = str3[k];
 				P2 = 0x3;  
 				P2 = 0x2;
}
			}*/
while(1){
		P0 = 0x8F;  
		P2 = 0x1;
		P2 = 0x0;
			for(i=0;i<7;i++) 
	{	
			for(k=0;k<=i;k++){
 				P0 = str[k];
 				P2 = 0x3;  
 				P2 = 0x2;
			}
			P0 = 0x8F;  
			P2 = 0x1;
			P2 = 0x0;
			for(k=0;k<=i;k++){
				P0 = 0x10;  
				P2 = 0x1;
				P2 = 0x0;
			}

		}
		for(i=0;i<10;i++){
			for(k=0;k<=7;k++){
 				P0 = str[k];
 				P2 = 0x3;  
 				P2 = 0x2;
					if(k>6) {
					P0 = str3[0];
 					P2 = 0x3;  
 					P2 = 0x2;
				}
			}
			for(k=0;k<=9;k++){
				P0 = 0x10;  
				P2 = 0x1;
				P2 = 0x0;
			}
		}
		P0 = 0x14;  
		P2 = 0x1;
		P2 = 0x0;
		for(i=6;i>0;i--){
			for(k=7-i;k<=7;k++){
 				P0 = str[k];
 				P2 = 0x3;  
 				P2 = 0x2;

				if(k>5) {
					P0 = str3[0];
 					P2 = 0x3;  
 					P2 = 0x2;
				}
			}
			P0 = 0x80;  
			P2 = 0x1;
			P2 = 0x0;		
		}
		P0 = str3[0];
 		P2 = 0x3;  
 		P2 = 0x2;

	}
}
end;