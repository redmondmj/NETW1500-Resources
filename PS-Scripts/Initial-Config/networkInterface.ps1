# Get the default network interface
$interface = Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | Select-Object -First 1

# Get the current IP address, subnet mask, default gateway, and DNS servers
$ipAddress = $interface.IPv4Address.IPAddress
$subnetMask = $interface.IPv4Address.PrefixLength
$defaultGateway = $interface.IPv4DefaultGateway.NextHop
$dnsServers = $interface.DNSServer.ServerAddresses

# Set the IP address, subnet mask, default gateway, and DNS servers statically
Set-NetIPInterface -InterfaceIndex $interface.InterfaceIndex -Dhcp 0
New-NetIPAddress -InterfaceIndex $interface.InterfaceIndex -IPAddress $ipAddress -PrefixLength $subnetMask
Set-DnsClientServerAddress -InterfaceIndex $interface.InterfaceIndex -ServerAddresses $dnsServers
New-NetRoute -DestinationPrefix 0.0.0.0/0 -NextHop $defaultGateway -InterfaceIndex $interface.InterfaceIndex


# Confirm the changes
$newInterface = Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null} | Select-Object -First 1
Write-Host "IP address: $($newInterface.IPv4Address.IPAddress)"
Write-Host "Subnet mask: $($newInterface.IPv4Address.PrefixLength)"
Write-Host "Default gateway: $($newInterface.IPv4DefaultGateway.NextH