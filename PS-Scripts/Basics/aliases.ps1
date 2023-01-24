Get-Alias

# Add your own!
# This sample adds and alias for the Get-Help cmdlet.
New-Alias -Name gh -Value Get-Help

# Test it!
gh Get-Command

# This should return the help doc for Get-Command