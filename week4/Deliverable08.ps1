clear
# Display only the logs that contain 404 (not found)
$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

$ipsUnorganized = $regex.Matches($notfounds)

# Get ips as pscustomobject

$ips = @()

for ($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [pscustomobject]@{ "IP"  = $ipsUnorganized[$i].Value; }
}

# Count $Ips
$ipsoften = $ips | Where-Object { $_.IP -ilike  "10.*" }
$counts = $ipsoften | Group-Object IP
$counts | Select-Object Count, Name

