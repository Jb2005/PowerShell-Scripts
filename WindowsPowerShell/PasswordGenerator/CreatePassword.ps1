

Function CreatePassword {
    
    $SetLoopCount = Get-Random -Minimum 4 -Maximum 6 # loop will run 4 to 6 times give passwords from 12 to 18 in langth
    
    For ($CountLoop = 0; $CountLoop -le $SetLoopCount; $CountLoop++ ) {
    $Number = Get-Random -Maximum 9
    $UpperCaseletter = (65..90) | Get-Random -Count 1 | ForEach-Object {[char]$_}
    $LowerCaseLetter = (97..122) | Get-Random -Count 1 | ForEach-Object {[char]$_}
    $PassCharMix = -join $number + $UpperCaseletter + $LowerCaseLetter

    $Global:Password = $PassCharMix

    <#
        Need to figure out how to appened the $PassCharMix to an arrey or new variable.
    
    #>
     
    Write-Host "Password Char mix: $PassCharMix" -ForegroundColor Blue
    Write-Host "loop count: $CountLoop" -ForegroundColor Green
    }
    #$Global:Password = -join $UpperCaseletter + $LowerCaseLetter + $Number
    #$Global:Passwordn = $Password -replace '[^\p{L}\p{Nd}/!/@/#/$/%/^/&/*/(/)/_/-/+/=/{/}/</>/./?/ ]', '9'
}

# CreatePassword

Write-Host "The random pasword is: $Password" -ForegroundColor Magenta

