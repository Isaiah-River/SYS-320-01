# Write a powershell script that if an instance of it is not already running, starts 
# google chrome, and directs it to champlain.edu.
# If there is an instance of chrome, close it
clear
$chromeProcess = Get-Process -Name *chrome*
# Check if chrome is not running,
if ($chromeProcess -eq $null) {
    # if it isn't, start it and navigate to champlain.edu
    Start-Process "chrome" -ArgumentList "https://www.champlain.edu"
    Write-Host "There was no instance of Chrome running, starting Chrome"
} else {
    # If Chrome is running, close chrome
    Stop-Process -Name *chrome*
    Write-Host "Closing Chrome, as it was running."
}