# lsip
2026-10-19
Topics: IPv4 IPv6 IP Adresses

Zeigt IPv4- und IPv6-Adressen, sowie Interfaces und Gateways an.

* The loopback interface (lo) is always ignored 
* Also all interfaces that are down or have no ip-addresses are ignored
* Used the CIDR format
* Needs python3-netifaces

## Installation

```
python -m pip install .
```

## Usage

```
lsip # Zeigt IPv4-Adressen an
```

```
lsgw # Ziegt das Gateway an
```

```
lsip | lrange2cidr
```

Siehe auch: `lsip6`, `lsgw6`

