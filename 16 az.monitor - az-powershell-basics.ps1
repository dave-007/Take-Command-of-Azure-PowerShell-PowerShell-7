# Az.Monitor
# 
Exit #Prevent F5
# Put your settings into this _my-settings.ps1 file to use these scripts
. ./_my-settings.ps1
# See commands, their nouns and verbs to get a high level sense of what we can do with this module
Get-Command -Module Az.Monitor
# See verbs
Get-Command -Module Az.Monitor | Group-Object -Property Verb
# See nouns
Get-Command -Module Az.Monitor | Group-Object -Property Noun

Get-Help Get-AzLog -Examples

Get-AzLog -MaxRecord 100

Get-AzLog -ResourceGroupName $myResourceGroupName