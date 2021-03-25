#include <stdio.h> 

int pedirEntero(void){

int x=5,y=4,z=8,m=0;
printf("x=%d,y=%d,z=%d,m=%d:\n",x,y,z,m);
scanf ("%d,%d,%d,%d", &x, &y, &z, &m);
imprimeEntero(x,y,z,m);
return x;
}

void imprimeEntero (int x, int y, int z, int m)
{
  if(x<y)
{
   m=x;
}
else
{
   m=y;

}
printf("x=%d,y=%d,z=%d,m=%d:\n",x,y,z,m);

if(m<z)
{
}
else
{
   m=z;
}
printf("x=%d,y=%d,z=%d,m=%d:\n",x,y,z,m);
printf("el valor final de la variable es: %d\n", m);


}
int main(){
int x,y,z,m;
x = pedirEntero();
imprimeEntero;

return 0;
}