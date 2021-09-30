# configure VNEt peering to connect virtual networks in the same region and
# across regions (also known as Global VNet Peering) through the Azure backbone network

# create peering connection
az network vnet peering create \
    --name vnet1-to-vnet2 \
    --remote-vnet vnet2 \
    --resource-group RG \
    --vnet-name vnet1 \
    --allow-vnet-access

# create reciprocical connection from vnet2 to vnet1
az network vnet peering create \
    --name vnet2-to-vnet1 \
    --remote-vnet vnet1 \
    --resource-group RG \
    --vnet-name vnet2 \
    --allow-vnet-access

# check connection
az network vnet peering list \
    --reosurce-group RG \
    --vnet-name vnet1 \
    --output table

# check effective routes
az network nic show-effective-route-table \
    --reosurce-group RG \
    --name vnet1 \
    --output-table



