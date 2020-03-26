# INSTALLING POWERSHELL AZ MODULE

#Check your current PS Version
$PSVersionTable


# INSTALL the AZ PowerShell Module
# See cmdlets that work with Modules
Get-Command -Noun Module



# Have a look at the AZ module in PSGallery (https://www.powershellgallery.com/)
Find-Module *AZ*
#Find-Module *AZ.*
Find-Module AZ  #EXACTLY AZ

# Install AZ module
Install-Module AZ #as Admin or with -Scope CurrentUser

# To stay current, update the AZ module to the latest version
Update-Module AZ

# See installed modules
Get-Module -ListAvailable
# See imported (in session) modules
Get-Module

#Import the module 
Import-Module AZ

# Explore the commands in the AZ module. How many are there?
Get-Command -Module AZ.* | Measure-Object

# Look in each AZ module for commands
Get-Module Az.* # only shows those modules loaded into session
Get-Module Az.* -ListAvailable


# Get all commands for all AZ modules (long)
Get-Module AZ.* | ForEach-Object { Get-Command -Module $PSItem } 
# See the verbs
Get-Module AZ.* | 
  ForEach-Object { Get-Command -Module $PSItem } | 
    Group-Object -Property Verb
# See the nouns
Get-Module AZ.* | 
  ForEach-Object { Get-Command -Module $PSItem } | 
    Group-Object -Property Noun
