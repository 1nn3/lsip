#!/usr/bin/env -S proxychains sh
# Portscan
# Use -Pn to skip host discovery (Tor blocks ICMP).
# Use -sT for TCP connect scan (SYN scans won’t work through SOCKS proxies).
# Scanning through Tor is slow and limited—many targets may block Tor exit nodes.
# Avoid aggressive scan types like -A or -sS—they often fail or reveal your activity.
set -xe
export NMAPDIR="."
unset NMAP_PRIVILEGED NMAP_UNPRIVILEGED
cd ~/.nmap || exit
tmp=$(mktemp --tmpdir=/dev/shm)
trap 'rm -f -- $tmp' 0 1 2 3 15
for target; do
	nmap -Pn -sT --open $target
done # 2>/dev/null

