#!/bin/bash
vtysh  -c 'conf t' \
 -c 'interface matrix_55' \
 -c 'ip address 55.0.198.1/24' \
 -c 'exit' \
 -c 'router ospf' \
 -c 'network 55.0.198.1/24 area 0' \
 -c 'exit' \
