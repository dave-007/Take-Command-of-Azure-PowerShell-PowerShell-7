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

#Retreive sysadmin password from KeyVault, keep as a secure string
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
    Name                = "sfsdcVM3"
    Location            = $myRG.Location
    ImageName           = "Win2016Datacenter"
    PublicIpAddressName = "sfsdcPublicIp2"
    Credential          = $cred
    OpenPorts           = 3389
}

$newVM3 = New-AzVM @vmParams -Debug

$newVM2

#Connect to that VM!
mstsc /v $newVM3.FullyQualifiedDomainName

#Stop to save $$$
$newVM2 | Stop-AzVM -Force
# or
Stop-AzVM -Name sfsdcVM1 -ResourceGroupName $myResourceGroupName
# or stop all
Get-AzVM -ResourceGroupName $myResourceGroupName | 
  Stop-AzVM -Force

Get-AzVM -Status

#Start it later?
# or
Start-AzVM -Name sfsdcVM1 -ResourceGroupName $myResourceGroupName
Get-AzVM -Status