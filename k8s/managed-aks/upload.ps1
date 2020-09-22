New-AzResourceGroup -Name storageGroup -Location eastus
$storageAccount = New-AzStorageAccount -ResourceGroupName maks `
  -Name "managedapp" `
  -Location eastus `
  -SkuName Standard_LRS `
  -Kind Storage

$ctx = $storageAccount.Context

New-AzStorageContainer -Name appcontainer -Context $ctx -Permission blob

Set-AzStorageBlobContent -File "app.zip" `
  -Container appcontainer `
  -Blob "app.zip" `
  -Context $ctx