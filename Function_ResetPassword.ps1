Function Reset-UserPassword {
####
#For resetting passwords
###

$samAccountName = Read-Host "What is the SamAccountName?"

$newpassword = Read-Host "What is the New Password?"


$newpwd = ConvertTo-SecureString -String $newpassword -AsPlainText -Force
Set-ADAccountPassword $samAccountName -NewPassword $newpwd -Reset
}
