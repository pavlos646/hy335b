#!/bin/bash
source "/home/ubuntu/MINI_INTERNET/hy335b/mini_internet_project/platform/setup/ovs-docker.sh"
ovs-vsctl add-br vpnbr_55_vpn_1
openvpn --config /home/ubuntu/MINI_INTERNET/hy335b/mini_internet_project/platform/groups/g55/vpn/vpn_1/server.conf --log /home/ubuntu/MINI_INTERNET/hy335b/mini_internet_project/platform/groups/g55/vpn/vpn_1/log.txt &
echo kill $! >> groups/del_vpns.sh
ovs-vsctl add-br vpnbr_55_vpn_3
openvpn --config /home/ubuntu/MINI_INTERNET/hy335b/mini_internet_project/platform/groups/g55/vpn/vpn_3/server.conf --log /home/ubuntu/MINI_INTERNET/hy335b/mini_internet_project/platform/groups/g55/vpn/vpn_3/log.txt &
echo kill $! >> groups/del_vpns.sh
ip link add 55-vpn_1 type veth peer name g55_vpn_1
PID=2681248
create_netns_link
ip link set 55-vpn_1 netns $PID
ip netns exec $PID ip link set dev 55-vpn_1 up
docker exec -d 55_L2_UNIV_CERN ovs-vsctl add-port br0 55-vpn_1
ip link set dev g55_vpn_1 up
ip link set dev tap_g55_vpn_1 up
ovs-vsctl add-port vpnbr_55_vpn_1 tap_g55_vpn_1
ovs-vsctl add-port vpnbr_55_vpn_1 g55_vpn_1
ip link add 55-vpn_3 type veth peer name g55_vpn_3
PID=2681609
create_netns_link
ip link set 55-vpn_3 netns $PID
ip netns exec $PID ip link set dev 55-vpn_3 up
docker exec -d 55_L2_UNIV_EPFL ovs-vsctl add-port br0 55-vpn_3
ip link set dev g55_vpn_3 up
ip link set dev tap_g55_vpn_3 up
ovs-vsctl add-port vpnbr_55_vpn_3 tap_g55_vpn_3
ovs-vsctl add-port vpnbr_55_vpn_3 g55_vpn_3
