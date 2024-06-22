function Reset-AzAccount {
    $i = 0
    while (Get-AzContext) {
        $i++
        $null = Disconnect-AzAccount
    }
    Write-Host "Disconnected $i Azure account$(if ($i -ne 1) {"s"})."
}