''' 3. Con los dos LED conectados encender uno de ellos cuando el usuario sea mayor de edad (Pedir
edad al usuario) y el otro cuando sea menor de edad.  '''

import RPi.GPIO as GPIO
import time

mayor=2
menor=3
edad=int(input("Indícame tu edad actual : "))


GPIO.setmode(GPIO.BCM)
GPIO.setup(mayor,GPIO.OUT)
GPIO.setup(menor,GPIO.OUT)

if edad>18:
    GPIO.output(mayor,True)
    GPIO.output(menor,False)
else:
    GPIO.output(mayor,False)
    GPIO.output(menor,True)