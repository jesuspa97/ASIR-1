'''Crear una función que devuelva la palabra con más vocales de una lista de palabras. Al final
tendrá que aparecer “La palabra X es la que más vocales tiene'''

lista = ["flau", "pomelo", "geraneo", "pololo","supercalifragilistico"]
vocales = ["a", "e", "i", "o", "u"]
cont_lista = []

def contar_vocales(lista):
    for palabra in lista:
        cont=0
        for letra in palabra:
            for vocal in vocales:
                if letra==vocal:
                    cont=cont+1
                else:
                    continue
        cont_lista.append(cont)
    mayor = cont_lista[1]
    for numero in cont_lista:
        if numero>mayor:
            mayor=numero
        else:
            continue
    index = cont_lista.index(mayor)
    mas_vocales = lista[index]
    return mas_vocales,mayor

vocals,numero=contar_vocales(lista)
print(f"La palabra {vocals} contiene {numero}")

'''***************************DAR UN REPASO*************************'''