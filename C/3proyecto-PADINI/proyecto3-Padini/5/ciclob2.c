#include <stdio.h>
#include <stdbool.h>

int main (void)
{
    int x, i, res;

    printf("ingrese x i res\n");
    scanf("%d %d %d", &x,&i,&res);
    res=1;//True
    i=2;

    while (i<x && res)
    {
        res= res && (x%i!=0);
        i=i+1;
        printf( "x= %d, i= %d, res= %d \n", x, i,res);
    }
        return 0;
    
}
/*este ciclo verifica si un numero es primo*/