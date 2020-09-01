
<#PSScriptInfo

.VERSION 1.0

.GUID baf7554a-29d4-418f-8b37-bc52480862e2

.AUTHOR Nameless

.COMPANYNAME

.COPYRIGHT

.TAGS

.LICENSEURI

.PROJECTURI

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
This will search Active Directory for any account that is set to start within the next $days.You can use the variable $Global:Passwordn to send the password through an email or SMS messaging system.
If you have a relay set up like AWS SNS you can output to a python script for sending the information in a SMS to the end user.
I have blocked out characters that would cause the person to receave and Emoji. Yes, it can happen.
StartDateAttribute == Start date stamp on the user profile Active Directory.
PhoneToReceiveSMS  == Phone Number or Email address for sending the SMS.

.PRIVATEDATA

#> 





<# 

.DESCRIPTION 
 For creating, setting, and sending account passwords

#> 

Param()



<#
28-07-2020;
JHM

#>

Function PasswordGenerator {

    $HireDate = Get-date ## set today's date
    $Today = $HireDate.ToString("yyyy-MM-dd")
    $HireDate = $HireDate.addDays(5).toString("yyyy-MM-dd")    ## Get those accounts that start in the next 5 days

    #$Test = "DATE" ### Set date for testing the rest
    $Global:NewHires = Get-ADUser -Filter * -Property StartDateAttribute,PhoneToReceiveSMS | Where-Object {$_.StartDateAttribute -gt $Today -and $_.StartDateAttribute -lt $HireDate } | Select-Object SamAccountName,PhoneToReceiveSMS,StartDateAttribute

    foreach ($NewHire in $NewHires) {
        $Global:Name = $NewHire.SamAccountName
        $PhoneNumber = $NewHire.PhoneToReceiveSMS
        $Global:StartDate = $NewHire.StartDateAttribute

        Function CreatePassword {

## Need to add System.web for the password generater.
            Add-Type -AssemblyName System.web

            $MinLength = 13 ## characters
                $MaxLength = 15 ## characters
                $Length = Get-Random -Minimum $minLength -Maximum $maxLength
                $NonAlphaChars = 5
                $Password = [System.Web.Security.Membership]::GeneratePassword($Length, $NonAlphaChars)
                $Global:Passwordn = $Password -replace '[^\p{L}\p{Nd}/!/@/#/$/%/^/&/*/(/)/_/-/+/=/{/}/</>/./?/ ]', '9'
                $SecPassword = Convertto-SecureString -String $Passwordn -AsplainText -Force
                Set-ADAccountPassword -Identity $Name -NewPassword $SecPassword -Reset
                Set-ADUser -Identity $Name -ChangePasswordAtLogon $false
            }
        CreatePassword
        }
}PasswordGenerator
