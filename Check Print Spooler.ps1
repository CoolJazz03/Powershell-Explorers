#Set parameters for spooler path and file age.
param (
    [string] $Spoolerpath = 'C:\Windows\System32\spool\PRINTERS\',
    [int] $Fileage = 6)

    #Check print spooler files, restart print spooler if file is older than 6 hours.
$psfile = get-childitem $Spoolerpath | Where-Object {$_.lastwritetime -lt $Fileage * -1}
if ($psfile.count -gt 0) {
        Restart-Service -Name Spooler -Force
    }else {
        Write-Host 'Print spooler file is less than 6 hours old' -Foregroundcolor Blue}