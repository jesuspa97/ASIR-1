''' 10. Realizar un programa que pida dos números y muestre por pantalla todos los números comprendidos
entre ellos [el primer número Introducido por el usuario no tiene porque ser el más pequeño de los
dos]'''


numuno=int(input('Indícame un número : '))
numdos=int(input('Indícame un número : '))
mayor=0
menor=0
if numuno>numdos:
    mayor=numuno
    menor=numdos
elif numuno==numdos:
    print('Error, los números son iguales.')
else:
    mayor=numdos
    menor=numuno

for i in range(menor,mayor+1):
    print(i)
