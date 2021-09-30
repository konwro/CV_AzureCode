# Use metric alerts to alert on performance issues in your Azure environment

# create VM
cat <<EOF > cloud-init.txt
#cloud-config
package_upgrade: true
packages:
- stress
runcmd:
- sudo stress --cpu 1
EOF

az vm create \
    --resource-group myRG \
    --name vm1 \
    --location eastUS \
    --image UbuntuLTS \
    --custom-data cloud-init.txt \
    --generate-ssh-keys

# create metric alert

# obtain resource ID of created VM
VMID=$(az vm show \
        --resource-group myRG \
        --name vm1 \
        --query id \
        --output tsv)

# create new metric alert that will be triggered when the VM CPU is greater than 80%
az monitor metrics alert create \
    -n "Cpu80PercentAlert" \
    --resource-group myRG \
    --scopes $VMID \
    --condition "max percentage CPU > 80" \
    --description "Virtual machine is running at or greater than 80% CPU utilization" \
    --evaluation-frequency 1m \
    --window-size 1m \
    --severity 3


