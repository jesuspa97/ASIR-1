
preguntanombre=input("¿Cómo se llama?")
print(f"¡Bienvenido/a {preguntanombre}!")

numero1=float(input(f"Dime el primer número: "))
numero2=float(input("Dime el segundo número"))
print(numero1+numero2)
print(numero1-numero2)
print(numero1*numero2)
print(numero1/numero2)

numero1=float(input(f"Escriba un número: "))
numero2=float(input(f"Escriba otro número"))
print((numero1+numero2)/2)

nombre=input(f"Dime tu nombre: ")
letra_inicial=nombre[0]
letra_final=nombre[-1]
tres_ult=nombre[-3:]
print(letra_inicial,letra_final)
print(nombre[0:2])
print(tres_ult)
print((nombre)[::-1])

num1=int(input("Dime un primer número :"))
num2=int(input("Dime un segundo número :"))
if num1>num2:
    print("el segundo número es menor al primero ")
    print(f"ya que {num1} es mayor a {num2}")
elif num1==num2:
    print("Son iguales")
else: 
    print("El segundo número es mayor al primero ")
    print(f"ya que {num2} es mayor a {num1}")

