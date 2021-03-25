#include<stdio.h>

int main(void)
{
    int x=13, y=3, i=0;
    i=0;

    while (x>=y)
    {
        x=x-y;
        i=i+1;
        printf("el valor de x es: %d\n",x);
        printf("el valor de i es: %d\n", i+1);

    }
    
    return 0;
}

/* lo que hace este ciclo, es restarle el valor de i a la variable x mientras esta sea mayor que i