#!/usr/bin/env python3
import sys
import ipaddress
def main():
    if len(sys.argv) < 3:
        sys.exit()
    start = ipaddress.IPv4Address(sys.argv[1])
    end = ipaddress.IPv4Address(sys.argv[2])
    xor = int(start) ^ int(end)
    prefix = 32 - xor.bit_length()
    cidr = ipaddress.ip_network(f'{start}/{prefix}', strict=False)
    print(cidr)
    network = ipaddress.ip_network(cidr, strict=False)
    #print(f'num_addresses: {network.num_addresses}', file=sys.stderr)
if __name__ == "__main__":
    main()