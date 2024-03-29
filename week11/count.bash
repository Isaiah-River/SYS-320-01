 #!/bin/bash

file="/var/log/apache2/access.log"

cat "$file" | grep "GET" | cut -d' ' -f7 | sort | uniq -c

