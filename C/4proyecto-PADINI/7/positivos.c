#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

int main(void){
  
  int x;  

  printf("ingrese tamaño del arreglo \n");
  scanf("%d",&x);

  int b[x];
  

  void pedirArreglo(int a[], int n_max){
    
    int i;
    i=0;
    while(i < n_max){
      printf("ingrese el %dº elemento del arreglo \n",i+1);
      scanf("%d",&a[i]);
      i=i+1;
    }
  }

  pedirArreglo(b,x);

  bool existe_positivo(int a[], int tam){

    bool algo; // 0 false 1 true
    algo =false;
    int i;
    i=0;
    
    while (i < tam && algo == 0){
     if(a[i]>0){
         algo=true;
       }
     i=i+1;
    }
    return algo;
  }
  bool todos_positivos(int a[], int tam){
    bool algo;
    algo=true;
    int i;
    i=0;

    while (i<tam && algo==1){
     if(a[i]<0){
         algo=false;
       }
     i=i+1;
    }
    return algo; 
  }
  int g;
  printf("si desea ver si existen positivos en el arreglo ingrese 1 \nsi desea saber si todos los elementos del arreglo son positivos ingrese 2\n");
  scanf("%d",&g);

  bool h;
  
  if(g == 1){
    h = existe_positivo(b,x);
  }else{
    h = todos_positivos(b,x);
  }
  printf("%d \n",h);

  void imprimeArreglo(int a[], int n_max){
    
    printf("el arreglo resultante es \n");
    int i;
    i=0;
    printf("[");
    while(i<n_max){
      printf("%d,",a[i]);
      i=i+1;
    }
    printf("] \n");
  }

  imprimeArreglo(b,x);

  return 0;
}
