# Rename Host 
# This script will prompt for a new host name, apply it, output the name and restart
$hostname = Read-Host -Prompt "Enter the new hostname:"
$computer = $env:COMPUTERNAME

Rename-Computer -NewName $hostname -Restart

Write-Host "The hostname for $computer has been changed to $hostname"