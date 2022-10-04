do
{
    $Nombre = Read-Host "Indique el nombre que quiere poner"
    $Repetido? = (Get-LocalUser -name $Nombre -erroraction silentlycontinue ).count
    if($Repetido? -ge "1")
    {
        Write-Host "El nombre de usuario seleccionado ya existe, elija otro"
    }

    else 

    {
        
        $Password = Read-Host "Indique la contraseña (Debe tener mínimo 6 caracteres)"
        $OcultarPassword = ConvertTo-SecureString $Password -AsPlainText -Force
        New-LocalUser $Nombre -Password $OcultarPassword
    }
}
while ($Repetido? -ge "1")






