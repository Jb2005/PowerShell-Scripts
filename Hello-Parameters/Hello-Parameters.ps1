

function Hello-Parameters {
    param(
    [Parameter(Mandatory)]
##  Stating we have a mandatory parameter
    [string]$Cats,
##  [type]$VeriableName, 
    [Parameter()]
##  Stating the parameter is optional
    [string]$Parameter2    ## Don't need the ',' comma after the last parameter

 )
 
 Write-Host "Parameter 1 value is $Cats"

     Write-Host "Parameter 2 value is $Parameter2"
}Hello-Parameters