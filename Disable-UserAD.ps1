<#
.SYNOPSIS
This will disable the user and move them to the Organizational Unit of your choice.
.DESCRIPTION
You will be asked to enter the SamAccountName and the DistinguishedName of the Organizational Unit
you want the account to go into.
.PARAMETER SamAccountName
The name of the ActiveDirectory account you want to query.
#>

Function Disable-User {

#makes sure the Activedirectory module is loaded.
    Import-Module Activedirectory

#Imput the employees user name
    $User = Read-Host "Enter the SamAccountName of the person to be disabled in the system."

#Imput where you want to the account to go.
    $Ou = Read-Host "Enter the DistinguishedName of the Organizational Unit you want the account to go into."

#Get information about the user
    $Username =  Get-ADUser -Identity $User -Properties memberOf

#Get a list of groups that the user is a memebr of
    $Groups = $Username.memberOf | ForEach-Object {
        Get-ADGroup $_
        }

#Go through the groups and remove the user
    $Groups | ForEach-Object { Remove-ADGroupMember -Identity $_ -Members $Username -Confirm:$false }


#Move the user to the Disabled User OU
    Get-ADUser $User | Move-ADObject -TargetPath "$Ou"

#Disable the user's account
    Disable-ADAccount -Identity $User

#Pull the user's information to make sure everything is done correctly.
    Get-ADUser $User -Properties DistinguishedName,Enabled |
        Format-List DistinguishedName,Enabled

}
