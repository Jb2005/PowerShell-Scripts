
Import-Module .\Search-csv.psm1

Describe " Search-csv test"{
    Context "When parameter $Data is not used" {
        It "should return 'Got nothing!'"
        Search-csv | Should -Be 'Got nothing!'
    }
    Context "When paramter $Data is not used"{
        It "should return $Data "{
            $Data = PassedOn
            Search-csv $Data | Should -be PassedOn
        }
    }
}