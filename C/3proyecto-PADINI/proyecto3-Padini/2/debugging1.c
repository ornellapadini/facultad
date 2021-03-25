#include <stdio.h> 
#include <stdbool.h>


int main (void)

{

	int x=0, y=0, z=0; 
	bool w=true, b=true; //los booleanos no llevan scanf

	printf("Ingrese un numero para x:\n");//esta es 
	scanf("%d", &x);//esta es
	printf("Ingrese un numero para y:\n");
	scanf("%d", &y);
	printf("Ingrese un numero para w: \n");
	printf("Ingrese un numero para z:\n");
	scanf("%d",&z);
	printf("Ingrese un numero para b:\n");

	printf("x vale %d, x mod 4 = 0   %d\n",x, x % 4 == 0);//esta es
	printf("x vale %d, x mod 4 = 0   %s\n",x, x % 4 == 0 ? "true" : "false");//esta es "?" es un if y el primer parametro es si me da true (si me da cero me imprime true) y el segundo es si me da false (si me da 1 me da false)
	printf("x vale %d, y vale %d, x + y = 0  %d\n",x,y, (x + y == 0));
	printf("pedazo vale %s\n",(y - x) == ((-1) * z) ? "true" : "false");
	printf("Todo esto vale %s\n",((x+y == 0) && ((y - x) == ((-1) * z))) ? "true" : "false");

	printf("not b vale %d, w vale %d, !b && w ??? %s\n",!b,w,!b && w ? "true" : "false");


	return 0;
}