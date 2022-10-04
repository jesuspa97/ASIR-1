'''lista=["Maria", 9, "Juan", 3.2]
print(f"La nota de {lista[0]} es {lista[1]}")'''
#{variable[posicion lista]}


# modificar la lista
'''lista[1]=5
print(lista)'''

#contar elementos lista
'''print(len(lista))'''

# añadir elemento a la lista al final
lista.append("Nuevo")

# añadir elemento en ua posicion especifica(posicion, palabra)
lista.insert(2,"Insertado")

#imprimir una lista ordenada(sin guardar)
print(sorted(lista))
#imprimir una lista ordenada(Guardada)
lista_nombre.sort()
print(lista_nombre)

#contar un elemento(repetidos)
lista_repe=["Maria", "Juan", "Maria", "Maria", 5, 5, 5, 5, 5, 5, 5,]
maria_count=lista_repe.count("Maria")
'''variablenueva=lista.count("palabra deseada")'''

# eliminar el elemento por nombre
lista_nombre.remove("Jesus")
# eliminar el ultimo elemento de la mista (sin idicar indice)
lista_nombre.pop()
# eliminar el elemento con posición que indiquemos 
lista_nombre.pop(1)
print(lista_nombre)

# invertir lista
lista_nombre.reverse()
print(lista_nombre)

#-------------------------------------------#











































