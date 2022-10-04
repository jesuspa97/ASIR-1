# 4. Crear una función que ordene la lista de número que le pasen y separe los números pares de los impares. Al final tendrá que devolver dos listas, una con los números pares y otra con los impares. NOTA: Para ordenar una lista, usar el método: sort()
def separar(lista):
    lista.sort()
    for i in lista:
        if i%2==0:
            pares.append(i)
        else:
            impares.append(i)
    return pares,impares

pares=[]
impares=[]
lista=[]

tamano=int(input("Dime que tamaño quieres que tenga la lista : "))
for i in range(tamano):
    numero=int(input("Dime el número : "))
    lista.append(numero)

par, impar= separar(lista)
print(f"Pares: {par}")
print(f"Impares: {impar}")


