
function Check-PcLastLogon {
###
# List computers not logged onto in x numbers of days.
# 
###

$FileName = Read-Host "What do you want to name the file?"
$DayInactive = Read-Host "What is your last logon time in days past"
$Time = (Get-Date).AddDays(-($DayInactive))


Get-ADComputer -Filter {LastLogonDate -lt $Time} -Properties LastLogonDate | select Name,LastLogonDate | Out-file $env:USERPROFILE\Desktop\$Filename.csv
}

