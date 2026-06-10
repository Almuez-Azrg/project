$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\Sado Solutions.url")
$Shortcut.TargetPath = "http://localhost:8080"
$Shortcut.Save()
