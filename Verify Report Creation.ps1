#Set parameters for file root and file age.
param (
    [string] $Exporthtmlpath = 'C:\Reports\Services Running\',
    [string] $Exportjsonpath = 'C:\Reports\Service Details\'
    )

#Check to see if a HTML file was created today, if not then show warning message.
$srfile = get-childitem $Exporthtmlpath | Where-Object {$_.lastwritetime.toshortdatestring() -eq (Get-Date).toshortdatestring()}
if ($srfile.count -gt 0) {
		Write-Host 'Services Running Report was created today' -Foregroundcolor Green
	}else {
		Write-Warning 'Services Running Report was not created today.'
    }

#Check to see if a JSON file was created today, if not then show warning message.
$sdfile = get-childitem $Exportjsonpath | Where-Object {$_.lastwritetime.toshortdatestring() -eq (Get-Date).toshortdatestring()}
if ($sdfile.count -gt 0) {
		Write-Host 'Service Details Report was created today' -Foregroundcolor Green
	}else {
		Write-Warning 'Service Details Report was not created today.'
    }






    