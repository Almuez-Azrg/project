$env:Path = "C:\flutter\bin;C:\flutter\bin\mingit\cmd;" + $env:Path
$env:PUB_HOSTED_URL = "https://pub.flutter-io.cn"
$env:FLUTTER_STORAGE_BASE_URL = "https://storage.flutter-io.cn"

Set-Location "C:\Users\اليفق\Documents\sado_solutions"

Start-Process -FilePath "cmd.exe" -ArgumentList "/c", "flutter run -d edge --web-port=8080" -WindowStyle Minimized -WorkingDirectory "C:\Users\اليفق\Documents\sado_solutions"

$maxWait = 90
$waited = 0
while ($waited -lt $maxWait) {
    Start-Sleep -Seconds 3
    $waited += 3
    $listening = netstat -an | Select-String ":8080.*LISTEN"
    if ($listening) {
        Start-Process "http://localhost:8080"
        [System.Windows.MessageBox]::Show("تم تشغيل التطبيق بنجاح!`n`nافتح المتصفح على: http://localhost:8080`n`nلايقاف التطبيق: اغلق نافذة cmd في الخلفية", "Sado Solutions", "OK", "Information")
        exit
    }
}
[System.Windows.MessageBox]::Show("انتهت المهلة. تحقق من نافذة cmd المفتوحة.", "Sado Solutions", "OK", "Warning")
