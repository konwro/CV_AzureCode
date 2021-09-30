#create_and_connect_to_Azure_Files_share

# create storage account
az storage account create \
    --name <> \
    --resource-group <> \
    --sku <> \

# create a file share
az storage share create \
    --account name <> \
    --account-key <> \
    --name <>






