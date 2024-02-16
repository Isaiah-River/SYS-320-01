clear
# Display only the logs that contain 404 (not found) or 400 (bad request)
Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 ', ' 505 '