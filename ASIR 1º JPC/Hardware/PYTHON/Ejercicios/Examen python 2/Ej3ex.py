'''Escribir una función que se llame color y meta por parámetro dos tuplas con los nombres de dos
colores y devolverá True si alguno de los colores de una tupla coincide con alguno de los
valores de la otra ficha y False si no tienen ningún color en común.
Por ejemplo, se le puede pasar por parámetro: (rojo, verde) y (amarillo, verde) y
devolvería True ya que tienen en común el verde. Sin embargo, las fichas (rojo, verde) con
(amarillo, azul) devolvería False'''


listacolor1=[]
listacolor2=[]
'''Primera Tupla'''
print('PRIMERA SECUENCIA')
coloruno=input('Indícame un primer color : ')
listacolor1.append(coloruno)
colordos=input('Indícame un segundo color : ')
listacolor1.append(colordos)
tuplacolor1=tuple(listacolor1)

'''Segunda Tupla'''
print('SEGUNDA SECUENCIA')
coloruno=input('Indícame un primer color : ')
listacolor2.append(coloruno)
colordos=input('Indícame un segundo color : ')
listacolor2.append(colordos)
tuplacolor2=tuple(listacolor2)


def Color(tuplacolor1,tuplacolor2):
    comparacion = []
    for i in tuplacolor1:
        if i in tuplacolor2:
            comparacion.append(True)
        else:
            continue
    comparacion2=comparacion.count(True)
    if comparacion2>0:
        return True
    else:
        return False

print(Color(tuplacolor1,tuplacolor2))
