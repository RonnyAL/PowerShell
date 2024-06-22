function Get-ExternalIP {
    return (Invoke-WebRequest ifconfig.me/ip).Content.Trim()
}

# (Optional) Enable alias "whatsmyip"
# Set-Alias -Name 'whatsmyip' -Value 'Get-ExternalIP'