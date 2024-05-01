#!/bin/bash

# Check if report.txt exists
if [ ! -f "report.txt" ]; then
    echo "Error: report.txt not found."
    exit 1
fi

# Create HTML report
cat << EOF > /var/www/html/report.html
<!DOCTYPE html>
<html>
<head>
<title>IOC Report</title>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  border: 1px solid black;
  padding: 8px;
  text-align: left;
}

th {
  background-color: #f2f2f2;
}
</style>
</head>
<body>

<h2>IOC Report</h2>

<table>
  <tr>
    <th>IP Address</th>
    <th>Date/Time</th>
    <th>Page Accessed</th>
  </tr>
EOF

# Populate HTML report with data from report.txt
while IFS= read -r line; do
    ip=$(echo "$line" | awk '{print $1}')
    datetime=$(echo "$line" | awk '{print $2}')
    page_accessed=$(echo "$line" | awk '{print $NF}')
    echo "<tr><td>$ip</td><td>$datetime</td><td>$page_accessed</td></tr>" >> /var/www/html/report.html
done < report.txt

# Complete HTML report
cat << EOF >> /var/www/html/report.html
</table>

</body>
</html>
EOF

echo "HTML report generated and saved to /var/www/html/report.html"



