
function Find-Group ($GroupNamepart){

###
# Help to find group name
###

Get-ADGroup -Filter "name -like'$GroupNamepart'" -Properties Description  | select Name,Description
}