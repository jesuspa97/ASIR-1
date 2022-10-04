'''Realiza un programa que guarde los nombres de los alumnos y las notas que han obtenido. Cada
alumno puede tener distinta cantidad de notas. Guarda la información en un diccionario cuyas
claves serán los nombres y los valores las tuplas con las notas de cada alumno.
El programa pedirá el número de alumnos que vamos a introducir, pedirá su nombre e irá
pidiendo cada una de las notas hasta que introduzcamos un número negativo.
Al final del programa, nos mostrará la lista de alumnos con cada una de sus notas
respectivamente.
NOTA: Si se introduce el nombre de un alumno que ya existe, el programa nos dará un error.'''

alumnado=int(input('Indícame cuantos alumnos hay en el aula : '))
alumnos={}
nombres=[]
notas=[]
i=0
while i<alumnado:
    nombre=input('Indícame tu nombre : ')
    nombres_count=nombres.count(nombre)
    notas=[]
    if nombres_count==0:
        nombres.append(nombre)
        i=i+1
        nota=0.1
        while nota>0:
            nota=int(input('Indícame tu nota : '))
            if nota>0:
                notas.append(nota)
            else:
                continue
        notastupla=tuple(notas)
        alumnos[nombre]=notastupla
    else:
        print('Error, ese nombre ya está incrito.')
        print('Prueba con otro nombre.')
print(alumnos)