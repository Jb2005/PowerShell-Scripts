Import-Module .\Get-ADUserInfo.ps1 -Force

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Test identity parameter' {
    
    Mock Get-ADUser {
        New-Object Microsoft.ActiveDirectory.Management.ADUser Identity -Property @{
            SamAccountName = 'jlewis'
            GivenName = 'John'
            Surname = 'Doe'
            DistinguishedName = 'CN=Doe John,CN=Users,DC=contoso,DC=com'
        }
    } -ParameterFilter {
        'jlewis' -eq $SamAccountName
    }
}  
