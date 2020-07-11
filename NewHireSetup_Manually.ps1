####
# Run this as domain admin
# This adds user's to groups and fills in the needed spots in the Active Directory profile information.
# You can get the infromation from the New Hire Cheet sheet.
####

# Makes sure the ActiveDirectory cmdlets are loaded
Import-Module ActiveDirectory 

# Lets the user know information about the script
Write-Host " "
Write-Host "This is for filling out the Active Directory part of the new hire process."
Write-Host " "

Write-Host " "
Write-Host "When adding email addresses do not includ the @domain.org part."
Write-Host "For example for if you wanted to add the All_Staff@domain.org you would just enter All_Staff."


# Gets the user to work with and information needed to fill out the Active Directory profile.
$User = Read-Host "Enter users log on name"
$Description = Read-Host "Enter the users program name"
$Office = Read-Host "Enter site name"
$OfficePhone = Read-Host "Enter phone extesion"

#Files in the new ADUsers profile
    Set-ADUser -Identity $User -Office $Office -OfficePhone $OfficePhone -Description $Description -Title $Description -Server Admin-DC1

#Asks if you need to add any groups until you say no.
    while ($Groups = (Read-Host "Add this user to any security or email groups? [yes or no]") -ne 'no') {
        $GroupName = Read-Host "Enter the group name"
        Add-ADGroupMember $GroupName -Members $User 
    }
 

#prints out needed information for email to a txt file on the desktop.
Get-ADUser -Identity $User  -Properties DistinguishedName,Officephone,Displayname,Emailaddress,Description,Title | Format-List DistinguishedName,OfficePhone,Displayname,emailaddress,Description,Title | Out-File env:username\Desktop\$User.txt

Read-Host 'Press any key to continue'
