Import-Module .\PSSomethingModule.psm1 -Force

Describe "Get-Something" {
    Context "when parameter ThingToGet is not used" {
        It "should return 'You skipped the Parameter!'" {
            Get-Something | Should -Be 'You skipped the Parameter!'
        }
        It "should be a string" {
            Get-Something | Should -BeOfType System.String
        }
    }

    Context "when parameter ThingToGet is used" {
        It "should return 'I got ' follow by a string" {
            Get-Something -ThingToGet $thing | Should -Be "I got $thing!"
        }

        It "should be a string" {
            Get-Something | Should -BeOfType System.String
        }
    }
}