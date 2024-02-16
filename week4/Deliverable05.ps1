clear
# Display only the logs that do not contain 200 (ok)
Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 200 ' -NotMatch