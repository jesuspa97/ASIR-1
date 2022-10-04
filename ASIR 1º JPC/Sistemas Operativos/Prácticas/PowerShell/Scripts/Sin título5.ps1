do
{
    $Nombre = Read-Host "Indique el nombre que quiere poner"
    $Repetido? = (try {Get-LocalUser -Name "$Nombre"} catch{}) -ne $null
}
while ($Repetido? -ge "1")
    $Password = Read-Host "Indique la contraseña (Debe tener mínimo 6 caracteres)"
    $OcultarPassword = ConvertTo-SecureString $Password -AsPlainText -Force
    
       if ($Repetido? -ge "1" ) 
    {
        Write-Host "El nombre de usuario seleccionado ya existe, elija otro"
    }
    else 
    {
        New-LocalUser $Nombre -Password $OcultarPassword
    }
