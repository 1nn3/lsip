#!/usr/bin/env python3
import sys, argparse
import netifaces
import ipaddress
parser = argparse.ArgumentParser(
    description="lsip6: IPv6-Netzwerke der Schnittstellen anzeigen"
)
parser.add_argument(
    "interfaces",
    nargs="*",
    help="Interfaces to inspect (default: all interfaces)",
)
#interfaces = sys.argv[1:] or netifaces.interfaces()
def main():
    args = parser.parse_args()
    interfaces = args.interfaces or netifaces.interfaces()
    for interface in interfaces:
        if interface == 'lo':
            continue
        addrs = netifaces.ifaddresses(interface)
        if netifaces.AF_INET6 in addrs:
            for entry in addrs[netifaces.AF_INET6]:
                addr = entry.get('addr')
                netmask = entry.get('netmask')
                try:
                    network = ipaddress.IPv6Network(f"{addr}/{netmask}", strict=False)
                    print(str(network))
                except Exception:
                    print(addr)
if __name__ == "__main__":
    main()
