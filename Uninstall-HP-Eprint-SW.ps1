
function HPEPrintAppSetupInstalled {
    $path = Get-ChildItem -Path "C:\ProgramData\Package Cache\" -Recurse -Filter "HPEPrintAppSetup.exe"
    $path
}
function UninstallHPEPrintAppSetupInstalled {
    Start-Process $path.FullName -ArgumentList "/uninstall /quiet"
} 


$path = UninstallHPEPrintAppSetupInstalled

if($path -ne $null){
    Write-Host "HPEPrintAppSetup.exe found in" $path.
    UninstallHPEPrintAppSetupInstalled
    Start-Sleep -Seconds 5
    $path = UninstallHPEPrintAppSetupInstalled
    if($path -eq $null) {
        Write-Host "HP e-Print removed sucessvol"
    } else {
        Write-Host "HP e-Print failed sucessvol"
        exit 1
    }
} else {
    Write-Host Software not found on ([System.Net.DNS]::GetHostByName('').HostName)
}



