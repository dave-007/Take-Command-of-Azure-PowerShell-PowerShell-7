# Az.Storage
# Refer: https://docs.microsoft.com/en-us/azure/storage/common/storage-powershell-guide-full
# 
Exit #Prevent F5
# Put your settings into this _my-settings.ps1 file to use these scripts
. ./_my-settings.ps1
# See commands, their nouns and verbs to get a high level sense of what we can do with this module
Get-Command -Module Az.Storage
# See verbs
Get-Command -Module Az.Storage | Group-Object -Property Verb
# See nouns
Get-Command -Module Az.Storage | Group-Object -Property Noun
Get-Command -Module Az.Storage -Name *share*

#See existing storage accounts, note the cloud shell
Get-AzStorageAccount

#Create a new Storage account, what are out options

Get-Help New-AzStorageAccount -ShowWindow  # ShowWindow for windows users

# ` <-- Note these backticks '`' are a line continuation character
$storageAccount = New-AzStorageAccount -ResourceGroupName $myResourceGroupName `
    -Name $myStorageAccountName `
    -SkuName Standard_LRS `
    -Location $myLocation

$storageAccount | Get-Member 

$myContext = $storageAccount.Context

$myContainerName = 'images'
New-AzStorageContainer -Context $myContext -Name $myContainerName


# Get a file from the web to upload
$myImageUrl
$myImageFileName = $(Split-Path $myImageUrl -leaf)
$myImageFullTempPath = Join-Path -Path $env:TEMP -ChildPath $myImageFileName
Invoke-WebRequest -Uri $myImageUrl -OutFile $myImageFullTempPath

# Upload the file to storage
Set-AzStorageBlobContent -File $myImageFullTempPath `
    -Container $myContainerName `
    -Blob $myImageFileName `
    -Context $myContext

# Delete Storage Account
Remove-AzStorageAccount -ResourceGroupName $myResourceGroupName -Name $myStorageAccountName

