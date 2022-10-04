print("COMPARADOR DE MÚLTIPLOS")
numero_1 = int(input("Escriba un número: "))
numero_2 = int(input("Escriba otro número: "))

if numero_1 >= numero_2 and numero_1 % numero_2 != 0:
        	print(f"{numero_1} no es múltiplo de {numero_2}.")
elif numero_1 >= numero_2 and numero_1 % numero_2 == 0:
        	print(f"{numero_1} es múltiplo de {numero_2}.")
elif numero_1 < numero_2 and numero_2 % numero_1 != 0:
        	print(f"{numero_2} no es múltiplo de {numero_1}.")
else:
        	print(f"{numero_2} es múltiplo de {numero_1}.")
