. (Join-Path $PSScriptRoot Deliverable-01.ps1)

clear

# Get Login and logouts from the last 15 days
$winlogonTable = GetLogonEvents 15
$winlogonTable
# Get shutdowns from the last 15 days
$PowerTable = StartAndShutdown 15
$PowerTable 
# Get Start ups from the last 15 days
