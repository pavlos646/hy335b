#!/bin/bash
vtysh  -c 'conf t' \
 -c 'interface dns_55' \
 -c 'ip address 198.0.0.55/24' \
 -c 'exit' \
 -c 'router ospf' \
 -c 'network 198.0.0.55/24 area 0' \
 -c 'exit' \
