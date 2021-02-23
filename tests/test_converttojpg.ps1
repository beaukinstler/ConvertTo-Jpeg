$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
$ModuleDir = Split-path -parent $ScriptDir  # assume we're in one folder deep
$env:testing = $true
Import-Module TestingModule -Force
Import-Module $ModuleDir\ConvertTo-Jpeg.psm1 -Force




function Run-AllTests{
    Test-ConvertToJpeg

  

}

<# template
function test-functionname{
    $result
    assert () -test_name $MyInvocation.MyCommand -msg "" -result_object $result
}
#>
<# template #>

function Test-ConvertToJpeg{
    $pics = Get-ChildItem "$ScriptDir/fixtures" -Filter '*.bmp'
    $pics | ConvertTo-Jpeg 

}



if ($MyInvocation.CommandOrigin.ToString() -eq 'Runspace' -or $env:runtest -eq $true) {
	Run-AllTests
}

$env:testing = $false
