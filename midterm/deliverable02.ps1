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
    return $tableRecords | Format-Table -AutoSize -Wrap
}

ApacheLogs
