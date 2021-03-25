#include <stdio.h>

int main(void)
{
    int x,y;
    printf("ingrese un valor para x:\n");
    scanf("%d",&x)
    printf("ingrese un valor para y:\n");
    scanf("%d",&y);

    y=y+y;
    printf("el valor de y:%d, x=%d" y,x);

    x=x+y;
    printf("el valor de x es:%d y el de y:%d\n",x,y);

    return 0;
}