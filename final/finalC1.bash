#!/bin/bash

# Fetch the IOC.html from local server
curl -s http://10.0.17.7/IOC.html > IOC.html

# Extract IOC patterns and save them to IOC.txt
grep -oP '(?<=<td>).*?(?=</td>)' IOC.html | awk 'NR % 2 == 1' > IOC.txt

# Remove IOC.html
rm IOC.html

echo "IOC patterns extracted and saved to IOC.txt"
