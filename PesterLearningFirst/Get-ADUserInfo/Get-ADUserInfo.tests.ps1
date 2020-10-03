Import-Module .\Get-ADUserInfo.ps1 -Force

Describe 'Get-ADuserInfo' {
    Context "When parameter Name is used" {
        It "should return $Name" {
            .\Get-ADUserInfo  -Name $Name  | Should -Be "$Name"
        }
    }
}