#include <stdio.h>

int main(){
    int X,Y;
    int x;
    int y;

    printf("ingrese un valor para X:\n", X);
    scanf("%d", &X);
    printf("ingrese un valor para Y:\n");
    scanf("%d", &Y);


    x= X;
    y= Y;
    x = X + 1;
	y = X + y;

    if ((x== x + 1) && (y= X + Y)){
        printf("True\n");
    }else
    {
        printf("False\n");
    }
    return 0;
}