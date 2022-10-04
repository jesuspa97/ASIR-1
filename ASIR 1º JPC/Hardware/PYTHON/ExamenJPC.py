'''1. Realiza un programa en Python que realice lo siguiente:
a. Pregunte al usuario su nombre
b. Muestra por pantalla: (1p)
“¡Bienvenido XXX! (Siendo XXX el nombre del usuario). Éstas son las actividades que puedes
realizar:
A. Cálculo del IMC (índice de masa corporal) – Escriba A
B. Suma de números– Escriba B
C. Números pares- Escriba C
D. Salir-Escriba D
 ¿Qué actividad deseas hacer?”
Este menú aparecerá por pantalla después de ejecutar cada opción, hasta que el usuario
escriba la letra:” D'''

'''Dependiendo de la opción escogida realizará una acción:
i. Si escoge la A: (1,5p)
- Pedir al usuario su peso (Kg) y altura (m) (Poner punto para separar el
entero del decimal. Ej: 1.59) y calcular el IMC sabiendo que: IMC=Peso(kg)/(altura)al cuadrado'''

'''. Si escoge la B: (2p)
Pedir al usuario números hasta que la suma de todos ellos sea 50. Cuando la suma
sea 50, muestra por pantalla la lista con los números que suman 50.
Si el número introducido más la suma acumulada suman más de 50, muestra un
mensaje por pantalla de que la lista es mayor a 50 y no lo añadas a la lista.
iii. Si escoge la C: (1,5p)
Pedir al usuario 2 números y mostrar por pantalla los números pares comprendidos
entre ambos números.
iv. Si escoge la D (1p)
Mostrará por pantalla al usuario: “Muchas gracias por haber usado este programa.”
y no vuelva a aparecer el menú más veces.'''


respuesta=0
nombre=input("Dime tu nombre : ")
print(f"¡Bienvenido {nombre}!Éstas son las actividades que puedes realizar: ")
while respuesta!="D":
    print("#####-Cálculo del IMC (índice de masa corporal) – Escriba A-#####")
    print("#####-Suma de números– Escriba B-#####")
    print("#####-Números pares- Escriba C-#####")
    print("#####-Salir-Escriba D-#####")

    respuesta=input("¿Qué actividad deseas hacer?")


    if respuesta=="A" or respuesta=="a":
        peso=int(input("Dime tu peso en kilogramos(kg) : "))
        altura=float(input("Dime tu altura en metros(m) : "))
        imc=(peso/(altura*altura))
        print(f"Tu IMC es {imc}")
        if imc<18.5:
            print("Tienes un peso por debajo del recomendado")       
        elif 18.5<imc<24.9:
            print("Tienes un peso adecuado")
        elif 25.0<imc>29.9:
            print("Tienes un peso superior al normal")
        else:
            print("Tienes un peso muy superiory estás en el rango de Obesidad.")
    elif respuesta=="B" or respuesta=="b":
        listanum=[]
        sumalista=0
        while sumalista<50:
            pregnum=int(input("Dime un número : "))
            suma=sumalista+pregnum
            print(f"La suma ha llegado exactamente a {suma}.Enhorabuena")
            if suma<51:
                listanum.append(pregnum)
                sumalista=sum(listanum)
            else: 
                print(f"No he añadido tu último valor que ha sido {pregnum} ya que excedería de 50 ")
                print(f"El resultado de la suma de todos los números que has metido es: {suma}")
                continue


    elif respuesta=="C" or respuesta=="c":
        numerouno=int(input("Dime el primer número : "))
        numerodos=int(input("Dime el otro número : "))
        if numerouno<numerodos:
            limiteuno=numerouno
            limitedos=numerodos
        else:
            limiteuno=numerodos
            limitedos=numerouno
        for i in range(limiteuno,limitedos+1):#añadiré +1 para que no de error ya que en caso de ser par no lo incluiría
            if i%2==0:
                print(i)
    elif respuesta=="D" or respuesta=="d":
        print("...")
        print("..")
        print(".")
        print("Muchas gracias por haber usado este programa.")
        break
    else:
        print("No has metido una opción válida, indicame que acción quieres realizar")
        continue


        










