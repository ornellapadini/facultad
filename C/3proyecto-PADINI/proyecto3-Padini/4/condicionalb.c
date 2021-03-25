#include <stdio.h> 

int main (void)
{
	int x=5,y=4,z=8,m=0;
	printf("x=%d,y=%d,z=%d,m=%d:\n",x,y,z,m);
	if (x<y)
	{
		m=x;
	}
	else
	{
		m=y;
	}
		printf("x=%d,y=%d,z=%d,m=%d:\n",x,y,z,m);
	
	if (m<z)
	{
		m=m;
	}
	
	else 
	{
		m=z;
	}

	return 0;

}




