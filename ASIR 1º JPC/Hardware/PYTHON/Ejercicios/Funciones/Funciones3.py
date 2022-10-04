# 3. Escriba una función que con la altura y base que diga el usuario, dibuje un rectángulo de unos.
# Por ejemplo, si el usuario pone 3 de altura y 4 de base saldría:
# 1111
# 1111
# 1111

def dibujo(base,altura):
    for i in range(altura):
        for i in range(base):
            print(1, end="")
        print()
base=int(input("Dime la base que quieres que tenga el rectángulo"))
altura=int(input("Dime la altura que quieres que tenga el rectángulo"))

dibujo(base,altura)