$diskList = Get-WmiObject Win32_LogicalDisk
$k = "";
Foreach($Disk in $diskList){
                $DiskSpace += [math]::truncate($Disk.Size/1gb)
                $DiskFreeSpace += [math]::truncate($Disk.FreeSpace/1gb)

                $k += $Disk.DeviceID + [math]::truncate($Disk.FreeSpace/1gb) + "/" + [math]::truncate($Disk.Size/1gb) + ","
            }
$k = $k.Substring(0, $k.Length-1)
$k
