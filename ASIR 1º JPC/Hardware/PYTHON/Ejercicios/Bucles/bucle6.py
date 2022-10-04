# 6. Pide al usuario números enteros hasta que el usuario ingrese el 0. Finalmente, mostrar la suma de todos los números ingresados.
listanum=[]
num=int(input("Dime un número : "))

while num!=0:
    listanum.append(num)
    num=int(input("Dime un número : "))
print(listanum)
print(f"la suma de la lista es {sum(listanum)}")