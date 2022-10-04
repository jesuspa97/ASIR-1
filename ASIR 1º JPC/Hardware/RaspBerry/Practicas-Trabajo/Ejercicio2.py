''' 2. Conectar dos LED y hacer una intermitencia entre ambos (Cuando uno está encendido, el otro
está apagado), durante 10 segundos. '''

import RPi.GPIO as GPIO
import time

leduno=2
leddos=3

GPIO.setmode(GPIO.BCM)
GPIO.setup(leduno,GPIO.OUT)
GPIO.setup(leddos,GPIO.OUT)

for i in range (10):
    GPIO.output(leduno,True)
    GPIO.output(leddos,False)
    time.sleep(0.5)
    GPIO.output(leduno,False)
    GPIO.output(leddos,True)
    time.sleep(0.5)