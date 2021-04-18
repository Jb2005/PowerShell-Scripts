### Creating new accounts in Azure Active Directory

<p>One weekend, I thought it would be fun to create new accounts in Azure Active Directory. I have created two account creation scripts for OnPrem Active Directory and wanted to see the difference. Since I’m a script first person, this was going to be done in Azure PowerShell</p>.
<p>While connecting to Azure in PowerShell 7.1, I received an error.</p.

![Connect-AzureADError](.\ConnectAzureADError.png)

<p>This is odd. It worked fine in Windows PowerShell must be a change in PowerShell that I overlooked. To rule out my device, I try on my other laptop, same results. Off to the interwebs, I go in hunt of why this is not working.</p>

<p<p>I learned that the model AzureAD is not fully supported in PowerShell 7.1. To read the full post, [here]( https://github.com/PowerShell/PowerShell/issues/12234). The short is that AzureAD is a "Windows-specific module and could not work in PowerShell 7." However, there is a work-a-round. When you import the module, tell PS7 to use Windows PowerShell. Thus, allowing the use of Windows PowerShell cmdlets in PowerShell 7. 

<p>As you can see from below, you get an warning. [Full info here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_windows_powershell_compatibility?view=powershell-7.1). In short, PowerShell is creating a remote session with Windows PowerShell to run the commands. Thus this process would also be limited to Windows computers.</p>

![ImportModule](.\ImportModule.png)

<p>Followed by your environment and tenant information below.</p>

<p>Creating an AD account in Azure is the same process in as onPrem AD. Same theory, different process.
In onPrem AD using New-ADUser you set the password by creating a secure string</p>

~~~
New-ADUser …. -AccountPassword (ConvertTo-SecureString “aPassword” -AsPlantext -force) ….
~~~

<p>In Azure AD, you need first to create an object to hold the password, then add the password, lastly set the account password with the object. According to the [cmdlet documentation](https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureaduser?view=azureadps-2.0). </p>

![PasswordProfile](.\PasswordProfile.png)

<p>The below function works in PS7 to create an Azure AD account. Nothing fancy, but it works.</p>

~~~
function NewAzureAdAccount {
    
    $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password = "&Ybhb%^*(hnby"

    New-AzureAdUser -DisplayName "Entrapta Test" -PasswordProfile $PasswordProfile -UserPrincipalName "EntraptaTest@hopesthoughts.blog" -AccountEnabled $true -MailNickName "EntraptaTest" -UsageLocation "US"
    
}
NewAzureAdAccount
~~~
 
<p>And Boom! We have our prof of concept. </p>

<p>But since passwords should never be hardcoded into a script we have to adapt it a bit. We can solve this issue by creating a secure string parameter for the password.</p>

~~~
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
~~~

<p>And there we have it a little function that could grow into a new hire script. I think the biggest difference for me is that we have to create an object to hold the password for the new account. Not bad at all and I still have plenty of weekend time to enjoy. </p>