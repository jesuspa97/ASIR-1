# cada elemento esta relacionado con una clave
# no puede haber dos claves iguales, valores si 
# diccionario = {clave:valor, clave1:valor1, clave2:valor2}

diccionario = {"edad":12, "num_fav":12, "cursos": ("hw", "redes", "bbdd", "ssoo")}

# mostrar el valor de una clave 
print(diccionario["edad"])
print(diccionario["cursos"][2])
print(diccionario.get("edad"))

# rellenar diccionario
diccionario_nuevo = {}
diccionario_nuevo["nombre"]="Maria"
diccionario_nuevo["lista"]=(1,2,3)
print(diccionario_nuevo)

# mostrar todas las claves de un diccionario
print(diccionario.keys())

# mostrar todas las valores de un diccionario
print(diccionario.values())

# eliminar elemento asociado a una clave
print(diccionario.pop("num_fav"))
#diccionario.pop("num_fav")
print(diccionario)

# tamaño diccionario
print(len(diccionario))