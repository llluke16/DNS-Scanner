#!/bin/bash

domain="$1"

echo "===================== A records for $domain ====================="

if dig A $domain | grep -q 'ANSWER: 0'; then
	echo "No A records found for this domain, try again retard"
else
	dig A $domain | awk '/Query time/{p=0};p;/ANSWER SECTION/{p=1}'
fi

echo "===================== AAAA records for $domain ====================="

if dig AAAA $domain | grep -q 'ANSWER: 0'; then
	echo "No AAAA records found for this domain, try again retard"
else
	dig AAAA $domain | awk '/Query time/{p=0};p;/ANSWER SECTION/{p=1}'
fi

echo "===================== CNAME records for $domain ====================="

if dig CNAME $domain | grep -q 'ANSWER: 0'; then
	echo "No CNAME records found for this domain, try again retard"
else
	dig CNAME $domain | awk '/Query time/{p=0};p;/ANSWER SECTION/{p=1}'
fi

echo "===================== MX records for $domain ====================="

if dig MX $domain | grep -q 'ANSWER: 0'; then
	echo "No MX records found for this domain, try again retard"
else
	dig MX $domain | awk '/Query time/{p=0};p;/ANSWER SECTION/{p=1}'
fi

echo "===================== TXT records for $domain ====================="

if dig TXT $domain | grep -q 'ANSWER: 0'; then
	echo "No TXT records found for this domain, try again retard"
else
	dig TXT $domain | awk '/Query time/{p=0};p;/ANSWER SECTION/{p=1}'
fi

echo "===================== NS records for $domain ====================="

if dig NS $domain | grep -q 'ANSWER: 0'; then
	echo "No NS records found for this domain, try again retard"
else
	dig NS $domain | awk '/Query time/{p=0};p;/ANSWER SECTION/{p=1}'
fi
