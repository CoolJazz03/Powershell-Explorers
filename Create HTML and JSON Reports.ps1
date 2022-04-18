#Put service list into an HTML file
get-service | where Status -eq Running | ConvertTo-Html | out-file "C:\Reports\Services Running\getservicerunning1.html"

#Put service details list into a JSON file
get-wmiobject win32_service | select Name,Status,StartMode,PathName | ConvertTo-Json | out-file "C:\Reports\Service Details\getservicedetails1.json"

#Show files that are 30 days old or newer
Get-ChildItem –Path "C:\Reports\" -Recurse | Where-Object {($_.LastWriteTime -gt (Get-Date).AddDays(-30))}