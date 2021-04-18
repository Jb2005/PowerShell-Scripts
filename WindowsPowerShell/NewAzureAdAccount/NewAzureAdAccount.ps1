function NewAzureAdAccount {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [SecureString]
        $Password
    )
    $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password = "$Password"

    New-AzureAdUser -DisplayName "Entrapta Test" -PasswordProfile $PasswordProfile -UserPrincipalName "EntraptaTest@hopesthoughts.blog" -AccountEnabled $true -MailNickName "EntraptaTest" -UsageLocation "US"
    
}
NewAzureAdAccount