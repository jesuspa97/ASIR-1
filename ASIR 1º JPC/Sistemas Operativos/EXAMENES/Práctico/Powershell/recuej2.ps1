do{
$fichero= Read-Host "Indicame el nombre del fichero"
$comrpobación = Test-Path $fichero
if ($comrpobación -eq "True")
    {
    write-host "El fichero existe"
    type $fichero
    }
else{Write-Host "El archivo no existe"}
$repetir= Read-Host "Pulsa Y para repetir el script. Pulsa N para salir."
}
while($repetir -eq "Y")