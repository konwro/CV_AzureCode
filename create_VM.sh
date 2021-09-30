# create Ubuntu VM with SSH keys

az vm create \
    --resourcegroup <RG>\
    --location westus\
    --name TestVM\
    --image UbuntuLTS\
    --admin-username <user>\
    --generate-ssh-keys \
    --verbose
    --no-wait

