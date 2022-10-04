#10. Escriba un programa que permita crear una lista de palabras y que, a continuación, pida una palabra y elimine esa palabra de la lista.
lista=[]
nveces=int(input(f"¿Cuántas palabras quieres añadir a la lista? "))
for pregunta in range (nveces):
    pregunta=input("Dime la palabra que quieres que añada :")
    if len(pregunta)>0:
        lista.append(pregunta)

print(lista)

eliminar=input("dime que palabra quieres eliminar de la lista :")
lista.remove(eliminar)
print(lista)#lista sin la palabra indicada, el .remove modifica la lista primero , luego hacer print de lista ya que está modificada.
