
function Get-ADUserInfo {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Name
    )
    
    if ($PSBoundParameters.ContainsKey('ThingToGet')) {
        Write-Output "I got $Name!"
    }
    else {
        Write-Output "You skipped the Parameter!"
    }

    
}
