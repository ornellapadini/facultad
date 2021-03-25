#include <stdio.h>
#include <assert.h>


int pedirEntero(){
    int x;
    printf("shut up and dame un entero: \n");
    scanf("%d", &x);
    return x;
}
struct div_t 
{
    int cociente;
    int resto
};

struct div_t division (int x, int y) {
    struct div_t res;
    res.cociente = x / y;
    res.resto = x % y;
    return res;
}

int main(void){
    int x = pedirEntero();
    int y = pedirEntero();

    if((x < 0 || y < 0))
    {
        printf("Error, siga participando\n");
        return 0;
    }else if (y== 0)
    {
        printf("Error, señore la division por cero no existe\n");
        return 0;
    }else
    {
        struct div_t res = division (x,y);
        printf("el cociente de dividir %d entre %d es %d \n", x, y, res.cociente);
        printf("el resto de dividir %d entre %d es %d \n", x, y, res.resto);
    }
    return 0;
}


