


# $ErrorActionPreference = "CONTINUE"

# $file_list =  Get-Content .\filelist.txt

# try {
# foreach ($file in $file_list) {
#     Write-Output "Reading file $file"
#     Get-Content $file $File -ErrorAction Stop
# }
# }
# catch {
#     Write-Host "An Error Occured" -ForegroundColor Magenta
# }
# finally{
#     ## Optional, but code in here will ALWAYS run
# }


$ErrorActionPreference = "CONTINUE"

try {

    New-Item Makeme.txt -ErrorAction Stop

}
catch {
    Write-Host "An Error Occured" -ForegroundColor Magenta
    Write-Host "Please create the SMTP address" -ForegroundColor Magenta
}


<#

try {
	You run a command
}
catch {
	If the commands creates an error this is what you want to happen.
}
finally {
	Optional
	Good to leave, even if empty for ease of code reading
	Whatever you want to run each time. This block runs with or without the try statement running correctly.
}
#>