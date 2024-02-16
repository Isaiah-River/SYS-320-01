clear
# From every .log file in the directory, only get the ones that contain the word 'error'
$A = Get-Childitem C:\xampp\apache\logs\*.log | Select-String 'error' 
$A[-5..-1]