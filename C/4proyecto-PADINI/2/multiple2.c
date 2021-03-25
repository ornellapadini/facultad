#include <stdio.h>
#include <assert.h>

int pedirEntero();

int main(){
    int y, x, z, yaux, X, Y, Z;

    x = pedirEntero();
    y = pedirEntero();
    z = pedirEntero();
    X = x;
    Y = y;
    Z = z;

    assert(x==X && y == Y && z == Z);

    yaux=y;

    y = Y + X + Z;
    z = yaux + x;
    x = yaux;

    assert(x==Y && y == X + Y + Z && z == X + Y);
    printf("el nuevo valor de x es: %d\n", x);
    printf("el nuevo valor de y es: %d\n", y);
    printf("el nuevo valor de z es: %d\n", z);
    return 0;

}