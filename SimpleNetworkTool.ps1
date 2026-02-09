while ($true) {
    Write-Host "`n--- Network Utility Menu ---" -ForegroundColor Cyan
    Write-Host "1- Check Internet Connection" -ForegroundColor Green
    Write-Host "2- Check Your IP" -ForegroundColor Yellow
    Write-Host "3- Flush DNS" -ForegroundColor Blue
    Write-Host "Q- Quit" -ForegroundColor Red

    $choice = Read-Host "Please Insert Your Choice"

    if ($choice -eq '1') {
        if (Test-Connection -ComputerName 8.8.8.8 -Count 1 -Quiet) {
            Write-Host "Success: You are connected to the internet." -ForegroundColor Green
        } else {
            Write-Host "Error: No internet connection found." -ForegroundColor Red
        }
    } 
    elseif ($choice -eq '2') {
        $ip = Get-NetIPAddress -AddressFamily IPv4 | Select-Object -ExpandProperty IPAddress
        Write-Host "Your IP Addresses are: $ip" -ForegroundColor Green
    } 
    elseif ($choice -eq '3') {
        Clear-DnsClientCache
        Write-Host "DNS has been cleared successfully." -ForegroundColor Yellow
    } 
    elseif ($choice -eq 'Q' -or $choice -eq 'q') {
        break
    }
    else {
        Write-Host "Invalid choice, please try again." -ForegroundColor Red
    }
}