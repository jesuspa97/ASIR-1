
$fichero = Read-Host "Como quieres llamar al fichero"
$a = Test-Path $fichero
do
{   
    Write-Host "El nombre seleccionado ya existe, elija otro"
}while ($a -eq "True")
Get-Date > $fichero
        Write-Host "Se ha generado el archivo corrrectamente"