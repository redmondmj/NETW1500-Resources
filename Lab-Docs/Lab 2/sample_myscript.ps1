#This script

$ans=Read-Host "What process would you like to?"

Get-WmiObject win32_process -Filter "name='$ans'" | Format-Table HandleCount,Virtualsize,UserModeTime.KernelModeTime,ProcessID,Name