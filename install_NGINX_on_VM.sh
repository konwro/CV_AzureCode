# install NGINX web server on a VM

# locate IP address of the machine
az vm list-ip-addresses --name SampleVM --output table

#open SSH connection
ssh azureuser@<PublicIPAddress>

#install NGINX
sudo apt-get -y update && sudo apt-get -y install nginx

#exit SSH
exit

# retrieve default page
curl -m 10 <PublicIPAddress>

az vm open-port \
    --port 80 \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc \
    --name SampleVM

curl -m 10 <PublicIPAddress>
