do{
$trayectoria= Read-Host "Indicame una trayectoria"
$testt = Test-Path $trayectoria
if ($testt -eq "True")
    {
    write-host "Hay un total de" (Get-ChildItem -File).count  "archivos"
    write-host "Hay un total de" (Get-ChildItem -Directory ).count  "directorios"
    write-host "Ocupa un espacio total de" (Get-ChildItem $trayectoria |Measure-Object -Property length -Sum).sum "Kb"
    }
else {$repetir= Read-Host "La ruta no existe, ¿quieres repetir la búsqueda? Y para repetir"}
}while ($repetir -eq "Y")


