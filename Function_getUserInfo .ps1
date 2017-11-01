####
#This takes one argument from the user
#####
Function Get-UserInfo ($User) {

Get-ADUser $User -Properties DistinguishedName,Enabled,Officephone,Office,Displayname,Emailaddress,Description,Title | Format-List DistinguishedName,Enabled,OfficePhone,Office,Displayname,emailaddress,Description,Title

echo "Now getting group membership"

Get-ADPrincipalGroupMembership $User | select name

}