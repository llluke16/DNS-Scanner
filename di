#!/bin/bash

domain="$1"
declare -a dnsArray=("A" "AAAA" "CNAME" "MX" "NS" "TXT" "SOA" "PTR" "SRV")
if [[ -z $1 ]]; then
	echo "Enter a domain name silly"
else
if [[ "$1" == ?*"."?* ]]; then
	echo "===================== WHOIS info for $domain ====================="
	echo
	whois $1 | sed '/>>> Last update of/q'
	echo
for i in "${dnsArray[@]}"; do
	echo "===================== $i records for $domain ====================="
	echo
	if dig "$i" "$domain" | grep -q 'ANSWER: 0'; then
		echo "No "$i" records found for this domain"
		echo
	else
		field=5
		[[ "$i" == "MX" ]] && field=6

		dig "$i" "$domain" | awk '/Query time/{p=0};p;/ANSWER SECTION/{p=1}' | awk -v f="$field" 'NF >= f {print $1, "-->", $f}' | while read -r col1 arrow hostname; do
			if [[ "$i" == "A" || "$i" == "CNAME" || "$i" == "MX" || "$i" == "NS" ]]; then
				hostopt=$(host "$hostname" | awk 'NR == 1')
				echo "$col1 $arrow $hostname --> $hostopt"
			else
				echo "$col1 $arrow $hostname"
			fi
		done
	fi
	echo
done

else
	echo "That's not a valid domain, try again retard"
fi
fi
