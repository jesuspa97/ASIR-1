'''1.Importar los pines'''
import RPi.GPIO as GPIO 

'''2.Importar módulo de tiempo'''
import time

'''3.Crear variables de pines con su número de pin'''
variable=(número de pin)

'''4.Decir al programa en que modo voy a usar los pines BCM o Board   '''
GPIO.setmode(GPIO.BCM)
***GPIO.setmode(GPIO.Board)
'''5.   '''
GPIO.setup(led,GPIO.OUT)#Indicamos la variable y si la variable es de salida o de entrada, en este caso es de salida el LED.

'''6.   '''


'''7.   '''

#PRACTICA EJERCICIO 1
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









