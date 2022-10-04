'''1. Realizar una función que devuelva la media de una lista de números pasada por parámetro'''

def ejercicio1 (lista):
    suma=0
    for i in lista:
        suma=suma+i
        media=suma/len(lista)
        return media
lista1=[1,2,3,4,5,6,7]
media=ejercicio1(lista1)
print (media) 