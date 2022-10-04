# 3. Pide al usuario un primer número, después le pregunta por un segundo número y comprueba si es mayor que el primero, si no lo es, sigue preguntando hasta que el usuario introduce un número mayor que el primer número. El programa termina escribiendo los dos números.
numuno=int(input("Dime el primer numero"))
numdos=int(input("Dime el segundo numero"))

while numdos<numuno:
    numdos=int(input("Dime el segundo numero"))
print(f"el {numdos} es mayor que {numuno}")