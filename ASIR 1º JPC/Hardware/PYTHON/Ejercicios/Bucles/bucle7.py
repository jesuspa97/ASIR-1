# Mostrar un menú con tres opciones:
#  1- Introducción
#  2- Configuración
#  3- Salir
# A continuación, el usuario debe poder seleccionar una opción (1, 2 ó 3). Si escribe algo diferente a esos 3 números, informamos al usuario de que tiene que elegir una de esas 3 opciones. El menú se debe volver a mostrar después de que se realice cada opción, permitiendo volver a elegir. Si elige las opciones 1 ó 2 se imprimirá un texto. Si elige la opción 3, se interrumpirá la impresión del menú y el programa finalizará.
op=[]
while op!=3:
    print("###MENÚ OPCIONES###")
    print("### OPCIÓN-1 -->Introducción ###")
    print("### OPCIÓN-2 -->Configuración ###")
    print("### OPCIÓN-3 -->Salir ###")
    op=int(input("Dime una opción : "))
    if op==1:
        print("Bienvenido al curso de introducción a python...")
    if op==2:
            print("La configuración del editor de python patch debe ser...")
            print("Añade una variable...")
            print("Utiliza el comando print(variables)...")
            print("Para mostrar el valor de la variable por pantalla.")
    if op==3:
        print("Saliendo del programa...")
        print("..")
        print(".")
        break
    if op>3:
        print("Error, debes elegir una de las tres opciones.")

