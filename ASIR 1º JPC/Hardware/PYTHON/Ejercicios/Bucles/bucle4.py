# 4. Pide al usuario un primer número, después le pregunta por un segundo número y comprueba si la suma es igual o mayor que 15, si no lo es, sigue preguntando hasta que el usuario introduzca un número que sume 15 o más con el primero.
numuno=int(input("Dime el primer numero"))
numdos=int(input("Dime el segundo numero"))
suma=numuno+numdos
while suma<15:
    numdos=int(input("Dime el segundo numero"))
    suma=numuno+numdos
print(f"la suma de  {numdos} + {numuno} es igual a {suma} siendo esta igual o mayor a 15")


#También se podría hacer sustituyendo la variable "suma" por "numuno+numdos"-->Segundo método introducido por comillas para que no afecte al primero.

'''while numuno+numdos<15:
    numdos=int(input("Dime el segundo numero"))
print(f"la suma de  {numdos} + {numuno} es igual a {suma} siendo esta igual o mayor a 15")'''