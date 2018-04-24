<#
.SYNOPSIS
Queries ActiveDirectory for information I typically need about an AD account
(The DistinguishedName, if the Account is Enabled, The Office, Displayname, Emailaddress, 
Description, and Title)

.DESCRIPTION
Use this to pull Active Directory account information.


.EXAMPLE
Get-UserInfo BSnoopy

This takes one argument from the user

#>

Function Get-UserInfo {
    Param(
        [string]$User
    )

    #Gets to users information
    Get-ADUser $User -Properties DistinguishedName,Enabled,Office,Displayname,Emailaddress,Description,Title |
        Format-List DistinguishedName,Enabled,Office,Displayname,emailaddress,Description,Title

    echo "Now getting group membership"

    Get-ADPrincipalGroupMembership $User | select name

}