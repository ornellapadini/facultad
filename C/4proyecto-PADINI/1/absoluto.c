#include <stdio.h>
#include <assert.h>

int main(void)
{
    int pedirEntero(void){
        int x;
        printf("ingresa un valor \n");
        scanf("%d",&x);
        return x;
    }

    int x = pedirEntero();
    if(x <= 0)
    {
        x = x * (-1);
    }else{

    }
printf("El valor absoluto es %d\n",x);
return 0;
}