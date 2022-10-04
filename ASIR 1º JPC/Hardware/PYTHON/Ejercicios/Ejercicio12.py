#12. Escriba una función que tome una lista de números y devuelva la suma acumulada, es decir, una 
# nueva lista donde el primer elemento es el mismo, el segundo elemento es la suma del primero con
#el segundo, el tercer elemento es la suma del resultado anterior con el siguiente elemento y así sucesivamente. Por ejemplo, la suma acumulada de [1,2,3] es [1, 3, 6].


num_num=int(input("¿Cuantos numeros quieres que tenga la lista?: "))
lista_num=[]
for i in range(num_num):
    num=int((input(f"Número {i}:" )))
    lista_num.append(num)
print(lista_num)

lista_num_nueva=[]
suma=0
for i in lista_num:

    suma=suma+i
    lista_num_nueva.append(suma)
print(lista_num_nueva)