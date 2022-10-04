    do{
$pregunta= Read-Host "Indicame la trayectoria"
$comp = Test-Path $pregunta
if ($comp -eq "True")
    {
        $tru= Test-Path -PathType Container $pregunta
    
        if ($tru -eq "True")
            {
                Write-Host "A. para Mostrar listado de Archivos"
                Write-Host "B. para Decir cuantos ficheros tiene"
                Write-Host "C. Volver a introducir la trayectoria"

                $menu= Read-Host "Selecciona una opción"
                switch ($menu) {
                                    "A"{ls $pregunta}
                                    "B"{(ls $pregunta).count}
                                    "C"{$pregunta= Read-Host "Indicame la trayectoria"}
                                }
            }
        else{type $pregunta}
        break
    }
        

else {Write-Host "Error, el ddirectorio indicado no existe"}
}while ($menu -eq "C")