#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

int main(){
	int N;
	printf("Ingrese el tamaño del arreglo:\n");
	scanf("%i",&N);
	int arreglo[N];
	int n = 0;
	while(n<N){
		printf("Ingrese el elemento %i/%i del arreglo.\n",n,N-1);
		scanf("%i",&arreglo[n]);
		n = n+1;
	}
	int i,j;
	
	printf("Ingrese la primera posición a intercambiar:\n");
	scanf("%i",&i);
	assert(i<=N);
	
	printf("Ingrese la segunda posición a intercambiar:\n");
	scanf("%i",&j);
	assert(j<=N);

	int x = arreglo[i];
	arreglo[i] = arreglo[j];
	arreglo[j] = x;

	n = 0;
	while(n < N){
		printf("Elemento en posición %i: %i \n",n,arreglo[n]);
		n = n+1;
	}



}