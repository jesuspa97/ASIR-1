#8. Escriba un programa que pregunte primero si se quiere calcular el área de un triángulo o la de un círculo. Si se contesta que se quiere calcular el área de un triángulo escribiendo T o t], el programa tiene que pedir entonces la base y la altura y escribir el área. Si se contesta que se quiere calcular el área de un círculo (escribiendo C o c], el programa tiene que pedir entonces el radio y escribir el área. Se recuerda que el área de un triángulo es base por altura dividido por 2 y que el área de un círculo es Pi (aproximadamente 3,141592] por el radio al cuadrado. Nota: Utilice como valor de pi el valor 3.141592.
print("Introduce C o c para calcular el área de un círculo")
print("Introduce T o t para calcular el área de un triángulo")
eleccion=input("Introduce la letra que cumpla el cálculo que deseas :")
if eleccion=="T" or eleccion=="t":
    base=int(input("Indica el tamaño de la base :"))
    altura=int(input("Indica el tamaño de la altura :"))
    areaT=((base*altura)/2)
    print(f"El área del triángulo es igual a {areaT}")
    print(f"El resultado se obtiene de ({base}*{altura})/2 = {areaT}")   
if eleccion=="C" or eleccion=="c":
    radio=int(input("Indícame el radio deseado :"))
    pi=3.141592
    areaC=(pi*(radio*radio))
    print(f"El área del círculo es igual a {areaC}")
    print(f"El resultado se obtiene de ({pi}*({radio}*{radio})) = {areaC}")
else:
    print("Cerrando el script")


