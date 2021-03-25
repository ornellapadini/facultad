#include <stdio.h> 

int main (void)

{
	int x=7, y=3, z=5;

	printf("x + y + 1 vale %d\n",x+y+1);
	printf("La segunda cuenta es %d\n",z*z+y*45-15*x);
	printf("la tercera cuenta es %d\n",y-2 == (x*3+1)%5);
	printf("la cuarta cuenta es %d\n",y/2*x);
	printf("la quinta cuenta es %d\n",y<x*z);

	return 0;

}
