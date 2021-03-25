#include <stdio.h>
#include <assert.h>

int main(void){
  int pedirEntero(void){
    int t;
    printf("ingresa el valor de hola \n");
    scanf("%d",&t);
    return t;
 }
  void imprimeEntero(void){
   printf("Hola\n");
 }
 void holaHasta(void){
 int i;
 int n;
 n = pedirEntero();
 assert(n>0);
 i = 0;
 while(i < n){
  imprimeEntero();
 i = i+1;
 }
}
holaHasta();
return 0;
}
