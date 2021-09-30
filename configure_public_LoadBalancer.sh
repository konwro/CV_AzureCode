#configure_public_LoadBalancer

# Deploy the patient portal web application

# clone the repo that contains the source for the app and runs the setup script from GitHub
git clone https://github.com/MicrosoftDocs/mslearn-improve-app-scalability-resiliency-with-load-balancer.git
cd mslearn-improve-app-scalability-resiliency-with-load-balancer

# create VMs
bash create-high-availability-vm-with-sets.sh <resource group name>

# Create Load Balancer

# create new public IP address
az network public-ip create \
  --resource-group <resource group name> \
  --allocation-method Static \
  --name myPublicIP

  # create load balancer
  az network lb create \
  --resource-group <resource group name> \
  --name myLoadBalancer \
  --public-ip-address myPublicIP \
  --frontend-ip-name myFrontEndPool \
  --backend-pool-name myBackEndPool

# create a health probe
az network lb probe create \
  --resource-group <resource group name> \
  --lb-name myLoadBalancer \
  --name myHealthProbe \
  --protocol tcp \
  --port 80  

# define rule to define traffic distribution
az network lb rule create \
  --resource-group <resource group name> \
  --lb-name myLoadBalancer \
  --name myHTTPRule \
  --protocol tcp \
  --frontend-port 80 \
  --backend-port 80 \
  --frontend-ip-name myFrontEndPool \
  --backend-pool-name myBackEndPool \
  --probe-name myHealthProbe

  # connect VMs to back-end pool
az network nic ip-config update \
  --resource-group <resource group name> \
  --nic-name webNic1 \
  --name ipconfig1 \
  --lb-name myLoadBalancer \
  --lb-address-pools myBackEndPool

az network nic ip-config update \
  --resource-group <resource group name> \
  --nic-name webNic2 \
  --name ipconfig1 \
  --lb-name myLoadBalancer \
  --lb-address-pools myBackEndPool

# get public IP address of LB and URL for the website
echo http://$(az network public-ip show \
                --resource-group <resource group name> \
                --name myPublicIP \
                --query ipAddress \
                --output tsv)