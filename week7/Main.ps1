. (Join-Path "C:\Users\champuser\Desktop\Labs\SYS-320-01\week6\Turn To Menu" Event-Logs.ps1)
. (Join-Path "C:\Users\champuser\Desktop\Labs\SYS-320-01\week7" Email.ps1)
. (Join-Path "C:\Users\champuser\Desktop\Labs\SYS-320-01\week7" Scheduler.ps1)
. (Join-Path "C:\Users\champuser\Desktop\Labs\SYS-320-01\week7" Configuration.ps1)
clear

# Obtaining Configuration
$configuration = readConfiguration

# Obtaining at risk users
$Failed = atRiskUsers $configuration.Days

# Sending at risk users as email
SendAlertEmail($Failed | Format-Table | Out-String)

#Setting the script to be run daily
ChooseTimeToRun($configuration.ExecutionTime)