# INSTALLING POWERSHELL 7

# Many options listed here
# https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7

# Option I chose and recommend if you're using .Net Core

# Install as a .NET Global tool

# First install the .net Core SDK
# https://dotnet.microsoft.com/download

# Then use the dotnet command line 

dotnet tool install --global PowerShell

# See what is installed already

dotnet tool list -g

# See other dotnet tools available online 
# https://github.com/natemcmaster/dotnet-tools

