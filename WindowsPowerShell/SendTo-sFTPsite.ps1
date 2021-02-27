

<#

This script requires
    Posh-SSH module.
        URL: https://github.com/darkoperator/Posh-SSH
    Windows PowerShell (PS version < 5.1)

    Author:
        JMathews@pcgus.com

    Verson: 1

#>

function SendTo-sFTPsite {
    param(
        [CmdletBinding()]
        [Parameter(Mandatory=$true,
        ValueFromPipelineByPropertyName=$true,
        HelpMessage="The location of the file that is to be uploaded.")]
        $FileLocation,
        [Parameter(Mandatory=$true,
        ValueFromPipelineByPropertyName=$true,
        HelpMessage="The name ofthe server")]
        $sFTPserverName,
        [Parameter(Mandatory=$true,
        ValueFromPipelineByPropertyName=$true,
        HelpMessage="The name ofthe server")]
        $sFTPRemotePath
    )

## Transcript for record keeping
    $Date = Get-date -Format dd-MM-yyyy-HH-mm
    Start-transcript -Path E:\ScriptOutPut\PCG-ReHire\$env:USERNAME-$Date.txt


    $Session = New-SFTPSession -ComputerName $sFTPserverName
    
    $SftpInfo = @{
        SessionId = $Session.SessionId
        LocalFile = $FileLocation
        RemotePath = $sFTPRemotePath
    }

    Set-SFTPFile @SftpInfo

    Remove-SFTPSession -SessionId $Session.SessionId
    Stop-Transcript
    
}
SendTo-sFTPsite








