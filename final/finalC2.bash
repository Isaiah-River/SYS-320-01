#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <log_file> <ioc_file>"
    exit 1
fi

# Assign arguments to variables
log_file="$1"
ioc_file="$2"

# Loop through each IOC pattern in the IOC file
while IFS= read -r ioc_pattern; do
    # Search the log file for lines containing the IOC pattern
    grep "$ioc_pattern" "$log_file" | awk '{sub(/^\[/, "", $4); sub(/\]$/, "", $4); print $1, $4, $7}' >> report.txt
done < "$ioc_file"

echo "Report generated and saved to report.txt"
