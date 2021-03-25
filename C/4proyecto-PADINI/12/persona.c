#include <stdio.h>
#include <stdbool.h>

typedef struct _persona {
    char nombre;
    int edad;
    float altura;
    float peso;
}persona_t;

float peso_promedio (persona_t a[], unsigned int longitud){
    float promedio_pesos;
    float suma_pesos = 0;
    unsigned int i = 0;
    while (i < longitud){
        suma_pesos = suma_pesos + a[i].peso;
        i++;
    }
    promedio_pesos = suma_pesos / longitud;
    return promedio_pesos;
 
}
persona_t persona_de_mayor_edad(persona_t a[], unsigned int longitud){
    unsigned int i = 0;
    float mayor = -1000;//es para asegurarnos que tome a la primera persona
    persona_t mayorPersona;
    while (i < longitud){
        if (a[i].edad > mayor){
            mayor = a[i].edad;
            mayorPersona = a[i];
        }
        i++;
    }
    return mayorPersona;
}

persona_t persona_de_menor_altura(persona_t a[], unsigned int longitud){
    unsigned int i = 0;
    float menor = 1000;
    persona_t menorAlturaPersona;
    while (i < longitud) {
        if (a[i].altura < menor ){
            menor = a[i].altura;
            menorAlturaPersona = a[i];
        }
        i++;
    }
    return menorAlturaPersona;
}

int main(void){
    persona_t p1 = {"paola", 23, 1.67, 60};
    persona_t p3 = {"julio", 45, 1.78, 80};
    persona_t p2;
    persona_t p4;
    persona_t p5;

    p2.nombre = "pablo";
    p2.edad = 54;
    p2.altura = 1.80;
    p2.peso = 79;

    persona_t a[] = {p1,p2,p3};
    printf("el peso promedio es %f\n", peso_promedio(a,3));
    p4= persona_de_mayor_edad(a,3);
    printf("la edad de la persona de mayor edad es %d\n", p4.edad);
    p5= persona_de_menor_altura(a,3);
    printf("la persona de menor altura es %f\n", p5.altura);
    return 0;
}

