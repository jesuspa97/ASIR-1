''' 1. Realizar un programa para que parpadee un led durante 40 veces, dejando entre encendido y
apagado 1 segundo.  '''

import RPi.GPIO as GPIO
import time

led=2

GPIO.setmode(GPIO.BCM)
GPIO.setup(led,GPIO.OUT)

for i in range (40):
    GPIO.output(led,True)
    time.sleep(1)
    GPIO.output(led,False)
    time.sleep(1)