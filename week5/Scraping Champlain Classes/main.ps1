﻿. (Join-Path $PSScriptRoot deliverable01.ps1)

$table = gatherClasses



$FullTable = daysTranslator $table

# List all the classes of instructor Furkan Paligu
# $FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | `
#             Where-Object {$_."Instructor" -ilike "Furkan Paligu"}

# List all the classes of JOYC 310 on mondays, only display class code and times
# sort by start time
# $FullTable | Where-Object {($_.Location -ilike "JOYC 310") -and ($_.days -contains "Monday") } | `
#             Sort-Object "Time Start" | `
#             Select-Object "Time Start", "Time End", "Class Code"

# Make a list of all the instructors that teach at least 1 course in SYS, SEC, NET, FOR, CSI, DAT
# Sort by name, and make it unique           
$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
                                              ($_."Class Code" -ilike "NET*") -or ` 
                                              ($_."Class Code" -ilike "SEC*") -or `
                                              ($_."Class Code" -ilike "FOR*") -or `
                                              ($_."Class Code" -ilike "CSI*") -or `
                                              ($_."Class Code" -ilike "DAT*")} `
                                              | Select-Object "Instructor" `
                                              | Sort-Object "Instructor" -Unique

# Group all the instructors by the number of classes they are teaching

$FullTable | Where {$_.Instructor -in $ITSInstructors.Instructor}`
           | Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending