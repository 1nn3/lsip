#!/usr/bin/env sh
export LC_ALL=C
ip -f inet -br a \
	| awk '$1!="lo" && $2!="DOWN" {print $NF}'

