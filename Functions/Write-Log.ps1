function Write-Log {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Message,
 
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('DEBUG', 'INFO', 'WARN', 'ERROR')]
        [string] $Severity = 'INFO',
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $LogFilePath
    )
    
    $logDirectory = [System.IO.Path]::GetDirectoryName($LogFilePath)
    if (-not (Test-Path -Path $logDirectory)) {
        New-Item -Path $logDirectory -ItemType Directory -Force
    }

    if (!(Test-Path $LogFilePath)) {
        New-Item -Path $LogFilePath -ItemType File -Force
    }

    $LogLine = "[$(Get-Date -f 'yyyy-MM-dd HH:mm:ss')] $Severity`t$Message"
    Add-Content -path $LogFilePath -Value $LogLine
}