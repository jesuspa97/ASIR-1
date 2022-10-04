#9. Escriba un programa que permita crear una lista de palabras y que, a continuación, pida una palabra y diga cuántas veces aparece esa palabra en la lista.
lista=[]
nveces=int(input(f"¿Cuantas palabras vas a añadir a la lista?"))

for pregunta in range(nveces):
    pregunta=input(f"Dime una palabra: ")
    if len(pregunta)>0:
        lista.append(pregunta)

print(lista)

pregunta_repetido=input(f"Dime una palabra de la lista para ver cuantas veces está repetida: ")
print(f"la palabra elegida está repetida", lista.count(pregunta_repetido), "veces")