

$ErrorActionPreference = "CONTINUE"

$file_list =  Get-Content .\filelist.txt

try {
foreach ($file in $file_list) {
    Write-Output "Reading file $file"
    Get-Content $file $File -ErrorAction Stop
}
}
catch {
    Write-Host "An Error Occured" -ForegroundColor Magenta
}
finally{
    
}

<#

try {
    <statement list>
}
catch [[<error type>][',' <error type>]*]{
    <statement list>
}
finally {
    <statement list>
}


#>