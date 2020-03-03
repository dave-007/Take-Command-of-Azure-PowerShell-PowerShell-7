<#
Investigating ARM deployments with PowerShell
#>

#Two modules to look at
Get-Command -Module AZ.Resources -Name *Deploy*
Get-Command -Module AZ.Az.DeploymentManager -Name *Deploy*


Get-Help New-AZDeployment -Examples


#Storage Account
$myTemplateURI = 'https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-storage-account-create/azuredeploy.json'
# $myTemplateObject = Convert
# #refer to parameters.json file https://github.com/Azure/azure-quickstart-templates/blob/master/101-sql-logical-server/azuredeploy.parameters.json
# $myParams = @{
#     serverName        = 'davesql001'
#     administratorLogin    = 'dc_admin'
#     administratorLoginPassword = (Read-Host -Prompt 'SQL Password' -AsSecureString)
# }
New-AzResourceGroup -Name "$($myResourceGroupName)-test" -Location $myLocation

#Storage Account
New-AzResourceGroupDeployment -ResourceGroupName "$($myResourceGroupName)-test" -TemplateUri $myTemplateURI # -TemplateParameterObject $myParams 

#SQL Server
#New-AzResourceGroupDeployment -ResourceGroupName "$($myResourceGroupName)-test" -TemplateUri $myTemplateURI # -TemplateParameterObject $myParams 

Get-Command -Noun AzResourceGroup

Remove-AzResourceGroupDeployment -Name azuredeploy -ResourceGroupName "$($myResourceGroupName)-test"