#!/usr/bin/env -S proxychains sh
set -xe
cd ~/.nmap || exit
nping --tcp-connect --dest-port 443 --rate 1 --count 0 \
	${@:-scanme.nmap.org megacorpone.com example.net example.com example.org}

