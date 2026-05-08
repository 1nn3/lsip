# Nmap

	nmap [scan types] [options] <target specifications>

Als Benutzer (ohne erweiterte Rechte) führt *nmap(1)* standardmäßig einen TCP-Connect-Scan durch. Nur unter der UID *0/root* (mit erweiterten Rechten) wird dagegen ein SYN-Scan (`-sS`) ausgeführt, welcher schnell und (relativ) unauffällig ist.

## Root-Rechte

	# https://secwiki.org/w/Running_nmap_as_an_unprivileged_user#Set_capabilities
	apt install libcap2-bin
	setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip /usr/bin/nmap

You must explicitly tell nmap that it has these capabilities: 

	NMAP_PRIVILEGED= nmap -sS [options…] <targets…>

	nmap --privileged -sS [options…] <targets…>

