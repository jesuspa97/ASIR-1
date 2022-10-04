#Escriba un programa que pida dos números enteros y que escriba si el mayor es múltiplo del menor.
#Si la división entre números debe dar = 0 por lo que son múltiplos.
num1=int(input("Dime un primer número :"))
num2=int(input("Dime un segundo número :"))
cociente1=num1/num2
cociente2=num2/num1
resto1=num1%num2
resto2=num2%num1
print(resto1)
if num1>num2:
    print("El primer número es mayor al segundo número")

    if resto1==0:
        print(f"{num1} es múltiplo de {num2} ya que {cociente1} * {num2} = {num1}")
    elif resto1==1:
        print("los números son iguales")
    else:
        print(f"{num1} NO es múltiplo de {num2} ya que {cociente1} * {num2} ≠ {num1} y el resto ≠ 0")
elif num1==num2:
    print("Los números son iguales")
else:
    print(f"El segundo número es mayor al segundo")
    if resto2==0:
            print(f"{num2} es múltiplo de {num1} ya que {cociente2} * {num1} = {num2}")
    elif resto2==1:
        print("los números son iguales")
    else:
        print(f"{num2} NO es múltiplo de {num1} ya que {cociente2} * {num1} ≠ {num2} y el resto ≠ 0")