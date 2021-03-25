#include <stdio.h>
#include <assert.h>
#define TAM 5

int pedirEntero(void){
    int n;
    printf("ingrese un numero:\n");
    scanf("%d", &n);
    return n;
}

void pedirArreglo (int a[], int n_max){
    int i = 0;
    while (i < n_max)
    {
        int elem;
        printf("ingrese el elemento en la posicion %d\n", i);
        scanf("%d", &elem);
        a[i] = elem;
        i = i +1;
    }
    
}

void imprimeArreglo (int a[], int n_max){
    int i=0;
    while (i< n_max)
    {
        printf("%d", a[i]);
        i = i + 1;
    }
    printf ("\n");
}
int sumatoria (int a[], int n_max)
{
    int  i = 0;
    int suma = 0;
    while (i < n_max)
    {
        suma = suma + a[i];
        i = i + 1;
    }
    
    return suma;
}

int main(void){
    
    int suma;
    int array[TAM];
    int N = pedirEntero();
    pedirArreglo(array, N);
    suma = sumatoria (array, N);
    printf("suma = %d\n", suma);
    return 0;
}