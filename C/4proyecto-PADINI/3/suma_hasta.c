#include <stdio.h>
#include <assert.h>
int pedirEntero(void){
    int n;
    printf("ingrese un numero:\n");
    scanf("%d", &n);
    return n;
}

int suma_hasta(int n){
    int i = 1;
    int suma = 0;
    while (i <= n)
    {
        suma = suma + i;
        i = i + 1;
    }
    return suma;
}

int main (void){
    int num, res;
    num = pedirEntero();
    assert(num > 0);
    res = suma_hasta(num);
    assert(res == num * (num + 1)/2);
	printf("La sumatoria desde 1 hasta %d es: %d\n", num, res);
    
        /*
    if(N<0){
		printf("Error, el número debe ser positivo.\n");
	}
	else{
        res = suma_hasta(num);
		printf("La sumatoria desde 1 hasta %d es: %d", num, res);
	}
*/
    return 0;

}

