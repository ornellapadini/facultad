#include <stdio.h>

int main (void)
{
    int i;
    printf("ingrese un numero para i:%d\n");
    scanf("%d",&i);

    while (i!=0)
    {
        printf("el valor de i es: %d\n", i);
        i=0;
        printf("el valor de i es: %d\n", i);
    }
    
    return 0;
}

/*devuelve un numero aleatorio*/