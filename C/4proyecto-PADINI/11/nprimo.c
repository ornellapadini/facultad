#include <stdio.h>
#include <stdbool.h>

bool es_primo(int x)
{
    int i=2;
    bool res = true;
    while (i<x && res)
    {
        if(x % i == 0)
            res=false;
        i = i + 1;
        
    }
    return res;
}

int pedirEntero(void)
{
    int x;
    printf("ingrese el entero: ");
    scanf ("%d", &x);
    return x;
}
int nesimo_primo(int N)
{
    int x = 2;
    int i = 1;
    while (i < N)
    {
        if (es_primo(x))
        {
            i= i + 1;
        }

        x = x + 1;
    }
    return x;
}

int main(void)
{
    int x = pedirEntero();
   /* while (x<0)
    {
        printf("usted ingreso un negativo. ingrese un positivo\n");
        x = pedirEntero();
    }*/
    int i = 1;
    int primo = nesimo_primo(x);
    printf("el n-esimo primo es %d\n", primo);
    return 0;
}
        
    
    