clear
# Display only the logs that contain 404 (not found) or 400 (bad request)
$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 '

$regex = [regex] "[0-9]{1,3}/.[0-9]{1,3}/.[0-9]{1,3}/.[0-9]{1,3}"

$ipsUnorganized = $regex.Match($notfounds)

# Get ips as pscustomobject

$ips = @()

for ($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [pscustomobject]@{ "IP"  = $ipsUnorganized[$i].Value; }
}
$ips | Where-Object { $_.IP -ilike "10.*" }

