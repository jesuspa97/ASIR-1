do
{
    $fichero = Read-Host "Como quieres llamar al fichero"
    $a = Test-Path $fichero
    if ($a -eq "True")
    {
        Write-Host "El nombre seleccionado ya existe, elija otro"
    }
    else 
    {
        Get-Date > $fichero
        Write-Host "Se ha generado el archivo corrrectamente"
    }
}while ($a -eq "True")
