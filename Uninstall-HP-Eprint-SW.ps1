
function HPEPrintAppSetupInstalled {
    HPEPrintAppSetupInstalled = $null
    return Get-ChildItem -Path "C:\ProgramData\Package Cache\" -Recurse -Filter "HPEPrintAppSetup.exe" | Select-Object -First 1 | Select-Object -ExpandProperty FullName
}
function UninstallHPEPrintAppSetupInstalled {
    HPEPrintAppSetupInstalled "/uninstall /quiet"
} 

$path = HPEPrintAppSetupInstalled
if($path -ne $null){
    Write-Host "HPEPrintAppSetup.exe found in" $path
    UninstallHPEPrintAppSetupInstalled
    Start-Sleep -Seconds 5
    if(Test-Path $path) {
        Write-Host "HP e-Print failed"
        exit 1
    } else {
        Write-Host "HP e-Print removed sucessvol"
    }
} else {
    Write-Host Software not found on ([System.Net.DNS]::GetHostByName('').HostName)
}
