

function Encrypt-Credentails {
    [CmdletBinding()]
    param (        
        [Parameter(Mandatory=$true,
        ValueFromPipelineByPropertyName=$true,
        HelpMessage="Enter the path to save the generated CSV file.")]
        $FilePathForcsv
    )
    
    # for encription creds
$table = New-Object System.Data.DataTable "Credentials"
$col1 = New-Object System.Data.DataColumn Username
$col2 = New-Object System.Data.DataColumn Password
$table.Columns.Add($col1)
$table.Columns.Add($col2)



$credentials = Get-credential -Message "enter creds"
$credUser = $credentials.UserName
$credPass = $Credentials.Password | ConvertFrom-SecureString

$credpath = "$FilePathForcsv.csv"

$row = $table.NewRow()
$row.Username = $credUser
$row.Password = $credPass
$table.Rows.Add($row)

$table | Export-csv $credpath -NoTypeInformation
}

Encrypt-Credentails





# Add below to the file that needs the creds
<#
$Credcsv = import-csv -Path "<Path\to\file.csv>"
$Creds = New-Object System.Management.Automation.PSCredential ($Credcsv.Username,(ConvertTo-SecureString $Credcsv.Password))
#>