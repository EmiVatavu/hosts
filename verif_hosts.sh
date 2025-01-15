#!/bin/bash
check_ip()
{
local name=$1
local ip=$2
local server=$3
x=$(nslookup "$name" "$server" | awk '/Address: / {print $2}' | tail -n 1)
if [[ "$x" != "$ip" ]]; then
echo "Bogus IP for $name"
else
echo "$name IP is correct."
fi

}
while read -r ip name; do
	check_ip "$name" "$ip" "8.8.8.8"
done < /etc/hosts
