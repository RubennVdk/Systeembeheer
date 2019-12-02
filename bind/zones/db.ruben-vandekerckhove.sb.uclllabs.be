$TTL	300
@	IN	SOA	ns.ruben-vandekerckhove.sb.uclllabs.be.	root.ruben-vandekerckhove.sb.uclllabs.be. (
				82	; Serial
				604800	; Refresh
				86400	; Retry
				604800	; Expire
				300 ); Negative Cache TTL

@		IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
@		IN	NS	ns1.uclllabs.be.
@		IN	NS	ns2.uclllabs.be.

@		IN	NS	ns.indy-naessens.sb.uclllabs.be.

@               IN      A       193.191.177.174
ns		IN	A	193.191.177.174

www		IN	A	193.191.177.174
www1		IN	A	193.191.177.174
www2		IN	A	193.191.177.174
test		IN	A	193.191.177.254

secure		IN	A	193.191.177.174
supersecure	IN	A	193.191.177.174

@		IN	CAA	0 issue "letsencrypt.org"

mx		IN	A	193.191.177.174
@		IN	MX	10	mx.ruben-vandekerckhove.sb.uclllabs.be.

foobar	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
foobar	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
foobartestroot	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
foobartestroot	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
userchecktest	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
userchecktest	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
userchecktest	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
checktest	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
checktestmetsudo	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
checktestzondersudo	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.

ns		IN	AAAA	2001:6a8:2880:a077::ae
@		IN	AAAA	2001:6a8:2880:a077::ae
www		IN	AAAA	2001:6a8:2880:a077::ae
mx		IN	AAAA	2001:6a8:2880:a077::ae


foobar.ruben-vandekerckhove.uclllabs.be	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
foobar	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.
subdomain	IN	NS	ns.ruben-vandekerckhove.sb.uclllabs.be.

$INCLUDE /var/cache/bind/Kruben-vandekerckhove.sb.uclllabs.be.+007+12437.key
$INCLUDE /var/cache/bind/Kruben-vandekerckhove.sb.uclllabs.be.+007+30615.key
