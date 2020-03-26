# Az.Compute
# 
Exit #Prevent F5
# Put your settings into this _my-settings.ps1 file to use these scripts
. ./_my-settings.ps1
# See commands, their nouns and verbs to get a high level sense of what we can do with this module
Get-Command -Module Az.Compute
# See verbs
Get-Command -Module Az.Compute | Group-Object -Property Verb
# See nouns
Get-Command -Module Az.Compute | Group-Object -Property Noun


# List VMs
Get-AZVM
Get-AZVM | Select-Object *

# Create a VM
# Refer https://docs.microsoft.com/en-us/powershell/azure/azureps-vm-tutorial
# Make a credential with a user and password you'll remember
Get-Help Get-Credential -Examples
#$cred = Get-Credential -User dcadmin 
# OR use KeyVault secret to build a credential

#Retrieve sysadmin password from KeyVault, keep as a secure string
$AdminPasswordSecret = Get-AzKeyVaultSecret `
-vaultName $myVaultName `
-name "AdminPassword"

# Build creds for local sysadmin
$UserName =  'dcadmin'
$cred = New-Object System.Management.Automation.PSCredential ($UserName, $AdminPasswordSecret.SecretValue)

$AdminPasswordSecret | Get-Member
$AdminPasswordSecret.SecretValueText
$cred

$myResourceGroupName

# use splatting to set all params at once
# see https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting
$vmParams = @{
    ResourceGroupName   = $myResourceGroupName
    Name                = "$myResourceGroupName-VM1"
    Location            = $myRG.Location
    ImageName           = "Win2016Datacenter"
    PublicIpAddressName = "$myResourceGroupName-PublicIp1"
    Credential          = $cred
    OpenPorts           = 3389
}

# Create the VM 
$newVM1 = New-AzVM @vmParams 

$newVM1

#Connect to that VM!
mstsc /v $newVM1.FullyQualifiedDomainName

# testing
# mstsc /v passtest-rg-vm1-63211f.eastus2.cloudapp.azure.com
#Stop to save $$$
$newVM2 | Stop-AzVM -Force
# or
Stop-AzVM -Name dpsugVM1 -ResourceGroupName $myResourceGroupName
# or stop all
Get-AzVM -ResourceGroupName $myResourceGroupName | 
  Stop-AzVM -Force

Get-AzVM -Status

#Start it later?
# or
Start-AzVM -Name dpsugVM1 -ResourceGroupName $myResourceGroupName
Get-AzVM -Status