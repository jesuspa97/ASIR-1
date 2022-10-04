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