# CLEANUP
# Put your settings into this _my-settings.ps1 file to use these scripts
. ./_my-settings.ps1
Write-Output "All resources for this demo were created in resource group  $myResourceGroupName"

# DON'T RUN UNTIL YOU ARE DONE!
Remove-AzResourceGroup -Name $myResourceGroupName