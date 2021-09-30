# configure_ip_based_firewall_rules
Add-AzStorageAccountNetworkRule `
    -ResourceGroupName "myRG" `
    -AcountName "mySA" `
    -IPAdressOrRange "IP.IP.IP.IP"

# require secure transfer for all connections
Set-AzStorageAccount `
    -Name "SA" `
    -ResourceGroupName "myRG" `
    -EnableHttpsTrafficOnly $true
    