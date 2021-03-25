#include <stdio.h>
int pedirEntero(void){
    int x;
    printf("Ingrese un entero:\n ");
    scanf("%d", &x);
    return x;
}
int main()
{
    int x,y,z, X, Y;
    x = pedirEntero();
    y = pedirEntero();
    printf("ingrese x,y: ");
    scanf("%d %d", &x, &y);

    X = x;
    Y = y;
    
    z = x;
    x = y;
    y = z;

    printf("los valores finales son: %d %d %d\n",x,y);
    assert(x == Y  && y == z);

    return 0;
}