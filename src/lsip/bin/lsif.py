#!/usr/bin/env python3
import sys
import netifaces
def main():
    for interface in netifaces.interfaces():
        if interface == 'lo':
            continue
        print(interface)
if __name__ == "__main__":
    main()
