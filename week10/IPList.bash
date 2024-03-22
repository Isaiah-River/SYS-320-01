#!/bin/bash

# List all the ips given in the network prefix
# /24 only

# Usage: bash IPList.bash 10.0.17

[ "$#" -ne 1 ] && echo "Usage: $0 <Prefix>" && exit 1

# Prefix is taken as an input
prefix="$1"

# Verify input length
[ ${#prefix} -lt 5 ] && \
printf "Prefix length is too short\nPrefix Example: 10.0.17\n" && \
exit 1

for i in {1..254}
do
	ping -c 1 "$prefix.$i" | grep "64 bytes" | \
	grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
done
