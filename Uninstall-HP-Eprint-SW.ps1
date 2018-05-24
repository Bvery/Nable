$path = $null
$path = Get-ChildItem -Path "C:\ProgramData\Package Cache\" -Recurse -Filter "HPEPrintAppSetup.exe" | Select-Object -First 1 | Select-Object -ExpandProperty FullName
if($path -ne $null){
    Write-Host "HPEPrintAppSetup.exe found in" $path
    Start-Process $path -ArgumentList "/quiet /uninstall"
    Start-Sleep -Seconds 10
    if(Test-Path $path) {
        Write-Host "HP e-Print uninstall failed"
        exit 1
    } else {
        Write-Host "HP e-Print removed sucessvol"
    }
} else {
    Write-Host Software not found on ([System.Net.DNS]::GetHostByName('').HostName)
}
