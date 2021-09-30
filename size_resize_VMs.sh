# resize VM
az vm list-sizes --location westeurope --output table

# specify size at creation
az vm create \
    --resource-group myRG \
    --name SampleVM2 \
    --image UbuntuLTS \
    --admin-username azureuser \
    --generate-ssh-keys \
    --verbose \
    --size "Standard_DS2_v2"

# resize existing VM
az vm list-vm-resize-options \
    --resource-group myRG \
    --name SampleVM \
    --output table

az vm resize \
    --resource-group myRG \
    --name SampleVM \
    --size Standard_D2s_v3
    