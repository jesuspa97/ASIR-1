# 2. Realiza una función llamada par(a) que a partir de un número que cumpla lo siguiente:
# • Si el número es par, debe devolver O.
# • Si el número es impar debe devolver 1
# Comprueba si los siguientes números son pares o impares: 1,6,30,215,22

def par(a):
    if a%2==0:
        return 0
    else: 
        return 1

a=[1,6,30,215,22]
for i in a:
    print(par(i))
