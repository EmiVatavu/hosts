#!/bin/bash
while read -r ip name; do
x=$(nslookup "$name" | awk '/Address: / {print $2}' | tail -n 1)
if [[ "$x" != "$ip" ]]; then
echo "Bogus IP for $name in /etc/hosts!"
else
echo "$name IP is correct."
fi
done < /etc/hosts
