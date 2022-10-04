'''3. Crea una tupla de números. Pide al usuario un número y accede a la tupla e indica cuantas veces se
encuentra en la misma.'''
tupla_numero=(1,2,3,4,3,2,4,2,5,8,7,5,2,3,6,4,1,0,9,8,7,9,1,1,2,5,4)
numero=int(input("Dime el número que buscas en la tupla del 1 al 9 : "))
print(f"El número que buscas está repetido {tupla_numero.count(numero)} veces")