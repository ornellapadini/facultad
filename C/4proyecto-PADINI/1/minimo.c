#include <stdio.h>
#include <assert.h>

int main()
{
    int pedirEntero(void) {
        int t;
        printf("ingresa un valor \n");
        scanf("%d",&t);
        return t;
    }
    int x,e,i;
    x = pedirEntero();
    e = pedirEntero();
    if (x>e)
    {
        i = e;
    } else {
        i = x;
        assert(i <= e || e<= i);
    }
    printf("el minimo es %d\n",i);
    return 0;

}