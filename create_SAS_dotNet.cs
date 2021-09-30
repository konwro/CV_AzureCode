// Create a Shared Access Signature (SAS) to delegate access to a resource in just one of the storage services: 
// the Blob, Queue, Table, or File service

    // create blop container to cennect to the sotrage account on Azure
BlopContainerClient container = new BlobContainerClient("ConnectionString", "Container");
 
    // retrieve the blob and create BlobClient
foreach (BlobItem in container.GetBlobs())
{
    BlobClient blob = container.GetBlobClient(blobItem.Name);
}

    // create BlobSasBuilder object
BlobSasBuilder sas = new BlobSasBuilder
{
    Blob containerName = blob.BlobContainerName,
    BlobName = blob.Name,
    Resource = "b",
    ExpiresOn = DateTimeOffset.UtcNow.AddMinutes(1)
};
        // allow read access
sas.SetParamissions(BlobSasPermissions.Read);

    // authenticate a call to the ToSasQueryParameters method
StorageSharedKeyCredential storageSharedKeyCredential = new StorageSharedKeyCredential("AccountName", "AccountKey");
sasToken = sas.ToSasQueryParameters(storageSharedKeyCredential).ToString();



// MS examples
https://github.com/Azure/azure-sdk-for-net/tree/7b41d66f3c611eb2113e2ec11cb56e7edf542628/sdk/storage/Azure.Storage.Blobs/samples
