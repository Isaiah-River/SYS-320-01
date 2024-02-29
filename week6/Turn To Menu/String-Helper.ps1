﻿<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

# TODO: Create a function called checkPassword in String-Helper that:
        #              - Checks if the given string is at least 6 characters
        #              - Checks if the given string contains at least 1 special character, 1 number, and 1 letter
        #              - If the given string does not satisfy conditions, returns false
        #              - If the given string satisfy the conditions, returns true


$specialCharacters = 
function checkPassword($password){
    $validPassword = $True
    if($password.Length -lt 6){
        write-host "Password is under six characters."
        $validPassword = $False
    }
    if($password -inotlike "*[`?`/`!`@`#`$`%`^`&`*`(`)`]*"){
        write-host "Password does not contain a special character."
        $validPassword = $False
    }
    if($password -inotlike "*[0123456789]*"){
        write-host "Password does not contain a number."
        $validPassword = $False
    }
    if($password -inotlike "*[qwertyuiopasdfghjklzxcvbnm]*"){
    write-host "Password does not contain a letter."
    $validPassword = $False
    }
    return $validPassword
}

$password = "abcde123!"
checkPassword $password