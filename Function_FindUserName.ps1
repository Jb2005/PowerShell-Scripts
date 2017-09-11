###
# Help to find a user's SammAccountName
###
function Find-UserName ($Namepart){

# Get the information.

Get-ADUser -Filter "name -like'$Namepart'"  | select Name,SamAccountName
}