#!/usr/bin/env python3
import sys
import ifaddr # python3-ifaddr
for adapter in ifaddr.get_adapters():
	if adapter.nice_name == 'lo':
		continue
	if adapter.ips:
		for ip in adapter.ips:
			if ip.is_IPv6:
				continue
			print('%s/%s' % (ip.ip, ip.network_prefix))
	else:
		print('%s: has no address' % (adapter.nice_name), file=sys.stderr)
