''' 5. Rellenar una lista con 4 valores pidiéndoselos al usuario y mostrar por pantalla los valores de esa lista
que sean menores de 5 y la media de todos ellos.'''

lista=[]
pregunta=0
sumatorio=0
for i in range(0,4):
    pregunta=int(input('Indícame un número : '))
    lista.append(pregunta)
for i in lista:
    if (i<5):
        print(f'Los números menores a 5 son : {i}')
    else:
        continue
print()
for i in lista:
    sumatorio=sumatorio+i
    media=sumatorio/len(lista)
print(f'La media de los valores introducidos es : {media}')