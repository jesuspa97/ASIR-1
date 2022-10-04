$Nombre = Read-Host "Indique el nombre que quiere poner"
    $Repetido? = (try {Get-LocalUser -Name "$Nombre"} catch{}) -ne $null
