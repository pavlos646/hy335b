#!/bin/bash
source "/home/ubuntu/MINI_INTERNET/hy335b/mini_internet_project/platform/setup/ovs-docker.sh"
PID=2687669
create_netns_link
ip netns exec $PID ip route add 198.0.0.55 dev group_55 
ip netns exec $PID ip route add 55.0.0.0/8 via 198.0.0.55 
ip netns exec $PID ip route add 198.0.0.101 dev measurement 
