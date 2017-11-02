Function Disable-User {
######
#CSO employees
# This will disable the user and move them to the disabled user's OU
######

#### makes sure the Activedirectory module is loaded.
Import-Module Activedirectory

#### Imput the employees user name
$User = Read-Host "Enter the SamAccountName of the person to be disabled in the system."

#### Get information about the user
$Username = Get-ADUser -Identity $User -Properties memberOf

#### Get a list of groups that the user is a memebr of
$Groups = $Username.memberOf | ForEach-Object {
    Get-ADGroup $_
}

#### Go through the groups and remove the user
$Groups | ForEach-Object { Remove-ADGroupMember -Identity $_ -Members $Username -Confirm:$false }


#### Move the user to the Disabled User OU
## --->>> UPDATE belowe for your envoronment
Get-ADUser $User | Move-ADObject -TargetPath 'OU=whereYou,DC=wantThem,DC=toGo'

#### Disable the user's account
Disable-ADAccount -Identity $User

#### Pull the user's information to make sure everything is done correctly.
Get-ADUser $User -Properties DistinguishedName,Enabled,Officephone,Office,Displayname,Emailaddress,Description,Title | Format-List DistinguishedName,Enabled,OfficePhone,Office,Displayname,emailaddress,Description,Title

#### Reminder check list
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "Did you Disabel the Phone?"
echo "!!!!"
echo " "
echo "Did you shut off the email?"
echo "!!!!"

}
