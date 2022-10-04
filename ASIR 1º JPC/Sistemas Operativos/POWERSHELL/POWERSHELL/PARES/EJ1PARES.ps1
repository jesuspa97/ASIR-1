$proceso= (Get-Process | where ProcessName -eq "CalculatorApp").Id

if (($proceso).count -gt 0 ) 
    {
        Stop-Process $proceso
        Write-Host "El proceso Calculadora se cerrará en un instante..."
    }
else {Write-Host "Error, el proceso Calculadora no está ejecutandose....saliendo..."}
