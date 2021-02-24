

function Accept-Pipeline {
    param (
        [Parameter(Mandatory=$true,
        ValueFromPipelineByPropertyName=$true)]
        [string]
        $Name,
        [Parameter(Mandatory=$true,
        ValueFromPipelineByPropertyName=$true)]
        [string]
        $Office,
        [Parameter(Mandatory=$true,
        ValueFromPipelineByPropertyName=$true)]
        [string]
        $Crazy
    )


    Write-Host "The name was $Name"
    Write-Host "The office was $Office"
    Write-Host "The office was $Crazy"
    
}
#Accept-Pipeline