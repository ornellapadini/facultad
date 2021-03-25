#include <stdio.h> 

int main (void)
{
	int x;
	int y;

	printf("Ingrese un numero para x:\n");
	scanf("%d", &x);
	printf("Ingrese un numero para y:\n"); 
	scanf("%d", &y);

	if (x>=y)
	{
		printf("x= %d, y= %d:\n",x,y);
		 x=0;
		printf("x= %d, y=%d:\n",x,y);
	}

	else
	{
		printf("x= %d, y= %d:\n",x,y);
		x=2;
		printf("x= %d, y= %d:\n",x,y);
	}
		printf("x=%d, y=%d:\n",x,y);

        return 0;
}