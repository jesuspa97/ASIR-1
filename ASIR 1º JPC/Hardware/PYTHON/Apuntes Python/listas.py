"""listas"""
lista=["maría", 9, "Juan", 3.2]
print(lista[0]) ###"""--> me dará el primer dato de la lista, en este caso maría"""
print(lista[1]) ###"""--> me dará el segundo dato de la lista, en este caso 1"""
print(f"La nota {lista[0]} es {lista[1]}")

lista[1]=5
print(lista)

lista.append("Nuevo") ###-->Añade un valor a la lista (por el final)
print(lista)

lista.insert(2,"Insertado en la 3 posición") ###-->Añade un valor a la lista (posición que quiero, valor )
print(lista)
print(len(lista)) ###-->nos dice cuantos valores hay en la lista

lista_nombre=["María","Jesús","Ismael","Aitor","David"]
print(sorted(lista_nombre))#imprime la lista ordenada sin modificar(no la guarda ordenada)

lista_nombre.sort()
print(lista_nombre) #si hacemos esto, te guarda la lista ya ordenada (queda modificada para siempre) ***importante los parentesis de .sort"()"

lista_repetida=["María","Pepe","Juan","María",5,6,7,8,9,10,5,5]
print(lista_repetida.count(5)) #--> Nos dice cuantos "5" hay en la lista, es decir cuantas veces está repetido.

lista_repetida.remove("Pepe")#-->elimina el elemento que le indiquemos sabiendo su nombre o contenido. posteriormente print(lista) ya que el remove la modifica
print(lista_repetida.pop())#-->Te devuelve elemento eliminado (vacío es el último).
print(lista_repetida.pop(1))#-->Te devuelve el elemento eliminado en la posicion que le indiquemos.

lista_numeros=[1,2,4,6,5]
suma=0
for elem in lista_numeros: suma=suma+elem  #suma todos los elementos de la lista.
print(suma)


correo="jesuspadilla@gmail.es"
for elem in correo:
    if elem=="@":
        print(elem)

if "" in lista_numeros:
    print("el 1 está e la lista")
else: 
    print("El número no está en la lista")

for nombrequequiera in range(10):
    print("imprimo x veces que ponga en range")
for nombrequequiera in range(5,10):
    print("imprimo x veces que ponga en range")