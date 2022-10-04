#13. Escribir un programa que almacene los módulos del ciclo que estás realizando (Fundamentos del
#Hardware, Implantación de Sistemas operativos, Gestión de base de datos.) en una lista, pregunte
#al usuario la nota que ha sacado en cada módulo, y después las muestre por pantalla con el
#mensaje En <módulo> has sacado <nota> donde < módulo > es cada uno de los módulos de la lista
#y <nota> cada una de las correspondientes notas introducidas por el usuario.
modulos=["Hardware","Marcas","Sistemas.Op","Redes","Base de Datos","Ética","FOL"]
lista_notas=[]

for i in range(7):
    nota=int(input(f"Dime la nota de {modulos[i]} :"))
    lista_notas.append(nota)

for i in modulos:
    nota=int(input(f"Dime la nota de {i} :"))
    lista_notas.append(nota)

for i in range(7):
    print(f"En el Módulo {modulos[i]} has sacado una nota final  de {lista_notas[i]}")

for i in range(7):
    if lista_notas[i]<5:
        print(f"El módulo {modulos[i]} esta suspenso con la nota {lista_notas[i]}")
    if lista_notas[i]>7:
        print(f"El módulo {modulos[i]} esta aprobado notablemente con la nota {lista_notas[i]}")
    if lista_notas[i]>8:
        print(f"El módulo {modulos[i]} esta aprobado de una forma sobresaliente con la nota {lista_notas[i]}")