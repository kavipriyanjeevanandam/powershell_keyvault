
$keyVaultName = "keyvault-fl-kavi"
$username = "sql-user11"

$password = -join ((65..90 + 97..122 + 48..57 + 33 + 35..38 + 42 + 64 + 95) | Get-Random -Count 12 | ForEach-Object {[char]$_})

Write-Host "$password"

$securepassword = ConvertTo-SecureString $password -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyVaultName -Name $username -SecretValue $securepassword

Write-Host "Password for '$username' is created."

$passworddownload = Get-AzKeyVaultSecret -VaultName $keyVaultName -Name $username -AsPlainText

Write-Host "Password for $username is $passworddownload."