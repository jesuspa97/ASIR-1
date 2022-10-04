''' 4. Pedir al usuario una contraseña alfanumérica, si es igual a la almacenada, encender un LED, si
no, encender el otro.  '''

import RPi.GPIO as GPIO
import time

correcto=2
incorrecto=3
passworduno="Frutita1234"
passworddos=input("Indícame la contraseña")

GPIO.setmode(GPIO.BCM)
GPIO.setup(correcto,GPIO.OUT)
GPIO.setup(incorrecto,GPIO.OUT)

if passworduno==passworddos:
    GPIO.output(correcto,True)
    GPIO.output(incorrecto,False)
else:
    GPIO.output(correcto,False)
    GPIO.output(incorrecto,True)