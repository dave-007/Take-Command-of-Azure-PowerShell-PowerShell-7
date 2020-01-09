# INSTALLING POWERSHELL 7

# Option 1: (RECOMMENDED) Install with PSReleaseTools
Find-Module PSReleaseTools 
Install-Module PSReleaseTools #as Admin or with -Scope CurrentUser
Install-PSPreview -Mode Passive

# Option 2: Install manually from GitHub:
# https://github.com/PowerShell/PowerShell

# Look for PowerShell 7-Preview in Start Menu
# or run pwsh-preview