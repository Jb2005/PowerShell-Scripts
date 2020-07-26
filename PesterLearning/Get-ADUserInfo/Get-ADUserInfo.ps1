
function Get-ADUserInfo {
    $Name = Get-aduser
    Read-Host $Name
    #$Username = Get-LocalUser  | Out-GridView -PassThru    
    
}Get-ADUserInfo
