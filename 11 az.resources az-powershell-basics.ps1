# Az.Resources
# 
Exit #Prevent F5
# See commands, their nouns and verbs to get a high level sense of what we can do with this module
Get-Command -Module Az.Resources # | Out-GridView  # For windows users
# See verbs
Get-Command -Module Az.Resources | Group-Object -Property Verb
# See nouns
Get-Command -Module Az.Resources | Group-Object -Property Noun


Get-AzResource

Get-AzResourceGroup


# Create a resource group
#Instead of defining this here, I'll define it in _settings.ps1 and 'dot source' it
#This is like an include file, so I can use it in other scripts
#$myResourceGroupName = 'dpsug-demo'
# Put your settings into this _my-settings.ps1 file to use these scripts
. ./_my-settings.ps1
$myResourceGroupName
Get-Help New-AzResourceGroup -Examples
#Add the -Debug switch to see the underlying details including the API call
New-AzResourceGroup -ResourceGroupName $myResourceGroupName -Location $myLocation -Debug
Show-Command New-AzResourceGroup

# Can I set this as default resource group?
Get-Help Set-AzDefault -ShowWindow


Set-AzDefault -ResourceGroupName $myResourceGroupName 

Get-AzDefault | Select-Object *

