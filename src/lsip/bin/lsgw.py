#!/usr/bin/env python3
import sys, netifaces
def main():
    gws = netifaces.gateways()
    gw = gws.get('default', {}).get(netifaces.AF_INET)
    if gw:
        print(gw[0])
    else:
        print('No gateway found', file=sys.stderr)
if __name__ == "__main__":
    main()
