

.\CreatePassword

Describe 'CreatePassword'{
    it 'outputs 3 random charters'
        .\CreatePassword | Should -Be $Password
}