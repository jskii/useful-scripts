try {
    # Download installer and install
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $dockerExeInstallerUri = 'https://download.docker.com/win/edge/Docker%20for%20Windows%20Installer.exe';
    $LocalTempDir = $env:TEMP;
    $DockerInstaller = "InstallDocker.exe";
    (new-object System.Net.WebClient).DownloadFile($dockerExeInstallerUri, "$LocalTempDir\$DockerInstaller");
    #No wait, just a sleep
    Start-Process "$($LocalTempDir)\$($DockerInstaller)" -Wait

    # Add current user to group (after checking)
    #$currentUser = whoami;$userCheck = (Get-LocalGroupMember docker-users).Name | Where-Object { $_ -eq $currentUser };if ($userCheck.Count -lt 1) { Add-LocalGroupMember -Group docker-users -Member $currentUser; } else { Write-Host "User already exists in docker group, skipping"}
     
    # Restart
    #Read-Host "Finished; hit Enter to finish and reboot"
    #shutdown /r /t 0
}
catch {
    Write-Host $_.Exception
}