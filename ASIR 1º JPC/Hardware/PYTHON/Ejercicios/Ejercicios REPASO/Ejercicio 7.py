''' 7. Pedir 10 números en una lista y borrar el más pequeño de todos ellos.'''
listanum=[]
for i in range(0,10):
    numero=int(input('Indícame un número : '))
    listanum.append(numero)
print(listanum)
listanum.sort()
listanum.reverse()
listanum.pop()
print(listanum)

