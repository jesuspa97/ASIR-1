'''4. Escribir una función que meta por parámetro dos tuplas que representan dos fichas de dominó. La
función devolverá "True" si encajan y "False" si no encajan. Por ejemplo se le puede pasar por
parámetro: (3,4) y (5,4) y devolvería "True" ya que se podría juntar la ficha (3,4) con la (5,4)
mediante el 4. Sin embargo las fichas: (2,4) con (1,3) devolvería "False."'''
from pickle import TRUE


def juego():
    fichauno=[]
    fichados=[]
    igualdad=0

    for i in range(2):
        carauno=int(input("Indícame el número de la cara de la primera ficha : "))
        fichauno.append(carauno)
    fichaunotupla=tuple(fichauno)

    for i in range(2):
        carados=int(input("Indícame el número de la cara de la primera ficha : "))
        fichados.append(carados)
    fichadostupla=tuple(fichados)
    
    print(f"[|{fichaunotupla[0]}|{fichaunotupla[1]}|", end=(" "))
    print(f"[|{fichadostupla[0]}|{fichadostupla[1]}|")

    for i in fichaunotupla:
        if i in fichadostupla:
            igualdad=igualdad+1
        else:
            continue
    if igualdad!=0:
        return True
    else:
        return False
print(juego())


