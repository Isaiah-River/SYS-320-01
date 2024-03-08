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

clear
getTable 