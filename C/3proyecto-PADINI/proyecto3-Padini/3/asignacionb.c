#include <stdio.h>

int main(void)
{
    int x,y;
    printf("ingrese valores para x:\n");
    scanf("%d",&x);
    printf("ingrese un valor para y:\n");
    scanf("%d",&y);
    x=x+y;
    printf("el valor de x es:%d y el de y:%d\n",x,y);

    y=y+y;
    printf("el valor de y es:%d y el de x:%d\n", x,y);

    return 0;

}