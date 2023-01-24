
# Download the Chrome installer
Invoke-WebRequest -Uri "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile "$env:TEMP\chrome.exe"

# Start the installer
Start-Process -FilePath "$env:TEMP\chrome.exe" -ArgumentList "/silent /install" -Wait

# Confirm that Chrome is installed
if (Test-Path 'C:\Program Files\Google\Chrome\Application\chrome.exe') {
    Write-Host 'Google Chrome is installed'
} else {
    Write-Host 'Google Chrome is not installed'
}