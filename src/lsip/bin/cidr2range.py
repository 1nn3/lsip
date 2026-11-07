#!/usr/bin/env python3
import sys
import ipaddress
def main():
    #if len(sys.argv) < 2:
    #    sys.exit()
    for line in sys.stdin:
        cidr = line.strip()
        if line:
            net = ipaddress.ip_network(cidr, strict=False)
            for ip in net.hosts():
                print(ip)
if __name__ == "__main__":
    main()