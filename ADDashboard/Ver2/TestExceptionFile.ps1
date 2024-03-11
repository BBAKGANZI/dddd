$drivers = Get-WmiObject win32_LogicalDisk -F DriveType=3 | Select -Property DeviceID
$files = New-Object System.Collections.ArrayList
$HostName = [Environment]::MachineName
$DnsName = Get-DnsClientGlobalSetting
$DnsName = $DnsName.SuffixSearchList
$HostName = $HostName + '.' +$DnsName
$SyncCode = Get-Date -Format "yyyyMMddHHmmss"

# foreach ($driver in $drivers)
# {
#    $deviceId = $driver.DeviceID
#    $searchDir  = "$deviceId\"
#    $searchFile = "*"
#    $searchDate = [datetime]::Parse([DateTime]::Now.AddDays(-1).ToString("yyyy-MM-dd"))
#    $files.AddRange([fileSearch]::GetFiles($searchDir, $searchFile, $searchDate))      
# }


