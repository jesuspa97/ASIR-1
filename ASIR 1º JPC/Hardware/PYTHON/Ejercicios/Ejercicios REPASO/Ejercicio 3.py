'''3. Realizar un programa que pida por pantalla una palabra y un número y muestre por pantalla esa
palabra tantas veces como valor tenga el número '''
palabra=input('Indícame una palabra : ')
repetir=int(input('Indícame cuantas veces quieres que se repita la palabra : '))
for i in range(0,repetir):
    print(palabra,end=' ')