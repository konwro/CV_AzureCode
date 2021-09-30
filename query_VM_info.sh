# query basic info about operated VM
az vm list
az vm list-ip-addresses -n SampleVM -o table
az vm show --resource-group myRG --name SampleVM

# query with JSON outpur with JMES
az vm show \
    --resource-group  myRG
    --name SampleVM \
    --query "osProfile.adminUsername"

az vm show \
    --resource-group myRG \
    --name SampleVM \
    --query hardwareProfile.vmSize

az vm show \
    --resource-group myRG \
    --name SampleVM \
    --query "networkProfile.networkInterfaces[].id"

az vm show \
    --resource-group myRG \
    --name SampleVM \
    --query "networkProfile.networkInterfaces[].id" --output tsv
