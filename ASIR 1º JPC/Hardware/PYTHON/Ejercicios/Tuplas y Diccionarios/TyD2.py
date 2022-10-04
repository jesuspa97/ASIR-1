'''2. Crea un diccionario vacío y vete llenándolo con nombre, edad, sexo y teléfono que se le pida
al usuario. Cada vez que se añada un nuevo dato debe imprimirse el contenido del
diccionario.'''

lista_personas={}

pregnom=input("Indícame tu nombre : ")
lista_personas["nombre"]=pregnom
print(lista_personas)

pregedad=int(input("Indícame tu edad : "))
lista_personas["edad"]=pregedad
print(lista_personas)

pregsexo=input("Indícame tu sexo : ")
lista_personas["sexo"]=pregsexo
print(lista_personas)

pregtlf=int(input("Indícame tu teléfono : "))
lista_personas["teléfono"]=pregtlf
print(lista_personas)
