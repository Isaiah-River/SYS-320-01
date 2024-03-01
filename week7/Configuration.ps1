clear
Function readConfiguration(){
    $daysBack = Get-Content $PSScriptRoot\configuration.txt -First 1
    $executionTime = Get-Content $PSScriptRoot\configuration.txt -Last 1
    $readConfigurationTable = @()
    $readConfigurationTable += [pscustomobject]@{
                                                 "Days" = $daysBack
                                                 "ExecutionTime" = $executionTime
                                                }
    return $readConfigurationTable
}

Function changeConfiguration(){
    Write-Host "Enter the number of days for which the logs will be obtained" | Out-String
    $setDaysBack = Read-Host

    Write-Host "Enter the daily execution time of the script (I.E 1:23 AM)" | Out-String
    $setExecutionTime = Read-Host

    Clear-Content -Path $PSScriptRoot\configuration.txt
    $setDaysBack | Out-File -FilePath $PSScriptRoot\configuration.txt
    $setExecutionTime | Out-File -FilePath $PSScriptRoot\configuration.txt -Append
   

}

Function configurationMenu(){
    $Prompt  = "Please choose your operation:`n"
    $Prompt += "1 - Show Configuration`n"
    $Prompt += "2 - Change configuration`n"
    $Prompt += "3 - Exit`n"

    $operation = $true

    while($operation){
        Write-Host $Prompt | Out-String
        $choice = Read-Host 

        if($choice -eq 1){
            Write-Host (readConfiguration | Format-Table | Out-String)
        }
        elseif($choice -eq 2){
            changeConfiguration
        }
        elseif($choice -eq 3){
          Write-Host "Goodbye" | Out-String
          exit
          $operation = $false 
        }
        else{
            Write-Host "Could not find the option for $choice." | Out-String
        }
}

}
