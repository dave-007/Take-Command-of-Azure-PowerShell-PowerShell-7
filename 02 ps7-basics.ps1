# POWERSHELL BASICS in ~5 minutes
# Valid for PowerShell 7 / PowerShell Core and previous versions as well

# Start with the three most helpful commands


# GET-HELP
Get-Help
Get-Help Get-Command # For each command
Get-Help Get-Command -Online # link to online docs where available
Get-Help about_* # For general PowerShell topics
Get-Help about_PowerShell_Editions

# GET-COMMAND
Get-Command # See all
Get-Command *Network* # Search with wildcard

# Search by Verb or Noun
Get-Command -Verb Restart
Get-Command -Noun Process

# GET-MEMBER, for examining objects
$myVariable = 'Testing 1 2 3'

$myVariable | Get-Member
# This is a .Net Core type, see
# https://docs.microsoft.com/en-us/dotnet/api/system.string?view=netcore-3.1

$myHashtable = @{
    Name = 'David'
    Flavor = 'Coffee'
    Amount = 9000
}
$myHashtable.Name

$myHashtable | Get-Member

# See https://docs.microsoft.com/en-us/dotnet/api/system.collections.hashtable?view=netcore-3.1

# Questions: 
# What would the command be to get all the variables?

# Learn more:
# Microsoft Learn site
# https://docs.microsoft.com/en-us/powershell/scripting/learn/understanding-important-powershell-concepts?view=powershell-7
# Watch these guys
# https://channel9.msdn.com/Series/Getting-Started-with-Microsoft-PowerShell
