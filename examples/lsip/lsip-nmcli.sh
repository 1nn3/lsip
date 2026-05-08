#!/usr/bin/env sh
export LC_ALL=C # Damit der Reguläre Ausdruck s.u. korrekt ist
nmcli -f uuid,device connection show --active \
	| awk 'NR>1 && $2!="lo" {print $1}' \
	| xargs nmcli -t connection show \
	| sed -n -E '/^IP4\.ADDRESS\[[0-9]+\]:/{s///;p}'

