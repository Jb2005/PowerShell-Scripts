

<#
    When I have them up here before the function is works.
            Because
    Here you are saying let us look at these param first.
    If you fill them we will us the information.
    If any are mandatory you must us them
#>
#    param(
#     [Parameter(Mandatory)]
# ##  Stating we have a mandatory parameter
#     [string]$Cats,
# ##  [type]$VeriableName, 
#     [Parameter()]
# ##  Stating the parameter is optional
#     [string]$Parameter2    ## Don't need the ',' comma after the last parameter
# )

function Hello-Parameters 
{
 
<#
    When I put them here at the start of the function while it does force you to suppley a
    value for $Cats, you cannot add before.
            Because
    Here it runs the script and then asked for param.   
#>
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