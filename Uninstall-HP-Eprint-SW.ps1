$path = Get-ChildItem -Path "C:\ProgramData\Package Cache\" -Recurse -Filter "HPEPrintAppSetup.exe"

if($path -ne $null){
    Start-Process $path.FullName -ArgumentList "/uninstall /quiet"
    Write-Host HP e-Print removed
} else {
    Write-Host Software not found on ([System.Net.DNS]::GetHostByName('').HostName)
}

