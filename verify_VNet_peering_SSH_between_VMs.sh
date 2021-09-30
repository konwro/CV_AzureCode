# SSH between VMs to verify VNet peering

# list IP address to connect to
az vm list \
    --resource-group myRG \
    --query "[*].{Name:name, PrivateIP:privateIps, PublicIP:publicIps}" \
    --show-details \
    --output table

# test connection
ssh -o StrictHostKeyChecking=no azureuser@<SalesVM public IP>

