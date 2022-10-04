do   
{   
    $nombre = Read-Host "Dime el nombre de un servicio"
    $compservicio = (Get-Service -name $nombre -ErrorAction SilentlyContinue).count

    if ($compservicio -ne 0)
    {
        $compstatus = (Get-Service -Name $nombre).Status 

        if ($compstatus -eq "Stopped")
        {
            $parado = Read-Host "Este proceso se encuentra parado. ¿Desea iniciarlo? y/n"
            switch ($parado)
            {
                "y" {Start-Service -Name $nombre}
                "n"{Write-Host "Cerrando programa..."}

            }
        }
        else
        {
          $iniciado = Read-Host "Este proceso se encuentra iniciado. ¿Desea pararlo? y/n"  
          switch ($iniciado)
            {
                "y" {Stop-Service -Name $nombre}
                "n"{Write-Host "Cerrando programa..."}

            }
        }
    }
    else
    {
        Write-Host "No existe ningun proceso con este nombre. Vuelva a intentarlo"
    }
} while ($compservicio -eq 0)