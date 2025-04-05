# PowerShell Script zum Löschen alter JPG- und MP4-Dateien

# Konfiguration
$Laufwerk = 'A:\2024'
$DateiErweiterungen = @('*.jpg', '*.mp4')
$TageAlt = 14
$Logfile = 'C:\Logs\delete_old_media.log'

# Stelle sicher, dass der Log-Ordner existiert
if (!(Test-Path (Split-Path $Logfile))) {
    New-Item -Path (Split-Path $Logfile) -ItemType Directory | Out-Null
}

# Logging
Add-Content $Logfile "`n-----------------------------"
Add-Content $Logfile "Löschvorgang gestartet: $(Get-Date)"

# Dateien finden und löschen
foreach ($ext in $DateiErweiterungen) {
    Get-ChildItem -Path $Laufwerk -Filter $ext -Recurse | 
    Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$TageAlt) } | 
    ForEach-Object {
        Add-Content $Logfile "Lösche: $($_.FullName)"
        Remove-Item $_.FullName -Force
    }
}

Add-Content $Logfile "Löschvorgang abgeschlossen: $(Get-Date)"
