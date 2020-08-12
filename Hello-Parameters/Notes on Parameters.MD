# How Parameters in scripts work, in my mind

- Functions need to load before they can be used. This needs to be understood.
- In this process I have learned there are options like setting the position of a parameter or the type. I am keeping it more basic as to hopfullly shead light on who they interact in the script or function.

<p>
When you add the parameters before the function block then you can call parameters with the script because the system will match the parameter while it loads the function. Then when running the function, it says oh, wait, I have this $Parameter over here

<pre><code>
   param(
    [Parameter(Mandatory)]
##  Stating we have a mandatory parameter
    [string]$Cats,
##  [type]$VeriableName,
    [Parameter()]
##  Stating the parameter is optional
    [string]$Parameter2    ## Don't need the ',' comma after the last parameter
)

function Hello-Parameters
{
    Write-Host "Parameter 1 value is $Cats"

     Write-Host "Parameter 2 value is $Parameter2"
}Hello-Parameters

</code></pre>

- This above script works both when assigning -Parameter(s) $Value when calling the script

<pre><code>
Hello-Parameters> .\Hello-Parameters.ps1 -cats Fabulous
Parameter 1 value is Fabulous
Parameter 2 value is
Hello-Parameters>

</code></pre>

#### Or

<p>By filling in the answers when the script calls for the information. A bit more inter active.

<pre><code>
C:\> .\Hello-Parameters.ps1

cmdlet Hello-Parameters at command pipeline position 1
Supply values for the following parameters:
Cats: are lovely
Parameter 1 value is are lovely
Parameter 2 value is
Hello-Parameters>

</code></pre>

<p>When you add the parameter with-in the function the script/shell needs to load the function and cannot read the parameters with-in it. Thus you cannot load a function and call a parameter at the same time.

- Here you are loading and calling the function in the same step.

<pre><code>
function Hello-Parameters
{
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

</code></pre>

<p> However, when it comes to module's then you can put the parameters inside the function. Because with modules you either Import-Module for the session or script that needs it.

<pre><code>C:\>Import-Module -Name .\Hello-Parameters.ps1 -Force
</code></pre>

The other typical use is to add them to the module's folder for your version of PowerShell. This way all users on that computer can use the function. In these cases the function is loaded when you start your PowerShell session. So the system knows that it has a function that goes by this-name and needs/options are -Parameter(s) $Value

Another nice part to adding the parameters to your script is how they make it easier to use as you can see the options and, with more advanced techniques, accept values from the pipe '|'. (I'm looking into this next.)

- Below is showing that when used as a module in function parameters also show up when you  - + Ctrl + Spacebar

<pre><code>
C:\> Hello-Parameters -Cats
Cats                 Debug                InformationAction    InformationVariable  PipelineVariable
Parameter2           ErrorAction          ErrorVariable        OutVariable
Verbose              WarningAction        WarningVariable      OutBuffer
</code></pre>