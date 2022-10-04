# 1. Realiza una función llamada area _triangulo(base, altura) que devuelva el área del triángulo a partir de una base y una altura. Calcula el área de un triángulo de 15 de base y 10 de altura

def area_triangulo(base,altura):
    area=(base*altura)/2
    return area


print(area_triangulo(15,10))


'''base=int(input("Dime la base que quieres que tenga el triángulo : "))
altura=int(input("Dime la altura que quieras que tenga el triángulo : "))

print(area_triangulo(base,altura))

otra manera de hallar el área es pidiendo por teclado el valor de las variables 
MIENTRAS SE FUMA 4 PERROS :)'''