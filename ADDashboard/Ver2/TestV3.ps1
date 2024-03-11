$HostName = [Environment]::MachineName
$DnsName = Get-DnsClientGlobalSetting
$DnsName = $DnsName.SuffixSearchList
$HostName = $HostName + '.' +$DnsName
$SyncCode = Get-Date -Format "yyyyMMddHHmmss"

function CheckDefender(){
    $defenders = @('V3Svc', 'windefend', 'SepMasterService,sepWscSvc')
    foreach ($defender in $defenders)
    {
        $result = Get-Service | Where-Object ServiceName -eq $defender | Select-Object @{N='HostName'; E={$HostName}}, Status, Name, DisplayName, @{N='SyncCode'; E={$SyncCode}}
        if($result.Status -eq "Running")
        {
            $result
        }
    }
}
CheckDefender
