#include <stdio.h>
#include <assert.h>
#include <stdbool.h>
#define TAM 5

   struct comp_t {
    int menores;
    int iguales;
    int mayores;
  };

 void pedirArreglo(int a[]) {
    
    int i;
    i=0;
    while(i < TAM){
      printf("ingrese el %dº elemento del arreglo \n",i+1);
      scanf("%d",&a[i]);
      i=i+1;
    }
  }

  int pedirEntero(void){
    int x;
    printf("Ingrese un valor a comparar:\n");
    scanf("%d", &x);
    return x;
}
  struct comp_t cuantos(int a[], int tam, int elem){

    int i;
    i=0;

    struct comp_t otro;
    otro.menores=0;
    otro.mayores=0;
    otro.iguales=0;

    while(i < tam){
      if(a[i]==elem){
        otro.iguales=otro.iguales+1;
      }
      if(a[i]<elem){
        otro.menores=otro.menores+1;
      }
      if(a[i]>elem){
        otro.mayores=otro.mayores+1;
      }
      i++;
    }
    return otro; /* otro devuelve los valores del tipo struct comp_t y los guardamos en la variable con la que llamamos la funcion(res)*/
  }

int main(void){

  int a[TAM];
  pedirArreglo(a);
  int x = pedirEntero();
  struct comp_t res;
  res= cuantos(a, TAM, x);

  printf("Los cantidad de elementos mayores, menores e iguales son : %d, %d, %d \n", res.mayores, res.menores, res.iguales);


 
  
  return 0;
}