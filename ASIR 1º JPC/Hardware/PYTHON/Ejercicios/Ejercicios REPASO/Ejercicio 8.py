'''8. Rellenar una lista con 5 valores pidiendoselos al usuario y pasarle la lista a una función llamada
"eliminar negativos" que devuelva la lista habiéndole quitado todos los valores negativos de la misma '''

lista=[]

for i in range(5):
    num=int(input('Indícame un número : '))
    lista.append(num)

def negativos(lista):
    l2=[]
    for i in lista:
        if i>=0:
            l2.append(i)   
        else: 
            continue 
    return l2
listan=(negativos(lista))
print(listan)