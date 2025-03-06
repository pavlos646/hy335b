#!/bin/bash
vtysh  -c 'conf t' \
 -c 'interface measurement_55' \
 -c 'ip address 55.0.199.1/24' \
 -c 'exit' \
 -c 'router ospf' \
 -c 'network 55.0.199.1/24 area 0' \
 -c 'exit' \
