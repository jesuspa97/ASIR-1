'''9. Realizar una función llamada Quiniela tal que si le pasamos dos números nos devuelva un carácter
cuyo valor será '1' si el primero es mayor al segundo, 'X' si son guales y '2'si el segundo es mayor al
primero. '''


numuno=0
numdos=0
def quiniela(numuno,numdos):
    numuno=int(input('Indícame un número : '))
    numdos=int(input('Indícame un número : '))
    if numuno>numdos:
        return '1'
    elif numuno==numdos:
        return 'X'
    else:
        return '2'
print(quiniela(numuno,numdos))
