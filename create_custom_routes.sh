# create custom routes to manage traffic between Azure resources

# create route table
az network route-table create  \
    --route-table-name publictable \
    --resource-group RG \
    --name subnet1
    --address-prefix 10.0.1.0/24 \
    --next-hop-type vnet1 \
    --next-hop-ip-address 10.0.2.4

# create vnet1 and subnet1
az network vnet create \
    --name vnet1 \
    --resource-group RG \
    --address-prefixes 10.0.0.0/16 \
    --subnet-name subnet1 \
    --subnet-prefixes 10.0.0.0/24

# associate the route table with the public subnet
az network vnet subnet update \
    --name publicsubnet \
    --vnet-name vnet \
    --resource-group RG \
    --route-table publictable

