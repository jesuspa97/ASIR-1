''' 2. Rellenar un programa que pida 20 números por pantalla que tienen que estar comprendidos entre 1
y 10. Si alguno no lo está debe ser vuelto a pedir de nuevo mostrando un mensaje de error.'''
ejercicio2=[]
for i in range(1,21):
    pregunta=int(input('Indícame un número : '))
    if (0<pregunta>10):
        pregunta=int(input('Error, Indícame un número que esté entre el 1 y 10 : '))
    else:
        ejercicio2.append(pregunta)
print(ejercicio2)