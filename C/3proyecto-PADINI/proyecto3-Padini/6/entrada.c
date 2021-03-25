#include <stdio.h>

int pedirEntero(void)
{
    int x;
    printf("ingrese un entero para x: \n");
    scanf("%d", &x);
    return x;
}

void imprimeEntero (int x)
{
    printf("el entero es: %d\n",x);
}

int main(void)
{
    int x;
    x = pedirEntero();
    imprimeEntero(x);
    return 0;
}