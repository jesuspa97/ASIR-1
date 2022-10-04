'''Crear una función llamada “vocales” que devuelva el número de vocales que tiene la palabra
pasada como parámetro. Pide 6 palabras al usuario e imprime la palabra que más vocales tiene
usando dicha función. Al final tendrá que aparecer “La palabra que más vocales tiene es: X”
siendo X la palabra con más vocales.'''

lista_vocales = ["a", "e", "i", "o", "u"]
lista_palabras=[]
numero_vocales=[]

def vocales (palabra):
    contador_vocales=0
    for i in palabra:
        for j in lista_vocales:
            if i==j:
                contador_vocales=contador_vocales+1
            else:
                continue
    return contador_vocales

for i in range(6):
    palabra=input('Indícame una palabra : ')
    lista_palabras.append(palabra)
    numero_vocales.append(vocales(palabra))
valor_vocales=numero_vocales[0]
for n in numero_vocales:
    if n>valor_vocales:
        valor_vocales=n
    else:
        continue
cantidad=numero_vocales.index(valor_vocales)
elegida=lista_palabras[cantidad]
print(f'La palabara {elegida} es la que más vocales tiene, con un total de {valor_vocales} vocales.')
