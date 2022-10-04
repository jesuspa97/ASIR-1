# tupla -> lista q no se puede modificar
# ocupa menos espacio y mayor optiizacion 
# va con parentesis en vez de cochetes
tupla = (1,2,3,4,3,2,4,2, "Maria")
lista = [1,2,3,4,3,2,4,2, "Maria"]

# contar elementos 
print(tupla.count(2))

# nos dice el index
print(tupla.index("Maria"))

# logitud tupla
print(len(tupla))

# pasar de una lista a una tupla asignarla a una variable
# lista.append("Jaime")     ---Nod deja añadir, aun es lista
lista_t=tuple(lista) 
# lista_t.append("Jesus")     ---No nos deja añadir, ya es tupla

# pasar de una tupla a una lista
lista_nueva=list(tupla)
