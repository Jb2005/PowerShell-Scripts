<#
.SYNOPSIS
Queries ActiveDirectory for a group name based on the part you know.
.DESCRIPTION
Finds the Groups Name and Description. This excepts wildcards.
.PARAMETER SamAccountName
The name of the ActiveDirectory account you want to query.
.EXAMPLE
Find-Group VPN*
#>

function Find-Group{
    Param(
        [string]$GroupNamePart
        )

Get-ADGroup -Filter "name -like'$GroupNamepart'" -Properties Description  | select Name,Description
}