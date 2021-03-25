#include <stdio.h>

int main (void)
{
    int i=0;
    printf("ingrese un numero para i: \n");
    scanf("%d", &i);

    while (i!=0)
    {
        
        i=i-1;
        printf("el numero de i es: %d\n", i);
    }
    
    return 0;

}

/*Devuelve los numeros menores a i, hasta que llega a 0*/