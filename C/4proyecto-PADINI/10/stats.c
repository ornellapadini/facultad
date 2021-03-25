#include <stdio.h>
#include <stdbool.h>
#define TAM 5

int pedirEntero(void){
    int x;
    scanf("%d", &x);
    return x;
}

void pedirArreglo(float a[], int tam)
{
    int i= 0;
    while (i < tam)
    {
        printf("[%d/%d] ingrese el elemento %i: ", (i + 1), tam, i);
        a[i] = pedirEntero();
        i++;
    }
    
}

struct datos_t
{
    float maximo;
    float minimo;
    float promedio;
};

struct datos_t stats(float a[], int tam) 
{
    int i = 0;
    float suma = 0;
    struct datos_t res;
    res.maximo = a[0];
    res.minimo = a[0];
    res.promedio = 0;
    while (i < tam)
    { 
        if (a[i] < res.minimo){
            res.minimo = a[i];
        }else if (a[i] > res.maximo) {
            res.maximo = a[i];
        }
        float suma = suma + a[i];
        i++;
    }
    res.promedio = suma / tam;
    return res;
    
}

int main(void){
    float a[TAM];
    pedirArreglo(a, TAM);
    struct datos_t res = stats(a, TAM);
    printf("el valor minimo del arreglo es %.2f\n\n", res.minimo);
    printf("el valor maximo del arreglo es %.2f\n\n", res.maximo);
    printf("el valor promedio del arreglo es %.2f\n\n", res.promedio);
    return 0;
}