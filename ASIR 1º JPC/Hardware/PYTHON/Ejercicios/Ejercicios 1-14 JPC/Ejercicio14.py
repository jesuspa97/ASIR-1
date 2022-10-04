#14. Modifica el programa anterior para que al final el programa muestre por pantalla solo los módulos suspensos.
modulos=["Hardware","Marcas","Sistemas.Op","Redes","Base de Datos","Ética","FOL"]
lista_notas=[]

for i in range(7):
    nota=int(input(f"Dime la nota de {modulos[i]} :"))
    lista_notas.append(nota)


for i in range(7):
    if lista_notas[i]<5:
        print(f"El módulo {modulos[i]} esta suspenso con la nota {lista_notas[i]}")
