Automatisches Löschen alter Medien-Dateien

Beschreibung

Dieses PowerShell-Skript löscht automatisch JPG- und MP4-Dateien, die älter als 14 Tage sind, auf einem angegebenen Laufwerk (z.B. Netzlaufwerk oder NAS). Es protokolliert die Aktionen in einer Logdatei.

Voraussetzungen

Windows-Betriebssystem

PowerShell aktiviert

Zugriffsrechte auf das Laufwerk und die zu löschenden Dateien

Konfiguration

Bearbeite folgende Variablen im Skript (delete_old_media.ps1) nach Bedarf:

$Laufwerk: Laufwerk bzw. Ordner, in dem Dateien gelöscht werden sollen.

$DateiErweiterungen: Dateitypen, die gelöscht werden sollen (Standard: JPG und MP4).

$TageAlt: Anzahl der Tage, nach denen Dateien als "alt" gelten.

$Logfile: Pfad zur Logdatei (wird automatisch angelegt, wenn nicht vorhanden).

Ausführung

Manuell

Rechtsklick auf delete_old_media.ps1 und wähle „Mit PowerShell ausführen“.

Automatisch

Nutze die Windows Aufgabenplanung, um das Skript regelmäßig auszuführen (empfohlen täglich).

Beispielparameter für Aufgabenplanung:

Programm: powershell.exe

Argumente: -ExecutionPolicy Bypass -File "C:\Pfad\zum\delete_old_media.ps1"

Logdatei

Prüfe regelmäßig die Logdatei, um gelöschte Dateien und etwaige Fehler einzusehen.

Standardpfad: C:\Logs\delete_old_media.log

Hinweise

Stelle sicher, dass das Skript nicht versehentlich wichtige Dateien löscht.

Führe Testläufe durch, bevor du das Skript produktiv nutzt.

