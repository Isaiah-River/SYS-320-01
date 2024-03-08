function getTable(){
    # Get the page
    $getTable = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.5/IOC.html
    
    # Get all the tr elements of html page
    $trs = $getTable.ParsedHtml.body.getElementsByTagName("tr")

    # Empty array to hold results
    $FullTable = @()

    
    for($i=1; $i -lt $trs.length; $i++){ #Go over every tr element
        $tds = $trs[$i].getElementsByTagName("td")

    $FullTable += [pscustomobject]@{
                                    "Pattern" = $tds[0].innerText;
                                    "Explanation" = $tds[1].innerText;
                                     }
    
    }
    return $FullTable
    }
function ApacheLogs(){
    clear
    $logsNotFormated = Get-Content $PSScriptRoot/access.log
    $tableRecords = @()

    for ($i=0; $i -lt $logsNotFormated.Count; $i++){

    $words = $logsNotFormated[$i].Split(" ")

    $tableRecords += [pscustomobject]@{"IP" = $words[0];
                                   "Time" = $words[3].Trim('[');
                                   "Method" = $words[5].Trim('"');
                                   "Page" = $words[6];
                                   "Protocol" = $words[5];
                                   "Response" = $words[8];
                                   "Referrer" = $words[10];
                                    }
    }
    return $tableRecords
}




function SearchForIndicators($logs, $indicators) {
    $matchedLogs = @()

    foreach ($log in $logs) {
        foreach ($indicator in $indicators) {
            if ($log.Page -match $indicator.Pattern) {
                $matchedLogs += $log
                
            }
        }
    }

    return $matchedLogs | Format-Table -AutoSize -Wrap
}

$logs = ApacheLogs
$indicators = getTable

SearchForIndicators $logs $indicators



