#include<stdio.h>
#include<stdbool.h>
int main (void)

{
	int x=1, y=10, z=8;
	
	printf("x + y + 1 vale %d\n",x+y+1);
	printf("z*z+y*45-15*x vale %d\n",z*z+y*45-15*x);
	printf("y-2 = (x*3+1)%5 vale %d\n",y-2 == (x*3+1)%5);
	printf("y/2*x vale %d\n",y/2*x);
	printf("y<x*z vale %d\n",y<x*z);
	printf("y<x*z da 0, este es un valor Booleano\n");
	printf("ya que aca se utilizó un <,el 0 representa el False y el 1 True\n");

	return 0;


}
