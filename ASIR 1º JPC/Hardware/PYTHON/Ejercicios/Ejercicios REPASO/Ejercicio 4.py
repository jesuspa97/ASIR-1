''' 4.Realizar una función que devuelva cuántos años completos (ya cumplidos) tiene una persona
recogiendo la fecha de su nacimiento por parámetros respecto a la fecha de hoy. Hacer el programa
que ejecute dicha función'''

dia=int(input('Indícame el número de día que es hoy : '))
mes=int(input('Indícame el número de mes en el estamos : '))
año=int(input('Indícame el número de año en el que estamos : '))
    
dia2=int(input('Indícame el número de día que es tu cumpleaños : '))
mes2=int(input('Indícame el número de mes que es tu cumpleaños : '))
año2=int(input('Indícame el número de año que naciste : '))
def ejercicio4 (dia,mes,año,dia2,mes2,año2):
    resultado=año-año2
    if (mes<mes2):
        resultado=resultado-1
    elif (dia<dia2 and mes==mes2):
        resultado=resultado-1
    else:
        resultado=resultado
    return resultado
    
print(ejercicio4 (dia,mes,año,dia2,mes2,año2))