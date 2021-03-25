#include <stdio.h>
#include <assert.h>

int main(void)
{
    int pedirEntero(void)
    {
        int x;
        printf("ingresa un valor \n");
        scanf("%d",&x);
        return x;
    }
    int e;
    int x = pedirEntero();
    int y = pedirEntero();
    int z = pedirEntero();

    e = z;
    z = x;
    x = y;
    y = e;
    
    printf ("los valores finales son: x= %d, y = %d y z = %d ", x,y,z);
    
return 0;
}