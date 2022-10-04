'''6.Realizar un programa que nos muestre un menú por pantalla como el indicado y nos permita
contabilizar votos a cada uno de los partidos eligiendo la opción adecuada hasta que se elija la opción
de salida. Al salir del recuento debe mostrar el partido ganador de las elecciones '''

PSOE=0
PP=0
PODEMOS=0
CIUDADANOS=0
VOX=0
voto=1
candidatos=['PSOE','PP','PODEMOS','CIUDADANOS','VOX']
votos=[]
while (voto!=0):
    print('##################')
    print('#VOTOS ELECCIONES#')
    print('##################')
    print()
    print('------------------')
    print('1.- PSOE')
    print('2.- PP')
    print('3.- PODEMOS')
    print('4.- CIUDADANOS')
    print('5.- VOX')
    print('0.- SALIR DEL RECUENTO')
    print('------------------')
    voto=int(input('Indíca el número de partido al que desees votar : '))

    if (voto==1):
        PSOE=PSOE+1
        print('Ha votado a PSOE')
    elif (voto==2):
        PP=PP+1
        print('Ha votado a PP')
    elif (voto==3):
        PODEMOS=PODEMOS+1
        print('Ha votado a PODEMOS')
    elif (voto==4):
        CIUDADANOS=CIUDADANOS+1
        print('Ha votado a CIUDADANOS')
    elif (voto==5):
        VOX=VOX+1
        print('Ha votado a VOX')
    elif (voto==0):
        print('CERRANDO RECUENTO...')
        print('CERRANDO RECUENTO..')
        print('CERRANDO RECUENTO.')
        break
    else:
        print('El número indicado no sirve, vuelva a probar.')

votos.append(PSOE)
votos.append(PP)
votos.append(PODEMOS)
votos.append(CIUDADANOS)
votos.append(VOX)

mayor=votos[0]
for i in votos:
    if mayor<i:
        mayor=i
    else:
        continue

ganador=votos.index(mayor)
ganadornombre=candidatos[ganador]
print(f'El partido ganador ha sido {ganadornombre} con {mayor} votos.')