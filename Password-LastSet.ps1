Function Get-PasswordLastSet
{
###
# For pulling who hasn't changed their password in x amount of days.
#  
###

Import-Module ActiveDirectory

## Get needed information from user
$Days = Read-Host "Enter the amount of days you want to check since password has been changed"
#
#Will be adding abilty to select OU
#$OuName = Read-Host "Enter the Organizantional Unit you want to search in."
#
$Savefile = Read-Host "File name?"

## Script
Get-ADUser -Filter {(Enabled -eq "True")} | ? { ($_.distinguishedname -notlike '*DSADMINS*') -or ($_.DistinguishedName -notlike "Builtin*") } -Properties Office,DisplayName,PasswordLastSet | Where {$_.PassWordLastSet -le (Get-Date).AddDays(-$Days) } | select Office,DisplayName,PasswordLastSet | Out-File $env:USERPROFILE\Desktop\$Savefile.csv

}


