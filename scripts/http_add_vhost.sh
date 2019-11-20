#!/bin/bash

subdomain=$(grep -Po '.{1,}(?=.ruben-vandekerckhove.sb.uclllabs.be)' <<< "$1")
completedomain=$(cut -d. -f2- <<< "$1")
firstfield=$(cut -d. -f1 <<< "$1")
secondfield=$(cut -d. -f2 <<< "$1")
search='^'"$firstfield"'\s'
found=$(grep -P "$search" /etc/bind/zones/db."$completedomain" | wc -l)

if [ "$found" -gt 0 ]; then
	mkdir /var/www/html/"$subdomain"
	touch /v	ar/www/html/"$subdomain"/index.html
	echo "<html><body><article><p>welcome $subdomain</p></article></body></html>" >> /var/www/html/"$subdomain"/index.html;

	sed "s/change/$subdomain/g" /etc/apache2/sites-available/.create_vhost.conf > /etc/apache2/sites-available/"$subdomain".conf

	a2ensite "$subdomain".conf
	systemctl reload apache2
else
	echo "The zone doesnt exist in /etc/bind/zones/db.$completedomain!"
	exit 1
fi
