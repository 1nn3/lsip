#!/usr/bin/env -S proxychains sh
# --rate 1: Sends 1 packet per second (adjust as needed)
# --count 0: Tells nping to send packets indefinitely
set -xe
cd ~/.nmap || exit
nping --tcp-connect --dest-port 443 --rate 1 --count 1 \
	${@:-scanme.nmap.org megacorpone.com example.net example.com example.org}

