#!/bin/bash
if [ -n "$1" ]; then

#add new zone to placeholder and place text into master zone file
#s/regex/replacement/           file                    g = Copy/append hold space to pattern space
	sed "s/change/$1/g" /etc/bind/zones/.template.db.zone > /etc/bind/zones/db."$1".ruben-vandekerckhove.sb.uclllabs.be

#add new zone to local
	sed "s/change/$1/g" /etc/bind/.addzone.named.conf.local >> /etc/bind/named.conf.local

#add record to master zone file
	printf "\n$1	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be." >> /etc/bind/zones/db.ruben-vandekerckhove.sb.uclllabs.be

#serial + 1
	serial_nr=$(grep -Po '\d+(?=\s+; Serial)' /etc/bind/zones/db.ruben-vandekerckhove.sb.uclllabs.be)
	serial_comp=$(grep -Po '\d+\s+; Serial' /etc/bind/zones/db.ruben-vandekerckhove.sb.uclllabs.be)
	serial_ln=$(grep -Po '\s+; Serial' /etc/bind/zones/db.ruben-vandekerckhove.sb.uclllabs.be)
	serial_updated=$(("$serial_nr" + 1))

#s/regex/replacement/           file                    g = Copy/append hold space to pattern space
	sed -i "s/$serial_comp/$serial_updated$serial_ln/g" /etc/bind/zones/db.ruben-vandekerckhove.sb.uclllabs.be

#change access properties
	chmod 644 /etc/bind/zones/db."$1".ruben-vandekerckhove.sb.uclllabs.be

#reload zones
	rndc reload

#restart bind
	service bind9 restart

else
	printf "The argument is invalid."
fi
