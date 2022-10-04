do   
{   
    $nombre = Read-Host "Dime el nombre de un servicio"
    $compservicio = (Get-Service -name $nombre -ErrorAction SilentlyContinue).count

    if ($compservicio -ne 0)
    {
        $compstatus = (Get-Service -Name $nombre).Status 

        if ($compstatus -eq "Stopped")
        {
            $parado = Read-Host "Este proceso se encuentra parado. ¿Desea iniciarlo? Pulsa Y para iniciarlo y N para no iniciarlo"
            switch ($parado)
            {
                "Y" {Start-Service -Name $nombre|Write-Host "Iniciando programa..."}
                "N"{Write-Host "No se han realizado modificaciones"}

            }
        }
        else
        {
          $iniciado = Read-Host "Este proceso se encuentra iniciado. ¿Desea pararlo? Pulsa Y para pararlo y N para no pararlo"  
          switch ($iniciado)
            {
                "Y" {Stop-Service -Name $nombre |Write-Host "Cerrando programa..."}
                "N"{Write-Host "No se han realizado modificaciones"}

            }
        }
    }
    else
    {
        Write-Host "No existe ningún proceso con este nombre. Vuelva a intentarlo"
    }
} while ($compservicio -eq 0) 
