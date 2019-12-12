#!/bin/bash
#different cases, arg 2 = a/mx/cname
if [ -n "$1" ]; then
	if [[ $1 = "-t" ]]; then
		case $2 in
			A)
				printf "\n$3	IN	A	$4\n"	>>	/etc/bind/zones/db."$5"
				zone="/etc/bind/zones/db.$5"
				;;
			MX)
				printf "\n@	IN	MX	10	$3.$5.\n"	>>	/etc/bind/zones/db."$5"
				printf "\n$3	IN	A	$4\n"	>>	/etc/bind/zones/db."$5"
				zone="/etc/bind/zones/db.$5"
				;;
			CNAME)
				zone="/etc/bind/zones/db.$4"
				printf "\n$3	IN	CNAME	$4.\n"	>>	"$zone"
				;;
		esac
	else
		printf "\n$1	IN	A	$2\n"	>>	/etc/bind/zones/db."$3"
		zone="/etc/bind/zones/db.$3"
	fi

#serial + 1
	serial_nr=$(grep -Po '\d+(?=\s+; Serial)' "$zone")
	serial_comp=$(grep -Po '\d+\s+; Serial' "$zone")
	serial_ln=$(grep -Po '\s+; Serial' "$zone")
	serial_updated=$(("$serial_nr" + 1))

#s/regex/replacement/		file			g = Copy/append hold space to pattern space
	sed -i "s/$serial_comp/$serial_updated$serial_ln/g" "$zone"

#refresh zone
	rndc reload

#restart bind
	service bind9 restart
else
	printf "The arguments in your command are invalid."
fi
