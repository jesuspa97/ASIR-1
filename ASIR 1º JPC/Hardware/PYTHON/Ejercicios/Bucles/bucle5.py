# 5. Pide al usuario una cadena de caracteres (frase), y los introduce en una lista sin repetir ninguno de ellos.
listauno=[]
pregunta=input("Dime la frase que quieras añadir a la lista")

for i in pregunta:
    if listauno.count(i)==0:
        listauno.append(i)
    else:
        continue
print(listauno)