'''1.Escribir un programa que guarde en un diccionario la lista de la compra con el precio de cada uno de
los productos.
Pregunta al usuario por un producto y muestra por pantalla el precio de ese producto. Si el producto
preguntado no está en el diccionario debe mostrar un mensaje informando de ello.'''


lista_compra={"Pomelo":"0.5€","Uvas":"1.3€","Yogures":"2.4€","Leche":"3.05€","Aceite":"4.7€","Jamón":"5.5€","Fuet":"6.1€","Galletas":"7.9€"}
print("Tenemos Pomelos,Uvas,Yogures,Leche,Aceite,Jamón,Fuet,Galletas")
print("Si desea salir del programa escriba SALIR")
pregunta=input("Dime sobre qué producto deseas conocer el precio:")
while pregunta != "SALIR":
    pregunta=input("Dime sobre qué producto deseas conocer el precio:")
    if pregunta in lista_compra:
        print(lista_compra.get(pregunta))
    else:
        print("Lo siento no tenemos ese producto vuelva a escribir el producto")
print("Saliendo del programa...")