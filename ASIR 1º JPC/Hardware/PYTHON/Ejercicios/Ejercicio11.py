#11. Pide un numero por teclado y guarda en una lista su tabla de multiplicar hasta el 10. Por ejemplo si pide el 5 la lista tendrá: 5,10,15,20,25,30,35,40,45,50


num=int(input("Dime el numero sobre el que quieras ver su tabla de multiplicar (desde el 1 hasta el 10) : "))
tabla_multiplicar=[]
for i in range(1,11):
    multiplicar=num*i
    tabla_multiplicar.append(multiplicar)
print(tabla_multiplicar)