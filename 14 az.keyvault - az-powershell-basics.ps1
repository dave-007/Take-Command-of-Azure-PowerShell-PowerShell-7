# Az.KeyVault
# 
Exit #Prevent F5
# Put your settings into this _my-settings.ps1 file to use these scripts
. ./_my-settings.ps1
# See commands, their nouns and verbs to get a high level sense of what we can do with this module
Get-Command -Module Az.* -Noun *Vault
# See verbs
Get-Command -Module Az.KeyVault | Group-Object -Property Verb
# See nouns
Get-Command -Module Az.KeyVault | Group-Object -Property Noun


# Get a resource group object, note the properties of it from Get-Member
$myRG = Get-AzResourceGroup $myResourceGroupName

$myRG | Get-Member
# Can use the location property of our resource group to set the location of the KeyVault, less hard coding
$myRG.Location 

$myVaultName = "$myResourceGroupName-Vault99"
New-AzKeyVault -Name $myVaultName -ResourceGroupName $myResourceGroupName -Location $myRG.Location

# Store a secret in the vault we can use in VM creation
$myPassword = '5uP3r53r3+'
# Alternately, enter password at prompt
# $myPassword = Read-Host -Prompt "Enter Password to store in vault"
Write-Host "Your secret password is $myPassword"

$secretValue = ConvertTo-SecureString $myPassword -AsPlainText -Force
$secret = Set-AzKeyVaultSecret `
  -VaultName $myVaultName `
  -Name 'AdminPassword' `
  -SecretValue $secretValue

# If we need to get the secret value text, note the -Debug flag to look under the covers
(Get-AzKeyVaultSecret -vaultName $myVaultName -name "AdminPassword" -Debug).SecretValueText