

function My-SecondFunction {
     function My-FirstFunction {
        Write-Host "My-FirstFunction << just ran" -ForegroundColor Magenta
    }# Here we are loading the function

    Write-Host "My-FirstFunction has loaded lets call it" -ForegroundColor Magenta

    My-FirstFunction   # Here we are calling the function

    Write-Host "let's call the function again"
    My-FirstFunction 

}My-SecondFunction