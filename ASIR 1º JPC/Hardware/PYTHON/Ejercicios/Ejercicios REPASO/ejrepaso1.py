def media (lista):
    suma=0
    for i in lista:
        suma=suma+i
        med=suma/len(lista)
        return med
l=[1,2,3,4,5,6,7]
med=media(l)
print (med) 