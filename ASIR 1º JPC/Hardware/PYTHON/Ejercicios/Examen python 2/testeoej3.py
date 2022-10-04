'''lista_uno = []
lista_dos = []


for f in range(2):
    color = str(input("Ingrese un color: "))
    lista_uno.append(color)
for f in range(2):
    color = str(input("Ingrese un color: "))
    lista_dos.append(color)

tupla_uno = tuple(lista_uno)
tupla_dos = tuple(lista_dos)

def colorfuncion(tupla_uno,tupla_dos):
    comp = []
    for i in tupla_uno:
        if i in tupla_dos:
            comp.append(True)
        else:
            continue
    comp2=comp.count(True)
    if comp2>0:
        return True
    else:
        return False

print(colorfuncion(tupla_uno,tupla_dos))'''



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
