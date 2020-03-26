# Az.Accounts
# 
Exit #Prevent F5
# Start with AZ.Accounts, so we can connect to our account
# See commands, their nouns and verbs to get a high level sense of what we can do with this module
Get-Command -Module Az.Accounts
# See verbs
Get-Command -Module Az.Accounts | Group-Object -Property Verb
# See nouns
Get-Command -Module Az.Accounts | Group-Object -Property Noun
       

# What cmdlets work against AzAccount?
Get-Command -Module Az.Accounts -Noun AzAccount


#Login-AzAccount looks helpful
Get-Help Login-AzAccount -Examples
# For windows users, try -ShowWindow
Get-Help Login-AzAccount -ShowWindow


#Login-AzAccount is an alias for 'Connect-AzAccount'
Get-Alias -Definition Connect-AzAccount

#Login interactively
Connect-AzAccount
<#returns
WARNING: To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code xxxxxxx to authenticate.

Account            SubscriptionName TenantId                             Environment
-------            ---------------- --------                             -----------
my@email.com                  guid-here                            AzureCloud
#>

#Alternately. login with credential
Get-Help Get-Credential -Examples
$cred = Get-Credential 
Connect-AzAccount -Credential $cred #not yet supported in PSCore/PS7

# First, I like to look at the Get-* cmdlets for a given module to see what I can see
Get-Command -Module Az.Accounts -Verb Get
     
# See what some use Az.Account cmdlets return
Get-AzContext  # See if we're connected to any accounts already               
Get-AzContextAutosaveSetting  # Where are context files stored
Get-AzDefault  # See user defaults               
Get-AzEnvironment # See the different Azure clouds            
Get-AzProfile # Service profiles?                 
Get-AzSubscription # See subscription           
Get-AzTenant # See tenant


# Can logout when done
# Logout-AzAccount
