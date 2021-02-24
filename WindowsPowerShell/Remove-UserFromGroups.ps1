
<#
.SYNOPSIS
To remove all gropus from a Active Directory User Account

.DESCRIPTION
You will be asked for the SamAccountName and then it will remove all groups from the person.

Vesion 1

.EXAMPLE

#>


Function Remove-UserFromGroups {

 Param(
        [string]$User
    )
   

#makes sure the Activedirectory module is loaded.
    Import-Module Activedirectory

# It is nice to see what groups someone has first
echo "Before"
Get-ADPrincipalGroupMembership $User | select name

#Get information about the user
    $Username =  Get-ADUser -Identity $User -Properties memberOf

#Get a list of groups that the user is a memebr of
    $Groups = $Username.memberOf | ForEach-Object {
        Get-ADGroup $_
        }

#Go through the groups and remove the user
    $Groups | ForEach-Object { Remove-ADGroupMember -Identity $_ -Members $Username -Confirm:$false }

#To make asure no othe groups are left.
echo " "
echo "After"
Get-ADPrincipalGroupMembership $User | select name

}