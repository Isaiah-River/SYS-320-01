function Apache-Logs{
    clear
# Define parameters for:
# The page visited or reffered from.
# HTTP Code returned
# Name of the Web Browser 
    $page = $args[0]
    $httpCode = $args[1]
    $browserName = $args[2]


# Display only the logs that contain 404 (not found)
    $notfounds =  Get-Content C:\xampp\apache\logs\access.log | Select-String "$page" |  Select-String $httpCode | Select-String $browserName


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

}


