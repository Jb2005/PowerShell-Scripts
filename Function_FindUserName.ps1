<#
.SYNOPSIS
Queries ActiveDirectory for a user's name based on the part you know.
.DESCRIPTION
Finds the users name and SamAccountName. This excepts wildcards.
.PARAMETER SamAccountName
The name of the ActiveDirectory account you want to query.
.EXAMPLE
Find-UserName SNo*

This takes one argument from the user

#>

function Find-UserName {
    Param(
        [string]$Namepart
        )

# Get the information.
    Get-ADUser -Filter "name -like'$Namepart'"  | select Name,SamAccountName
}