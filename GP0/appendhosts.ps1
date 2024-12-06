### Filter requests using HOSTS file

$Hosts_File_Location = "$env:SystemDrive" + "\Windows\System32\drivers\etc\hosts"

$AlreadyFinished = Select-String -Path $Hosts_File_Location -Pattern "###HostsPresent"

if ($AlreadyFinished -ne $null) {
    Write-Host "Hosts already appended"
    exit(0)
} else {
    Write-Host "Appending hosts now"
    Add-Content -Path $Hosts_File_Location -Value "###HostsPresent"
}

$BlockedDomains = @(
    "0.0.0.0    microsoft.com"
    "0.0.0.0    windowsupdate.microsoft.com",
    "0.0.0.0    update.microsoft.com",
    "0.0.0.0    windowsupdate.com",
    "0.0.0.0    download.windowsupdate.com",
    "0.0.0.0    download.microsoft.com",
    "0.0.0.0    wustat.windows.com",
    "0.0.0.0    netservicepack.microsoft.com",
    "0.0.0.0    stats.microsoft.com",
    "0.0.0.0    bing.com"
)

foreach ($BlockedDomain in $BlockedDomains) {
  Write-Host "`t`t`t$BlockedDomain"
  Add-Content -Path $Hosts_File_Location -Value $BlockedDomain
}
