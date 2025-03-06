#!/bin/bash
if [ $# -ne 1 ]; then
  echo $0: usage ./restart_container.sh container_name
  exit 1
fi
container_name=$1
source "/home/ubuntu/MINI_INTERNET/hy335b/mini_internet_project/platform/setup/ovs-docker.sh"
if [ "55_LONDrouter" == $container_name ]; then
  echo "Create Link for 55_LONDrouter (host) on bridge "
  ip link add eb582fd42df75_l type veth peer name eb582fd42df75_c
  ovs-vsctl del-port 55-host eb582fd42df75_l
  ovs-vsctl add-port 55-host eb582fd42df75_l
  ovs-vsctl set interface eb582fd42df75_l external_ids:container_id=55_LONDrouter external_ids:container_iface=host
  ip link set eb582fd42df75_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_LONDrouter)
  create_netns_link
  ip link set eb582fd42df75_c netns $PID
  ip netns exec $PID ip link set dev eb582fd42df75_c name host
  ip netns exec $PID ip link set host up
fi
if [ "55_LONDhost" == $container_name ]; then
  echo "Create Link for 55_LONDhost (LONDrouter) on bridge "
  ip link add 265e2a1fa4365_l type veth peer name 265e2a1fa4365_c
  ovs-vsctl del-port 55-host 265e2a1fa4365_l
  ovs-vsctl add-port 55-host 265e2a1fa4365_l
  ovs-vsctl set interface 265e2a1fa4365_l external_ids:container_id=55_LONDhost external_ids:container_iface=LONDrouter
  ip link set 265e2a1fa4365_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_LONDhost)
  create_netns_link
  ip link set 265e2a1fa4365_c netns $PID
  ip netns exec $PID ip link set dev 265e2a1fa4365_c name LONDrouter
  ip netns exec $PID ip link set LONDrouter up
fi
if [ "55_LONDrouter" == $container_name ] || [ "55_LONDhost" == $container_name ]; then
  echo "Link between 55_LONDrouter (host) and 55_LONDhost (LONDrouter)"
  port_id1=`ovs-vsctl get Interface eb582fd42df75_l ofport`
  port_id2=`ovs-vsctl get Interface 265e2a1fa4365_l ofport`
  ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_PARIrouter" == $container_name ]; then
  echo "Create Link for 55_PARIrouter (host) on bridge "
  ip link add 5f3d993226c45_l type veth peer name 5f3d993226c45_c
  ovs-vsctl del-port 55-host 5f3d993226c45_l
  ovs-vsctl add-port 55-host 5f3d993226c45_l
  ovs-vsctl set interface 5f3d993226c45_l external_ids:container_id=55_PARIrouter external_ids:container_iface=host
  ip link set 5f3d993226c45_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIrouter)
  create_netns_link
  ip link set 5f3d993226c45_c netns $PID
  ip netns exec $PID ip link set dev 5f3d993226c45_c name host
  ip netns exec $PID ip link set host up
fi
if [ "55_PARIhost" == $container_name ]; then
  echo "Create Link for 55_PARIhost (PARIrouter) on bridge "
  ip link add 00865122ff485_l type veth peer name 00865122ff485_c
  ovs-vsctl del-port 55-host 00865122ff485_l
  ovs-vsctl add-port 55-host 00865122ff485_l
  ovs-vsctl set interface 00865122ff485_l external_ids:container_id=55_PARIhost external_ids:container_iface=PARIrouter
  ip link set 00865122ff485_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIhost)
  create_netns_link
  ip link set 00865122ff485_c netns $PID
  ip netns exec $PID ip link set dev 00865122ff485_c name PARIrouter
  ip netns exec $PID ip link set PARIrouter up
fi
if [ "55_PARIrouter" == $container_name ] || [ "55_PARIhost" == $container_name ]; then
  echo "Link between 55_PARIrouter (host) and 55_PARIhost (PARIrouter)"
  port_id1=`ovs-vsctl get Interface 5f3d993226c45_l ofport`
  port_id2=`ovs-vsctl get Interface 00865122ff485_l ofport`
  ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_NEWYrouter" == $container_name ]; then
  echo "Create Link for 55_NEWYrouter (host) on bridge "
  ip link add 7681ab39c2ae5_l type veth peer name 7681ab39c2ae5_c
  ovs-vsctl del-port 55-host 7681ab39c2ae5_l
  ovs-vsctl add-port 55-host 7681ab39c2ae5_l
  ovs-vsctl set interface 7681ab39c2ae5_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=host
  ip link set 7681ab39c2ae5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_NEWYrouter)
  create_netns_link
  ip link set 7681ab39c2ae5_c netns $PID
  ip netns exec $PID ip link set dev 7681ab39c2ae5_c name host
  ip netns exec $PID ip link set host up
fi
if [ "55_NEWYhost" == $container_name ]; then
  echo "Create Link for 55_NEWYhost (NEWYrouter) on bridge "
  ip link add 2734334e88cc5_l type veth peer name 2734334e88cc5_c
  ovs-vsctl del-port 55-host 2734334e88cc5_l
  ovs-vsctl add-port 55-host 2734334e88cc5_l
  ovs-vsctl set interface 2734334e88cc5_l external_ids:container_id=55_NEWYhost external_ids:container_iface=NEWYrouter
  ip link set 2734334e88cc5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_NEWYhost)
  create_netns_link
  ip link set 2734334e88cc5_c netns $PID
  ip netns exec $PID ip link set dev 2734334e88cc5_c name NEWYrouter
  ip netns exec $PID ip link set NEWYrouter up
fi
if [ "55_NEWYrouter" == $container_name ] || [ "55_NEWYhost" == $container_name ]; then
  echo "Link between 55_NEWYrouter (host) and 55_NEWYhost (NEWYrouter)"
  port_id1=`ovs-vsctl get Interface 7681ab39c2ae5_l ofport`
  port_id2=`ovs-vsctl get Interface 2734334e88cc5_l ofport`
  ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_BOSTrouter" == $container_name ]; then
  echo "Create Link for 55_BOSTrouter (host) on bridge "
  ip link add 23ea4998c0bf5_l type veth peer name 23ea4998c0bf5_c
  ovs-vsctl del-port 55-host 23ea4998c0bf5_l
  ovs-vsctl add-port 55-host 23ea4998c0bf5_l
  ovs-vsctl set interface 23ea4998c0bf5_l external_ids:container_id=55_BOSTrouter external_ids:container_iface=host
  ip link set 23ea4998c0bf5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_BOSTrouter)
  create_netns_link
  ip link set 23ea4998c0bf5_c netns $PID
  ip netns exec $PID ip link set dev 23ea4998c0bf5_c name host
  ip netns exec $PID ip link set host up
fi
if [ "55_BOSThost" == $container_name ]; then
  echo "Create Link for 55_BOSThost (BOSTrouter) on bridge "
  ip link add 4d94041d35085_l type veth peer name 4d94041d35085_c
  ovs-vsctl del-port 55-host 4d94041d35085_l
  ovs-vsctl add-port 55-host 4d94041d35085_l
  ovs-vsctl set interface 4d94041d35085_l external_ids:container_id=55_BOSThost external_ids:container_iface=BOSTrouter
  ip link set 4d94041d35085_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_BOSThost)
  create_netns_link
  ip link set 4d94041d35085_c netns $PID
  ip netns exec $PID ip link set dev 4d94041d35085_c name BOSTrouter
  ip netns exec $PID ip link set BOSTrouter up
fi
if [ "55_BOSTrouter" == $container_name ] || [ "55_BOSThost" == $container_name ]; then
  echo "Link between 55_BOSTrouter (host) and 55_BOSThost (BOSTrouter)"
  port_id1=`ovs-vsctl get Interface 23ea4998c0bf5_l ofport`
  port_id2=`ovs-vsctl get Interface 4d94041d35085_l ofport`
  ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_ATLArouter" == $container_name ]; then
  echo "Create Link for 55_ATLArouter (host) on bridge "
  ip link add 9e2fa5e8627b5_l type veth peer name 9e2fa5e8627b5_c
  ovs-vsctl del-port 55-host 9e2fa5e8627b5_l
  ovs-vsctl add-port 55-host 9e2fa5e8627b5_l
  ovs-vsctl set interface 9e2fa5e8627b5_l external_ids:container_id=55_ATLArouter external_ids:container_iface=host
  ip link set 9e2fa5e8627b5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ATLArouter)
  create_netns_link
  ip link set 9e2fa5e8627b5_c netns $PID
  ip netns exec $PID ip link set dev 9e2fa5e8627b5_c name host
  ip netns exec $PID ip link set host up
fi
if [ "55_ATLAhost" == $container_name ]; then
  echo "Create Link for 55_ATLAhost (ATLArouter) on bridge "
  ip link add d42b98a44e0e5_l type veth peer name d42b98a44e0e5_c
  ovs-vsctl del-port 55-host d42b98a44e0e5_l
  ovs-vsctl add-port 55-host d42b98a44e0e5_l
  ovs-vsctl set interface d42b98a44e0e5_l external_ids:container_id=55_ATLAhost external_ids:container_iface=ATLArouter
  ip link set d42b98a44e0e5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ATLAhost)
  create_netns_link
  ip link set d42b98a44e0e5_c netns $PID
  ip netns exec $PID ip link set dev d42b98a44e0e5_c name ATLArouter
  ip netns exec $PID ip link set ATLArouter up
fi
if [ "55_ATLArouter" == $container_name ] || [ "55_ATLAhost" == $container_name ]; then
  echo "Link between 55_ATLArouter (host) and 55_ATLAhost (ATLArouter)"
  port_id1=`ovs-vsctl get Interface 9e2fa5e8627b5_l ofport`
  port_id2=`ovs-vsctl get Interface d42b98a44e0e5_l ofport`
  ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_MIAMrouter" == $container_name ]; then
  echo "Create Link for 55_MIAMrouter (host) on bridge "
  ip link add 75889f599e385_l type veth peer name 75889f599e385_c
  ovs-vsctl del-port 55-host 75889f599e385_l
  ovs-vsctl add-port 55-host 75889f599e385_l
  ovs-vsctl set interface 75889f599e385_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=host
  ip link set 75889f599e385_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_MIAMrouter)
  create_netns_link
  ip link set 75889f599e385_c netns $PID
  ip netns exec $PID ip link set dev 75889f599e385_c name host
  ip netns exec $PID ip link set host up
fi
if [ "55_MIAMhost" == $container_name ]; then
  echo "Create Link for 55_MIAMhost (MIAMrouter) on bridge "
  ip link add 4f6eac3ab13c5_l type veth peer name 4f6eac3ab13c5_c
  ovs-vsctl del-port 55-host 4f6eac3ab13c5_l
  ovs-vsctl add-port 55-host 4f6eac3ab13c5_l
  ovs-vsctl set interface 4f6eac3ab13c5_l external_ids:container_id=55_MIAMhost external_ids:container_iface=MIAMrouter
  ip link set 4f6eac3ab13c5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_MIAMhost)
  create_netns_link
  ip link set 4f6eac3ab13c5_c netns $PID
  ip netns exec $PID ip link set dev 4f6eac3ab13c5_c name MIAMrouter
  ip netns exec $PID ip link set MIAMrouter up
fi
if [ "55_MIAMrouter" == $container_name ] || [ "55_MIAMhost" == $container_name ]; then
  echo "Link between 55_MIAMrouter (host) and 55_MIAMhost (MIAMrouter)"
  port_id1=`ovs-vsctl get Interface 75889f599e385_l ofport`
  port_id2=`ovs-vsctl get Interface 4f6eac3ab13c5_l ofport`
  ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_ETHZ (55-CERN) on bridge "
  ip link add 28abfae9aab55_l type veth peer name 28abfae9aab55_c
  ovs-vsctl del-port l2-55 28abfae9aab55_l
  ovs-vsctl add-port l2-55 28abfae9aab55_l
  ovs-vsctl set interface 28abfae9aab55_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=55-CERN
  ip link set 28abfae9aab55_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_ETHZ)
  create_netns_link
  ip link set 28abfae9aab55_c netns $PID
  ip netns exec $PID ip link set dev 28abfae9aab55_c name 55-CERN
  ip netns exec $PID ip link set 55-CERN up
  tc qdisc add dev 28abfae9aab55_l root netem delay 1000 
  ovs-vsctl set interface 28abfae9aab55_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_CERN" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_CERN (55-ETHZ) on bridge "
  ip link add 044ff3f776a95_l type veth peer name 044ff3f776a95_c
  ovs-vsctl del-port l2-55 044ff3f776a95_l
  ovs-vsctl add-port l2-55 044ff3f776a95_l
  ovs-vsctl set interface 044ff3f776a95_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=55-ETHZ
  ip link set 044ff3f776a95_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_CERN)
  create_netns_link
  ip link set 044ff3f776a95_c netns $PID
  ip netns exec $PID ip link set dev 044ff3f776a95_c name 55-ETHZ
  ip netns exec $PID ip link set 55-ETHZ up
  tc qdisc add dev 044ff3f776a95_l root netem delay 1000 
  ovs-vsctl set interface 044ff3f776a95_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ] || [ "55_L2_UNIV_CERN" == $container_name ]; then
  echo "Link between 55_L2_UNIV_ETHZ (55-CERN) and 55_L2_UNIV_CERN (55-ETHZ)"
  port_id1=`ovs-vsctl get Interface 28abfae9aab55_l ofport`
  port_id2=`ovs-vsctl get Interface 044ff3f776a95_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_ETHZ (55-EPFL) on bridge "
  ip link add 95e77be050a15_l type veth peer name 95e77be050a15_c
  ovs-vsctl del-port l2-55 95e77be050a15_l
  ovs-vsctl add-port l2-55 95e77be050a15_l
  ovs-vsctl set interface 95e77be050a15_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=55-EPFL
  ip link set 95e77be050a15_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_ETHZ)
  create_netns_link
  ip link set 95e77be050a15_c netns $PID
  ip netns exec $PID ip link set dev 95e77be050a15_c name 55-EPFL
  ip netns exec $PID ip link set 55-EPFL up
  tc qdisc add dev 95e77be050a15_l root netem delay 1000 
  ovs-vsctl set interface 95e77be050a15_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_EPFL" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_EPFL (55-ETHZ) on bridge "
  ip link add 97c55e2530215_l type veth peer name 97c55e2530215_c
  ovs-vsctl del-port l2-55 97c55e2530215_l
  ovs-vsctl add-port l2-55 97c55e2530215_l
  ovs-vsctl set interface 97c55e2530215_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=55-ETHZ
  ip link set 97c55e2530215_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_EPFL)
  create_netns_link
  ip link set 97c55e2530215_c netns $PID
  ip netns exec $PID ip link set dev 97c55e2530215_c name 55-ETHZ
  ip netns exec $PID ip link set 55-ETHZ up
  tc qdisc add dev 97c55e2530215_l root netem delay 1000 
  ovs-vsctl set interface 97c55e2530215_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ] || [ "55_L2_UNIV_EPFL" == $container_name ]; then
  echo "Link between 55_L2_UNIV_ETHZ (55-EPFL) and 55_L2_UNIV_EPFL (55-ETHZ)"
  port_id1=`ovs-vsctl get Interface 95e77be050a15_l ofport`
  port_id2=`ovs-vsctl get Interface 97c55e2530215_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_L2_UNIV_CERN" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_CERN (55-EPFL) on bridge "
  ip link add e9cee8418e235_l type veth peer name e9cee8418e235_c
  ovs-vsctl del-port l2-55 e9cee8418e235_l
  ovs-vsctl add-port l2-55 e9cee8418e235_l
  ovs-vsctl set interface e9cee8418e235_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=55-EPFL
  ip link set e9cee8418e235_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_CERN)
  create_netns_link
  ip link set e9cee8418e235_c netns $PID
  ip netns exec $PID ip link set dev e9cee8418e235_c name 55-EPFL
  ip netns exec $PID ip link set 55-EPFL up
  tc qdisc add dev e9cee8418e235_l root netem delay 1000 
  ovs-vsctl set interface e9cee8418e235_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_EPFL" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_EPFL (55-CERN) on bridge "
  ip link add fa6e3e508d0c5_l type veth peer name fa6e3e508d0c5_c
  ovs-vsctl del-port l2-55 fa6e3e508d0c5_l
  ovs-vsctl add-port l2-55 fa6e3e508d0c5_l
  ovs-vsctl set interface fa6e3e508d0c5_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=55-CERN
  ip link set fa6e3e508d0c5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_EPFL)
  create_netns_link
  ip link set fa6e3e508d0c5_c netns $PID
  ip netns exec $PID ip link set dev fa6e3e508d0c5_c name 55-CERN
  ip netns exec $PID ip link set 55-CERN up
  tc qdisc add dev fa6e3e508d0c5_l root netem delay 1000 
  ovs-vsctl set interface fa6e3e508d0c5_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_CERN" == $container_name ] || [ "55_L2_UNIV_EPFL" == $container_name ]; then
  echo "Link between 55_L2_UNIV_CERN (55-EPFL) and 55_L2_UNIV_EPFL (55-CERN)"
  port_id1=`ovs-vsctl get Interface e9cee8418e235_l ofport`
  port_id2=`ovs-vsctl get Interface fa6e3e508d0c5_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_L2_UNIV_CERN" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_CERN (55-student_1) on bridge "
  ip link add fff5d3c25c5d5_l type veth peer name fff5d3c25c5d5_c
  ovs-vsctl del-port l2-55 fff5d3c25c5d5_l
  ovs-vsctl add-port l2-55 fff5d3c25c5d5_l
  ovs-vsctl set interface fff5d3c25c5d5_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=55-student_1
  ip link set fff5d3c25c5d5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_CERN)
  create_netns_link
  ip link set fff5d3c25c5d5_c netns $PID
  ip netns exec $PID ip link set dev fff5d3c25c5d5_c name 55-student_1
  ip netns exec $PID ip link set 55-student_1 up
  tc qdisc add dev fff5d3c25c5d5_l root netem delay 1000 
  ovs-vsctl set interface fff5d3c25c5d5_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_student_1" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_student_1 (55-CERN) on bridge "
  ip link add d405209c6d6d5_l type veth peer name d405209c6d6d5_c
  ovs-vsctl del-port l2-55 d405209c6d6d5_l
  ovs-vsctl add-port l2-55 d405209c6d6d5_l
  ovs-vsctl set interface d405209c6d6d5_l external_ids:container_id=55_L2_UNIV_student_1 external_ids:container_iface=55-CERN
  ip link set d405209c6d6d5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_student_1)
  create_netns_link
  ip link set d405209c6d6d5_c netns $PID
  ip netns exec $PID ip link set dev d405209c6d6d5_c name 55-CERN
  ip netns exec $PID ip link set 55-CERN up
  tc qdisc add dev d405209c6d6d5_l root netem delay 1000 
  ovs-vsctl set interface d405209c6d6d5_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_CERN" == $container_name ] || [ "55_L2_UNIV_student_1" == $container_name ]; then
  echo "Link between 55_L2_UNIV_CERN (55-student_1) and 55_L2_UNIV_student_1 (55-CERN)"
  port_id1=`ovs-vsctl get Interface fff5d3c25c5d5_l ofport`
  port_id2=`ovs-vsctl get Interface d405209c6d6d5_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_L2_UNIV_CERN" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_CERN (55-staff_1) on bridge "
  ip link add a3ca625814af5_l type veth peer name a3ca625814af5_c
  ovs-vsctl del-port l2-55 a3ca625814af5_l
  ovs-vsctl add-port l2-55 a3ca625814af5_l
  ovs-vsctl set interface a3ca625814af5_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=55-staff_1
  ip link set a3ca625814af5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_CERN)
  create_netns_link
  ip link set a3ca625814af5_c netns $PID
  ip netns exec $PID ip link set dev a3ca625814af5_c name 55-staff_1
  ip netns exec $PID ip link set 55-staff_1 up
  tc qdisc add dev a3ca625814af5_l root netem delay 1000 
  ovs-vsctl set interface a3ca625814af5_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_staff_1" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_staff_1 (55-CERN) on bridge "
  ip link add 1254e9f30fc05_l type veth peer name 1254e9f30fc05_c
  ovs-vsctl del-port l2-55 1254e9f30fc05_l
  ovs-vsctl add-port l2-55 1254e9f30fc05_l
  ovs-vsctl set interface 1254e9f30fc05_l external_ids:container_id=55_L2_UNIV_staff_1 external_ids:container_iface=55-CERN
  ip link set 1254e9f30fc05_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_staff_1)
  create_netns_link
  ip link set 1254e9f30fc05_c netns $PID
  ip netns exec $PID ip link set dev 1254e9f30fc05_c name 55-CERN
  ip netns exec $PID ip link set 55-CERN up
  tc qdisc add dev 1254e9f30fc05_l root netem delay 1000 
  ovs-vsctl set interface 1254e9f30fc05_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_CERN" == $container_name ] || [ "55_L2_UNIV_staff_1" == $container_name ]; then
  echo "Link between 55_L2_UNIV_CERN (55-staff_1) and 55_L2_UNIV_staff_1 (55-CERN)"
  port_id1=`ovs-vsctl get Interface a3ca625814af5_l ofport`
  port_id2=`ovs-vsctl get Interface 1254e9f30fc05_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_ETHZ (55-student_2) on bridge "
  ip link add d04d8241b3895_l type veth peer name d04d8241b3895_c
  ovs-vsctl del-port l2-55 d04d8241b3895_l
  ovs-vsctl add-port l2-55 d04d8241b3895_l
  ovs-vsctl set interface d04d8241b3895_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=55-student_2
  ip link set d04d8241b3895_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_ETHZ)
  create_netns_link
  ip link set d04d8241b3895_c netns $PID
  ip netns exec $PID ip link set dev d04d8241b3895_c name 55-student_2
  ip netns exec $PID ip link set 55-student_2 up
  tc qdisc add dev d04d8241b3895_l root netem delay 1000 
  ovs-vsctl set interface d04d8241b3895_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_student_2" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_student_2 (55-ETHZ) on bridge "
  ip link add 6bfd8b698be75_l type veth peer name 6bfd8b698be75_c
  ovs-vsctl del-port l2-55 6bfd8b698be75_l
  ovs-vsctl add-port l2-55 6bfd8b698be75_l
  ovs-vsctl set interface 6bfd8b698be75_l external_ids:container_id=55_L2_UNIV_student_2 external_ids:container_iface=55-ETHZ
  ip link set 6bfd8b698be75_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_student_2)
  create_netns_link
  ip link set 6bfd8b698be75_c netns $PID
  ip netns exec $PID ip link set dev 6bfd8b698be75_c name 55-ETHZ
  ip netns exec $PID ip link set 55-ETHZ up
  tc qdisc add dev 6bfd8b698be75_l root netem delay 1000 
  ovs-vsctl set interface 6bfd8b698be75_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ] || [ "55_L2_UNIV_student_2" == $container_name ]; then
  echo "Link between 55_L2_UNIV_ETHZ (55-student_2) and 55_L2_UNIV_student_2 (55-ETHZ)"
  port_id1=`ovs-vsctl get Interface d04d8241b3895_l ofport`
  port_id2=`ovs-vsctl get Interface 6bfd8b698be75_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_ETHZ (55-staff_2) on bridge "
  ip link add c01e0645ac235_l type veth peer name c01e0645ac235_c
  ovs-vsctl del-port l2-55 c01e0645ac235_l
  ovs-vsctl add-port l2-55 c01e0645ac235_l
  ovs-vsctl set interface c01e0645ac235_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=55-staff_2
  ip link set c01e0645ac235_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_ETHZ)
  create_netns_link
  ip link set c01e0645ac235_c netns $PID
  ip netns exec $PID ip link set dev c01e0645ac235_c name 55-staff_2
  ip netns exec $PID ip link set 55-staff_2 up
  tc qdisc add dev c01e0645ac235_l root netem delay 1000 
  ovs-vsctl set interface c01e0645ac235_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_staff_2" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_staff_2 (55-ETHZ) on bridge "
  ip link add 2226ee9a9a0b5_l type veth peer name 2226ee9a9a0b5_c
  ovs-vsctl del-port l2-55 2226ee9a9a0b5_l
  ovs-vsctl add-port l2-55 2226ee9a9a0b5_l
  ovs-vsctl set interface 2226ee9a9a0b5_l external_ids:container_id=55_L2_UNIV_staff_2 external_ids:container_iface=55-ETHZ
  ip link set 2226ee9a9a0b5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_staff_2)
  create_netns_link
  ip link set 2226ee9a9a0b5_c netns $PID
  ip netns exec $PID ip link set dev 2226ee9a9a0b5_c name 55-ETHZ
  ip netns exec $PID ip link set 55-ETHZ up
  tc qdisc add dev 2226ee9a9a0b5_l root netem delay 1000 
  ovs-vsctl set interface 2226ee9a9a0b5_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ] || [ "55_L2_UNIV_staff_2" == $container_name ]; then
  echo "Link between 55_L2_UNIV_ETHZ (55-staff_2) and 55_L2_UNIV_staff_2 (55-ETHZ)"
  port_id1=`ovs-vsctl get Interface c01e0645ac235_l ofport`
  port_id2=`ovs-vsctl get Interface 2226ee9a9a0b5_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_L2_UNIV_EPFL" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_EPFL (55-student_3) on bridge "
  ip link add 469a7cec7dd15_l type veth peer name 469a7cec7dd15_c
  ovs-vsctl del-port l2-55 469a7cec7dd15_l
  ovs-vsctl add-port l2-55 469a7cec7dd15_l
  ovs-vsctl set interface 469a7cec7dd15_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=55-student_3
  ip link set 469a7cec7dd15_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_EPFL)
  create_netns_link
  ip link set 469a7cec7dd15_c netns $PID
  ip netns exec $PID ip link set dev 469a7cec7dd15_c name 55-student_3
  ip netns exec $PID ip link set 55-student_3 up
  tc qdisc add dev 469a7cec7dd15_l root netem delay 1000 
  ovs-vsctl set interface 469a7cec7dd15_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_student_3" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_student_3 (55-EPFL) on bridge "
  ip link add 72ceb5902f935_l type veth peer name 72ceb5902f935_c
  ovs-vsctl del-port l2-55 72ceb5902f935_l
  ovs-vsctl add-port l2-55 72ceb5902f935_l
  ovs-vsctl set interface 72ceb5902f935_l external_ids:container_id=55_L2_UNIV_student_3 external_ids:container_iface=55-EPFL
  ip link set 72ceb5902f935_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_student_3)
  create_netns_link
  ip link set 72ceb5902f935_c netns $PID
  ip netns exec $PID ip link set dev 72ceb5902f935_c name 55-EPFL
  ip netns exec $PID ip link set 55-EPFL up
  tc qdisc add dev 72ceb5902f935_l root netem delay 1000 
  ovs-vsctl set interface 72ceb5902f935_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_EPFL" == $container_name ] || [ "55_L2_UNIV_student_3" == $container_name ]; then
  echo "Link between 55_L2_UNIV_EPFL (55-student_3) and 55_L2_UNIV_student_3 (55-EPFL)"
  port_id1=`ovs-vsctl get Interface 469a7cec7dd15_l ofport`
  port_id2=`ovs-vsctl get Interface 72ceb5902f935_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_L2_UNIV_EPFL" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_EPFL (55-staff_3) on bridge "
  ip link add 4351d5b11d8f5_l type veth peer name 4351d5b11d8f5_c
  ovs-vsctl del-port l2-55 4351d5b11d8f5_l
  ovs-vsctl add-port l2-55 4351d5b11d8f5_l
  ovs-vsctl set interface 4351d5b11d8f5_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=55-staff_3
  ip link set 4351d5b11d8f5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_EPFL)
  create_netns_link
  ip link set 4351d5b11d8f5_c netns $PID
  ip netns exec $PID ip link set dev 4351d5b11d8f5_c name 55-staff_3
  ip netns exec $PID ip link set 55-staff_3 up
  tc qdisc add dev 4351d5b11d8f5_l root netem delay 1000 
  ovs-vsctl set interface 4351d5b11d8f5_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_staff_3" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_staff_3 (55-EPFL) on bridge "
  ip link add 927fa039cc0e5_l type veth peer name 927fa039cc0e5_c
  ovs-vsctl del-port l2-55 927fa039cc0e5_l
  ovs-vsctl add-port l2-55 927fa039cc0e5_l
  ovs-vsctl set interface 927fa039cc0e5_l external_ids:container_id=55_L2_UNIV_staff_3 external_ids:container_iface=55-EPFL
  ip link set 927fa039cc0e5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_staff_3)
  create_netns_link
  ip link set 927fa039cc0e5_c netns $PID
  ip netns exec $PID ip link set dev 927fa039cc0e5_c name 55-EPFL
  ip netns exec $PID ip link set 55-EPFL up
  tc qdisc add dev 927fa039cc0e5_l root netem delay 1000 
  ovs-vsctl set interface 927fa039cc0e5_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_EPFL" == $container_name ] || [ "55_L2_UNIV_staff_3" == $container_name ]; then
  echo "Link between 55_L2_UNIV_EPFL (55-staff_3) and 55_L2_UNIV_staff_3 (55-EPFL)"
  port_id1=`ovs-vsctl get Interface 4351d5b11d8f5_l ofport`
  port_id2=`ovs-vsctl get Interface 927fa039cc0e5_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_ZURIrouter" == $container_name ]; then
  echo "Create Link for 55_ZURIrouter (ZURI-L2) on bridge "
  ip link add 0ae3065de5ad5_l type veth peer name 0ae3065de5ad5_c
  ovs-vsctl del-port l2-55 0ae3065de5ad5_l
  ovs-vsctl add-port l2-55 0ae3065de5ad5_l
  ovs-vsctl set interface 0ae3065de5ad5_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=ZURI-L2
  ip link set 0ae3065de5ad5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ZURIrouter)
  create_netns_link
  ip link set 0ae3065de5ad5_c netns $PID
  ip netns exec $PID ip link set dev 0ae3065de5ad5_c name ZURI-L2
  ip netns exec $PID ip link set ZURI-L2 up
  ovs-vsctl set interface 0ae3065de5ad5_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_ETHZ (ZURIrouter) on bridge "
  ip link add 11ed003cfc5a5_l type veth peer name 11ed003cfc5a5_c
  ovs-vsctl del-port l2-55 11ed003cfc5a5_l
  ovs-vsctl add-port l2-55 11ed003cfc5a5_l
  ovs-vsctl set interface 11ed003cfc5a5_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=ZURIrouter
  ip link set 11ed003cfc5a5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_ETHZ)
  create_netns_link
  ip link set 11ed003cfc5a5_c netns $PID
  ip netns exec $PID ip link set dev 11ed003cfc5a5_c name ZURIrouter
  ip netns exec $PID ip link set ZURIrouter up
  ovs-vsctl set interface 11ed003cfc5a5_l ingress_policing_rate=10000
fi
if [ "55_ZURIrouter" == $container_name ] || [ "55_L2_UNIV_ETHZ" == $container_name ]; then
  echo "Link between 55_ZURIrouter (ZURI-L2) and 55_L2_UNIV_ETHZ (ZURIrouter)"
  port_id1=`ovs-vsctl get Interface 0ae3065de5ad5_l ofport`
  port_id2=`ovs-vsctl get Interface 11ed003cfc5a5_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_GENErouter" == $container_name ]; then
  echo "Create Link for 55_GENErouter (GENE-L2) on bridge "
  ip link add 309b94a931805_l type veth peer name 309b94a931805_c
  ovs-vsctl del-port l2-55 309b94a931805_l
  ovs-vsctl add-port l2-55 309b94a931805_l
  ovs-vsctl set interface 309b94a931805_l external_ids:container_id=55_GENErouter external_ids:container_iface=GENE-L2
  ip link set 309b94a931805_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_GENErouter)
  create_netns_link
  ip link set 309b94a931805_c netns $PID
  ip netns exec $PID ip link set dev 309b94a931805_c name GENE-L2
  ip netns exec $PID ip link set GENE-L2 up
  ovs-vsctl set interface 309b94a931805_l ingress_policing_rate=10000
fi
if [ "55_L2_UNIV_CERN" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_CERN (GENErouter) on bridge "
  ip link add 707b0abb02aa5_l type veth peer name 707b0abb02aa5_c
  ovs-vsctl del-port l2-55 707b0abb02aa5_l
  ovs-vsctl add-port l2-55 707b0abb02aa5_l
  ovs-vsctl set interface 707b0abb02aa5_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=GENErouter
  ip link set 707b0abb02aa5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_CERN)
  create_netns_link
  ip link set 707b0abb02aa5_c netns $PID
  ip netns exec $PID ip link set dev 707b0abb02aa5_c name GENErouter
  ip netns exec $PID ip link set GENErouter up
  ovs-vsctl set interface 707b0abb02aa5_l ingress_policing_rate=10000
fi
if [ "55_GENErouter" == $container_name ] || [ "55_L2_UNIV_CERN" == $container_name ]; then
  echo "Link between 55_GENErouter (GENE-L2) and 55_L2_UNIV_CERN (GENErouter)"
  port_id1=`ovs-vsctl get Interface 309b94a931805_l ofport`
  port_id2=`ovs-vsctl get Interface 707b0abb02aa5_l ofport`
  ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_ZURIrouter" == $container_name ]; then
  echo "Create Link for 55_ZURIrouter (port_PARI) on bridge "
  ip link add 8fdda6b3ce365_l type veth peer name 8fdda6b3ce365_c
  ovs-vsctl del-port int-55 8fdda6b3ce365_l
  ovs-vsctl add-port int-55 8fdda6b3ce365_l
  ovs-vsctl set interface 8fdda6b3ce365_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=port_PARI
  ip link set 8fdda6b3ce365_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ZURIrouter)
  create_netns_link
  ip link set 8fdda6b3ce365_c netns $PID
  ip netns exec $PID ip link set dev 8fdda6b3ce365_c name port_PARI
  ip netns exec $PID ip link set port_PARI up
  tc qdisc add dev 8fdda6b3ce365_l root netem delay 100 
  ovs-vsctl set interface 8fdda6b3ce365_l ingress_policing_rate=100000
fi
if [ "55_PARIrouter" == $container_name ]; then
  echo "Create Link for 55_PARIrouter (port_ZURI) on bridge "
  ip link add 3a693008f5f85_l type veth peer name 3a693008f5f85_c
  ovs-vsctl del-port int-55 3a693008f5f85_l
  ovs-vsctl add-port int-55 3a693008f5f85_l
  ovs-vsctl set interface 3a693008f5f85_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_ZURI
  ip link set 3a693008f5f85_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIrouter)
  create_netns_link
  ip link set 3a693008f5f85_c netns $PID
  ip netns exec $PID ip link set dev 3a693008f5f85_c name port_ZURI
  ip netns exec $PID ip link set port_ZURI up
  tc qdisc add dev 3a693008f5f85_l root netem delay 100 
  ovs-vsctl set interface 3a693008f5f85_l ingress_policing_rate=100000
fi
if [ "55_ZURIrouter" == $container_name ] || [ "55_PARIrouter" == $container_name ]; then
  echo "Link between 55_ZURIrouter (port_PARI) and 55_PARIrouter (port_ZURI)"
  port_id1=`ovs-vsctl get Interface 8fdda6b3ce365_l ofport`
  port_id2=`ovs-vsctl get Interface 3a693008f5f85_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_ZURIrouter" == $container_name ]; then
  echo "Create Link for 55_ZURIrouter (port_LOND) on bridge "
  ip link add 9659af376ea95_l type veth peer name 9659af376ea95_c
  ovs-vsctl del-port int-55 9659af376ea95_l
  ovs-vsctl add-port int-55 9659af376ea95_l
  ovs-vsctl set interface 9659af376ea95_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=port_LOND
  ip link set 9659af376ea95_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ZURIrouter)
  create_netns_link
  ip link set 9659af376ea95_c netns $PID
  ip netns exec $PID ip link set dev 9659af376ea95_c name port_LOND
  ip netns exec $PID ip link set port_LOND up
  tc qdisc add dev 9659af376ea95_l root netem delay 1000 
  ovs-vsctl set interface 9659af376ea95_l ingress_policing_rate=100000
fi
if [ "55_LONDrouter" == $container_name ]; then
  echo "Create Link for 55_LONDrouter (port_ZURI) on bridge "
  ip link add 35c07aa7dddc5_l type veth peer name 35c07aa7dddc5_c
  ovs-vsctl del-port int-55 35c07aa7dddc5_l
  ovs-vsctl add-port int-55 35c07aa7dddc5_l
  ovs-vsctl set interface 35c07aa7dddc5_l external_ids:container_id=55_LONDrouter external_ids:container_iface=port_ZURI
  ip link set 35c07aa7dddc5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_LONDrouter)
  create_netns_link
  ip link set 35c07aa7dddc5_c netns $PID
  ip netns exec $PID ip link set dev 35c07aa7dddc5_c name port_ZURI
  ip netns exec $PID ip link set port_ZURI up
  tc qdisc add dev 35c07aa7dddc5_l root netem delay 1000 
  ovs-vsctl set interface 35c07aa7dddc5_l ingress_policing_rate=100000
fi
if [ "55_ZURIrouter" == $container_name ] || [ "55_LONDrouter" == $container_name ]; then
  echo "Link between 55_ZURIrouter (port_LOND) and 55_LONDrouter (port_ZURI)"
  port_id1=`ovs-vsctl get Interface 9659af376ea95_l ofport`
  port_id2=`ovs-vsctl get Interface 35c07aa7dddc5_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_PARIrouter" == $container_name ]; then
  echo "Create Link for 55_PARIrouter (port_GENE) on bridge "
  ip link add 37545494627b5_l type veth peer name 37545494627b5_c
  ovs-vsctl del-port int-55 37545494627b5_l
  ovs-vsctl add-port int-55 37545494627b5_l
  ovs-vsctl set interface 37545494627b5_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_GENE
  ip link set 37545494627b5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIrouter)
  create_netns_link
  ip link set 37545494627b5_c netns $PID
  ip netns exec $PID ip link set dev 37545494627b5_c name port_GENE
  ip netns exec $PID ip link set port_GENE up
  tc qdisc add dev 37545494627b5_l root netem delay 20 
  ovs-vsctl set interface 37545494627b5_l ingress_policing_rate=100000
fi
if [ "55_GENErouter" == $container_name ]; then
  echo "Create Link for 55_GENErouter (port_PARI) on bridge "
  ip link add 47353ab69a675_l type veth peer name 47353ab69a675_c
  ovs-vsctl del-port int-55 47353ab69a675_l
  ovs-vsctl add-port int-55 47353ab69a675_l
  ovs-vsctl set interface 47353ab69a675_l external_ids:container_id=55_GENErouter external_ids:container_iface=port_PARI
  ip link set 47353ab69a675_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_GENErouter)
  create_netns_link
  ip link set 47353ab69a675_c netns $PID
  ip netns exec $PID ip link set dev 47353ab69a675_c name port_PARI
  ip netns exec $PID ip link set port_PARI up
  tc qdisc add dev 47353ab69a675_l root netem delay 20 
  ovs-vsctl set interface 47353ab69a675_l ingress_policing_rate=100000
fi
if [ "55_PARIrouter" == $container_name ] || [ "55_GENErouter" == $container_name ]; then
  echo "Link between 55_PARIrouter (port_GENE) and 55_GENErouter (port_PARI)"
  port_id1=`ovs-vsctl get Interface 37545494627b5_l ofport`
  port_id2=`ovs-vsctl get Interface 47353ab69a675_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_PARIrouter" == $container_name ]; then
  echo "Create Link for 55_PARIrouter (port_LOND) on bridge "
  ip link add eeeb0f88d4055_l type veth peer name eeeb0f88d4055_c
  ovs-vsctl del-port int-55 eeeb0f88d4055_l
  ovs-vsctl add-port int-55 eeeb0f88d4055_l
  ovs-vsctl set interface eeeb0f88d4055_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_LOND
  ip link set eeeb0f88d4055_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIrouter)
  create_netns_link
  ip link set eeeb0f88d4055_c netns $PID
  ip netns exec $PID ip link set dev eeeb0f88d4055_c name port_LOND
  ip netns exec $PID ip link set port_LOND up
  tc qdisc add dev eeeb0f88d4055_l root netem delay 20 
  ovs-vsctl set interface eeeb0f88d4055_l ingress_policing_rate=100000
fi
if [ "55_LONDrouter" == $container_name ]; then
  echo "Create Link for 55_LONDrouter (port_PARI) on bridge "
  ip link add 4f7cbc6703a75_l type veth peer name 4f7cbc6703a75_c
  ovs-vsctl del-port int-55 4f7cbc6703a75_l
  ovs-vsctl add-port int-55 4f7cbc6703a75_l
  ovs-vsctl set interface 4f7cbc6703a75_l external_ids:container_id=55_LONDrouter external_ids:container_iface=port_PARI
  ip link set 4f7cbc6703a75_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_LONDrouter)
  create_netns_link
  ip link set 4f7cbc6703a75_c netns $PID
  ip netns exec $PID ip link set dev 4f7cbc6703a75_c name port_PARI
  ip netns exec $PID ip link set port_PARI up
  tc qdisc add dev 4f7cbc6703a75_l root netem delay 20 
  ovs-vsctl set interface 4f7cbc6703a75_l ingress_policing_rate=100000
fi
if [ "55_PARIrouter" == $container_name ] || [ "55_LONDrouter" == $container_name ]; then
  echo "Link between 55_PARIrouter (port_LOND) and 55_LONDrouter (port_PARI)"
  port_id1=`ovs-vsctl get Interface eeeb0f88d4055_l ofport`
  port_id2=`ovs-vsctl get Interface 4f7cbc6703a75_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_PARIrouter" == $container_name ]; then
  echo "Create Link for 55_PARIrouter (port_NEWY) on bridge "
  ip link add 2de634cec6275_l type veth peer name 2de634cec6275_c
  ovs-vsctl del-port int-55 2de634cec6275_l
  ovs-vsctl add-port int-55 2de634cec6275_l
  ovs-vsctl set interface 2de634cec6275_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_NEWY
  ip link set 2de634cec6275_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIrouter)
  create_netns_link
  ip link set 2de634cec6275_c netns $PID
  ip netns exec $PID ip link set dev 2de634cec6275_c name port_NEWY
  ip netns exec $PID ip link set port_NEWY up
  tc qdisc add dev 2de634cec6275_l root netem delay 1000 
  ovs-vsctl set interface 2de634cec6275_l ingress_policing_rate=10000
fi
if [ "55_NEWYrouter" == $container_name ]; then
  echo "Create Link for 55_NEWYrouter (port_PARI) on bridge "
  ip link add 89fc122ec6775_l type veth peer name 89fc122ec6775_c
  ovs-vsctl del-port int-55 89fc122ec6775_l
  ovs-vsctl add-port int-55 89fc122ec6775_l
  ovs-vsctl set interface 89fc122ec6775_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_PARI
  ip link set 89fc122ec6775_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_NEWYrouter)
  create_netns_link
  ip link set 89fc122ec6775_c netns $PID
  ip netns exec $PID ip link set dev 89fc122ec6775_c name port_PARI
  ip netns exec $PID ip link set port_PARI up
  tc qdisc add dev 89fc122ec6775_l root netem delay 1000 
  ovs-vsctl set interface 89fc122ec6775_l ingress_policing_rate=10000
fi
if [ "55_PARIrouter" == $container_name ] || [ "55_NEWYrouter" == $container_name ]; then
  echo "Link between 55_PARIrouter (port_NEWY) and 55_NEWYrouter (port_PARI)"
  port_id1=`ovs-vsctl get Interface 2de634cec6275_l ofport`
  port_id2=`ovs-vsctl get Interface 89fc122ec6775_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_PARIrouter" == $container_name ]; then
  echo "Create Link for 55_PARIrouter (port_MIAM) on bridge "
  ip link add 1038230c7dd25_l type veth peer name 1038230c7dd25_c
  ovs-vsctl del-port int-55 1038230c7dd25_l
  ovs-vsctl add-port int-55 1038230c7dd25_l
  ovs-vsctl set interface 1038230c7dd25_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_MIAM
  ip link set 1038230c7dd25_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIrouter)
  create_netns_link
  ip link set 1038230c7dd25_c netns $PID
  ip netns exec $PID ip link set dev 1038230c7dd25_c name port_MIAM
  ip netns exec $PID ip link set port_MIAM up
  tc qdisc add dev 1038230c7dd25_l root netem delay 50 
  ovs-vsctl set interface 1038230c7dd25_l ingress_policing_rate=1000
fi
if [ "55_MIAMrouter" == $container_name ]; then
  echo "Create Link for 55_MIAMrouter (port_PARI) on bridge "
  ip link add 72b97822858a5_l type veth peer name 72b97822858a5_c
  ovs-vsctl del-port int-55 72b97822858a5_l
  ovs-vsctl add-port int-55 72b97822858a5_l
  ovs-vsctl set interface 72b97822858a5_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=port_PARI
  ip link set 72b97822858a5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_MIAMrouter)
  create_netns_link
  ip link set 72b97822858a5_c netns $PID
  ip netns exec $PID ip link set dev 72b97822858a5_c name port_PARI
  ip netns exec $PID ip link set port_PARI up
  tc qdisc add dev 72b97822858a5_l root netem delay 50 
  ovs-vsctl set interface 72b97822858a5_l ingress_policing_rate=1000
fi
if [ "55_PARIrouter" == $container_name ] || [ "55_MIAMrouter" == $container_name ]; then
  echo "Link between 55_PARIrouter (port_MIAM) and 55_MIAMrouter (port_PARI)"
  port_id1=`ovs-vsctl get Interface 1038230c7dd25_l ofport`
  port_id2=`ovs-vsctl get Interface 72b97822858a5_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_LONDrouter" == $container_name ]; then
  echo "Create Link for 55_LONDrouter (port_BOST) on bridge "
  ip link add bd54c93f27555_l type veth peer name bd54c93f27555_c
  ovs-vsctl del-port int-55 bd54c93f27555_l
  ovs-vsctl add-port int-55 bd54c93f27555_l
  ovs-vsctl set interface bd54c93f27555_l external_ids:container_id=55_LONDrouter external_ids:container_iface=port_BOST
  ip link set bd54c93f27555_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_LONDrouter)
  create_netns_link
  ip link set bd54c93f27555_c netns $PID
  ip netns exec $PID ip link set dev bd54c93f27555_c name port_BOST
  ip netns exec $PID ip link set port_BOST up
  tc qdisc add dev bd54c93f27555_l root netem delay 10000 
  ovs-vsctl set interface bd54c93f27555_l ingress_policing_rate=100000
fi
if [ "55_BOSTrouter" == $container_name ]; then
  echo "Create Link for 55_BOSTrouter (port_LOND) on bridge "
  ip link add 279d512f3fdd5_l type veth peer name 279d512f3fdd5_c
  ovs-vsctl del-port int-55 279d512f3fdd5_l
  ovs-vsctl add-port int-55 279d512f3fdd5_l
  ovs-vsctl set interface 279d512f3fdd5_l external_ids:container_id=55_BOSTrouter external_ids:container_iface=port_LOND
  ip link set 279d512f3fdd5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_BOSTrouter)
  create_netns_link
  ip link set 279d512f3fdd5_c netns $PID
  ip netns exec $PID ip link set dev 279d512f3fdd5_c name port_LOND
  ip netns exec $PID ip link set port_LOND up
  tc qdisc add dev 279d512f3fdd5_l root netem delay 10000 
  ovs-vsctl set interface 279d512f3fdd5_l ingress_policing_rate=100000
fi
if [ "55_LONDrouter" == $container_name ] || [ "55_BOSTrouter" == $container_name ]; then
  echo "Link between 55_LONDrouter (port_BOST) and 55_BOSTrouter (port_LOND)"
  port_id1=`ovs-vsctl get Interface bd54c93f27555_l ofport`
  port_id2=`ovs-vsctl get Interface 279d512f3fdd5_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_LONDrouter" == $container_name ]; then
  echo "Create Link for 55_LONDrouter (port_NEWY) on bridge "
  ip link add e30fd3f89d1f5_l type veth peer name e30fd3f89d1f5_c
  ovs-vsctl del-port int-55 e30fd3f89d1f5_l
  ovs-vsctl add-port int-55 e30fd3f89d1f5_l
  ovs-vsctl set interface e30fd3f89d1f5_l external_ids:container_id=55_LONDrouter external_ids:container_iface=port_NEWY
  ip link set e30fd3f89d1f5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_LONDrouter)
  create_netns_link
  ip link set e30fd3f89d1f5_c netns $PID
  ip netns exec $PID ip link set dev e30fd3f89d1f5_c name port_NEWY
  ip netns exec $PID ip link set port_NEWY up
  tc qdisc add dev e30fd3f89d1f5_l root netem delay 100 
  ovs-vsctl set interface e30fd3f89d1f5_l ingress_policing_rate=10000
fi
if [ "55_NEWYrouter" == $container_name ]; then
  echo "Create Link for 55_NEWYrouter (port_LOND) on bridge "
  ip link add 1182ac91595a5_l type veth peer name 1182ac91595a5_c
  ovs-vsctl del-port int-55 1182ac91595a5_l
  ovs-vsctl add-port int-55 1182ac91595a5_l
  ovs-vsctl set interface 1182ac91595a5_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_LOND
  ip link set 1182ac91595a5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_NEWYrouter)
  create_netns_link
  ip link set 1182ac91595a5_c netns $PID
  ip netns exec $PID ip link set dev 1182ac91595a5_c name port_LOND
  ip netns exec $PID ip link set port_LOND up
  tc qdisc add dev 1182ac91595a5_l root netem delay 100 
  ovs-vsctl set interface 1182ac91595a5_l ingress_policing_rate=10000
fi
if [ "55_LONDrouter" == $container_name ] || [ "55_NEWYrouter" == $container_name ]; then
  echo "Link between 55_LONDrouter (port_NEWY) and 55_NEWYrouter (port_LOND)"
  port_id1=`ovs-vsctl get Interface e30fd3f89d1f5_l ofport`
  port_id2=`ovs-vsctl get Interface 1182ac91595a5_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_GENErouter" == $container_name ]; then
  echo "Create Link for 55_GENErouter (port_MIAM) on bridge "
  ip link add 900701b7a49b5_l type veth peer name 900701b7a49b5_c
  ovs-vsctl del-port int-55 900701b7a49b5_l
  ovs-vsctl add-port int-55 900701b7a49b5_l
  ovs-vsctl set interface 900701b7a49b5_l external_ids:container_id=55_GENErouter external_ids:container_iface=port_MIAM
  ip link set 900701b7a49b5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_GENErouter)
  create_netns_link
  ip link set 900701b7a49b5_c netns $PID
  ip netns exec $PID ip link set dev 900701b7a49b5_c name port_MIAM
  ip netns exec $PID ip link set port_MIAM up
  tc qdisc add dev 900701b7a49b5_l root netem delay 100 
  ovs-vsctl set interface 900701b7a49b5_l ingress_policing_rate=100000
fi
if [ "55_MIAMrouter" == $container_name ]; then
  echo "Create Link for 55_MIAMrouter (port_GENE) on bridge "
  ip link add 53c813eeae785_l type veth peer name 53c813eeae785_c
  ovs-vsctl del-port int-55 53c813eeae785_l
  ovs-vsctl add-port int-55 53c813eeae785_l
  ovs-vsctl set interface 53c813eeae785_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=port_GENE
  ip link set 53c813eeae785_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_MIAMrouter)
  create_netns_link
  ip link set 53c813eeae785_c netns $PID
  ip netns exec $PID ip link set dev 53c813eeae785_c name port_GENE
  ip netns exec $PID ip link set port_GENE up
  tc qdisc add dev 53c813eeae785_l root netem delay 100 
  ovs-vsctl set interface 53c813eeae785_l ingress_policing_rate=100000
fi
if [ "55_GENErouter" == $container_name ] || [ "55_MIAMrouter" == $container_name ]; then
  echo "Link between 55_GENErouter (port_MIAM) and 55_MIAMrouter (port_GENE)"
  port_id1=`ovs-vsctl get Interface 900701b7a49b5_l ofport`
  port_id2=`ovs-vsctl get Interface 53c813eeae785_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_NEWYrouter" == $container_name ]; then
  echo "Create Link for 55_NEWYrouter (port_BOST) on bridge "
  ip link add c5c4518768025_l type veth peer name c5c4518768025_c
  ovs-vsctl del-port int-55 c5c4518768025_l
  ovs-vsctl add-port int-55 c5c4518768025_l
  ovs-vsctl set interface c5c4518768025_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_BOST
  ip link set c5c4518768025_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_NEWYrouter)
  create_netns_link
  ip link set c5c4518768025_c netns $PID
  ip netns exec $PID ip link set dev c5c4518768025_c name port_BOST
  ip netns exec $PID ip link set port_BOST up
  tc qdisc add dev c5c4518768025_l root netem delay 10 
  ovs-vsctl set interface c5c4518768025_l ingress_policing_rate=100000
fi
if [ "55_BOSTrouter" == $container_name ]; then
  echo "Create Link for 55_BOSTrouter (port_NEWY) on bridge "
  ip link add f24c9fc80b575_l type veth peer name f24c9fc80b575_c
  ovs-vsctl del-port int-55 f24c9fc80b575_l
  ovs-vsctl add-port int-55 f24c9fc80b575_l
  ovs-vsctl set interface f24c9fc80b575_l external_ids:container_id=55_BOSTrouter external_ids:container_iface=port_NEWY
  ip link set f24c9fc80b575_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_BOSTrouter)
  create_netns_link
  ip link set f24c9fc80b575_c netns $PID
  ip netns exec $PID ip link set dev f24c9fc80b575_c name port_NEWY
  ip netns exec $PID ip link set port_NEWY up
  tc qdisc add dev f24c9fc80b575_l root netem delay 10 
  ovs-vsctl set interface f24c9fc80b575_l ingress_policing_rate=100000
fi
if [ "55_NEWYrouter" == $container_name ] || [ "55_BOSTrouter" == $container_name ]; then
  echo "Link between 55_NEWYrouter (port_BOST) and 55_BOSTrouter (port_NEWY)"
  port_id1=`ovs-vsctl get Interface c5c4518768025_l ofport`
  port_id2=`ovs-vsctl get Interface f24c9fc80b575_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_NEWYrouter" == $container_name ]; then
  echo "Create Link for 55_NEWYrouter (port_ATLA) on bridge "
  ip link add 5c44a41059a45_l type veth peer name 5c44a41059a45_c
  ovs-vsctl del-port int-55 5c44a41059a45_l
  ovs-vsctl add-port int-55 5c44a41059a45_l
  ovs-vsctl set interface 5c44a41059a45_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_ATLA
  ip link set 5c44a41059a45_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_NEWYrouter)
  create_netns_link
  ip link set 5c44a41059a45_c netns $PID
  ip netns exec $PID ip link set dev 5c44a41059a45_c name port_ATLA
  ip netns exec $PID ip link set port_ATLA up
  tc qdisc add dev 5c44a41059a45_l root netem delay 100 
  ovs-vsctl set interface 5c44a41059a45_l ingress_policing_rate=100000
fi
if [ "55_ATLArouter" == $container_name ]; then
  echo "Create Link for 55_ATLArouter (port_NEWY) on bridge "
  ip link add d0d77a4ab0bc5_l type veth peer name d0d77a4ab0bc5_c
  ovs-vsctl del-port int-55 d0d77a4ab0bc5_l
  ovs-vsctl add-port int-55 d0d77a4ab0bc5_l
  ovs-vsctl set interface d0d77a4ab0bc5_l external_ids:container_id=55_ATLArouter external_ids:container_iface=port_NEWY
  ip link set d0d77a4ab0bc5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ATLArouter)
  create_netns_link
  ip link set d0d77a4ab0bc5_c netns $PID
  ip netns exec $PID ip link set dev d0d77a4ab0bc5_c name port_NEWY
  ip netns exec $PID ip link set port_NEWY up
  tc qdisc add dev d0d77a4ab0bc5_l root netem delay 100 
  ovs-vsctl set interface d0d77a4ab0bc5_l ingress_policing_rate=100000
fi
if [ "55_NEWYrouter" == $container_name ] || [ "55_ATLArouter" == $container_name ]; then
  echo "Link between 55_NEWYrouter (port_ATLA) and 55_ATLArouter (port_NEWY)"
  port_id1=`ovs-vsctl get Interface 5c44a41059a45_l ofport`
  port_id2=`ovs-vsctl get Interface d0d77a4ab0bc5_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_NEWYrouter" == $container_name ]; then
  echo "Create Link for 55_NEWYrouter (port_MIAM) on bridge "
  ip link add c782691b4d6d5_l type veth peer name c782691b4d6d5_c
  ovs-vsctl del-port int-55 c782691b4d6d5_l
  ovs-vsctl add-port int-55 c782691b4d6d5_l
  ovs-vsctl set interface c782691b4d6d5_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_MIAM
  ip link set c782691b4d6d5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_NEWYrouter)
  create_netns_link
  ip link set c782691b4d6d5_c netns $PID
  ip netns exec $PID ip link set dev c782691b4d6d5_c name port_MIAM
  ip netns exec $PID ip link set port_MIAM up
  tc qdisc add dev c782691b4d6d5_l root netem delay 10 
  ovs-vsctl set interface c782691b4d6d5_l ingress_policing_rate=100000
fi
if [ "55_MIAMrouter" == $container_name ]; then
  echo "Create Link for 55_MIAMrouter (port_NEWY) on bridge "
  ip link add ac678dff1e655_l type veth peer name ac678dff1e655_c
  ovs-vsctl del-port int-55 ac678dff1e655_l
  ovs-vsctl add-port int-55 ac678dff1e655_l
  ovs-vsctl set interface ac678dff1e655_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=port_NEWY
  ip link set ac678dff1e655_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_MIAMrouter)
  create_netns_link
  ip link set ac678dff1e655_c netns $PID
  ip netns exec $PID ip link set dev ac678dff1e655_c name port_NEWY
  ip netns exec $PID ip link set port_NEWY up
  tc qdisc add dev ac678dff1e655_l root netem delay 10 
  ovs-vsctl set interface ac678dff1e655_l ingress_policing_rate=100000
fi
if [ "55_NEWYrouter" == $container_name ] || [ "55_MIAMrouter" == $container_name ]; then
  echo "Link between 55_NEWYrouter (port_MIAM) and 55_MIAMrouter (port_NEWY)"
  port_id1=`ovs-vsctl get Interface c782691b4d6d5_l ofport`
  port_id2=`ovs-vsctl get Interface ac678dff1e655_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_ATLArouter" == $container_name ]; then
  echo "Create Link for 55_ATLArouter (port_MIAM) on bridge "
  ip link add d316d67398895_l type veth peer name d316d67398895_c
  ovs-vsctl del-port int-55 d316d67398895_l
  ovs-vsctl add-port int-55 d316d67398895_l
  ovs-vsctl set interface d316d67398895_l external_ids:container_id=55_ATLArouter external_ids:container_iface=port_MIAM
  ip link set d316d67398895_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ATLArouter)
  create_netns_link
  ip link set d316d67398895_c netns $PID
  ip netns exec $PID ip link set dev d316d67398895_c name port_MIAM
  ip netns exec $PID ip link set port_MIAM up
  tc qdisc add dev d316d67398895_l root netem delay 100 
  ovs-vsctl set interface d316d67398895_l ingress_policing_rate=100000
fi
if [ "55_MIAMrouter" == $container_name ]; then
  echo "Create Link for 55_MIAMrouter (port_ATLA) on bridge "
  ip link add 7adfed1c16df5_l type veth peer name 7adfed1c16df5_c
  ovs-vsctl del-port int-55 7adfed1c16df5_l
  ovs-vsctl add-port int-55 7adfed1c16df5_l
  ovs-vsctl set interface 7adfed1c16df5_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=port_ATLA
  ip link set 7adfed1c16df5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_MIAMrouter)
  create_netns_link
  ip link set 7adfed1c16df5_c netns $PID
  ip netns exec $PID ip link set dev 7adfed1c16df5_c name port_ATLA
  ip netns exec $PID ip link set port_ATLA up
  tc qdisc add dev 7adfed1c16df5_l root netem delay 100 
  ovs-vsctl set interface 7adfed1c16df5_l ingress_policing_rate=100000
fi
if [ "55_ATLArouter" == $container_name ] || [ "55_MIAMrouter" == $container_name ]; then
  echo "Link between 55_ATLArouter (port_MIAM) and 55_MIAMrouter (port_ATLA)"
  port_id1=`ovs-vsctl get Interface d316d67398895_l ofport`
  port_id2=`ovs-vsctl get Interface 7adfed1c16df5_l ofport`
  ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
fi
if [ "MEASUREMENT" == $container_name ]; then
  echo "Create Link for MEASUREMENT (ssh_in) on bridge "
  ip link add cce5f40b9a135_l type veth peer name cce5f40b9a135_c
  ovs-vsctl del-port ssh_to_group cce5f40b9a135_l
  ovs-vsctl add-port ssh_to_group cce5f40b9a135_l
  ovs-vsctl set interface cce5f40b9a135_l external_ids:container_id=MEASUREMENT external_ids:container_iface=ssh_in
  ip link set cce5f40b9a135_l up
  PID=$(docker inspect -f '{{.State.Pid}}' MEASUREMENT)
  create_netns_link
  ip link set cce5f40b9a135_c netns $PID
  ip netns exec $PID ip link set dev cce5f40b9a135_c name ssh_in
  ip netns exec $PID ip link set ssh_in up
  ip netns exec $PID ip addr add 157.0.0.250/24 dev ssh_in
fi
if [ "MEASUREMENT" == $container_name ]; then
  echo "Create Link for MEASUREMENT (group_55) on bridge "
  ip link add 12dc3828879f5_l type veth peer name 12dc3828879f5_c
  ovs-vsctl del-port measurement 12dc3828879f5_l
  ovs-vsctl add-port measurement 12dc3828879f5_l
  ovs-vsctl set interface 12dc3828879f5_l external_ids:container_id=MEASUREMENT external_ids:container_iface=group_55
  ip link set 12dc3828879f5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' MEASUREMENT)
  create_netns_link
  ip link set 12dc3828879f5_c netns $PID
  ip netns exec $PID ip link set dev 12dc3828879f5_c name group_55
  ip netns exec $PID ip link set group_55 up
  ip netns exec $PID ip addr add 55.0.199.2/24 dev group_55
fi
if [ "55_ZURIrouter" == $container_name ]; then
  echo "Create Link for 55_ZURIrouter (measurement_55) on bridge "
  ip link add fa08705c29255_l type veth peer name fa08705c29255_c
  ovs-vsctl del-port measurement fa08705c29255_l
  ovs-vsctl add-port measurement fa08705c29255_l
  ovs-vsctl set interface fa08705c29255_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=measurement_55
  ip link set fa08705c29255_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ZURIrouter)
  create_netns_link
  ip link set fa08705c29255_c netns $PID
  ip netns exec $PID ip link set dev fa08705c29255_c name measurement_55
  ip netns exec $PID ip link set measurement_55 up
  ip netns exec $PID ip addr add 55.0.199.1/24 dev measurement_55
  ip netns exec 2682520 ip link set dev measurement_55 address aa:22:22:22:00:55
fi
if [ "MEASUREMENT" == $container_name ] || [ "55_ZURIrouter" == $container_name ]; then
  echo "Link between MEASUREMENT (group_55) and 55_ZURIrouter (measurement_55)"
  port_id1=`ovs-vsctl get Interface 12dc3828879f5_l ofport`
  port_id2=`ovs-vsctl get Interface fa08705c29255_l ofport`
  ovs-ofctl add-flow measurement in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow measurement in_port=$port_id2,actions=output:$port_id1
fi
if [ "55_ssh" == $container_name ]; then
  echo "Create Link for 55_ssh (ssh) on bridge "
  ip link add 62b34772fe115_l type veth peer name 62b34772fe115_c
  ovs-vsctl del-port 55-ssh 62b34772fe115_l
  ovs-vsctl add-port 55-ssh 62b34772fe115_l
  ovs-vsctl set interface 62b34772fe115_l external_ids:container_id=55_ssh external_ids:container_iface=ssh
  ip link set 62b34772fe115_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ssh)
  create_netns_link
  ip link set 62b34772fe115_c netns $PID
  ip netns exec $PID ip link set dev 62b34772fe115_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.0.2/16 dev ssh
fi
if [ "55_ssh" == $container_name ]; then
  echo "Create Link for 55_ssh (ssh_in) on bridge "
  ip link add 619ed3792e685_l type veth peer name 619ed3792e685_c
  ovs-vsctl del-port ssh_to_group 619ed3792e685_l
  ovs-vsctl add-port ssh_to_group 619ed3792e685_l
  ovs-vsctl set interface 619ed3792e685_l external_ids:container_id=55_ssh external_ids:container_iface=ssh_in
  ip link set 619ed3792e685_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ssh)
  create_netns_link
  ip link set 619ed3792e685_c netns $PID
  ip netns exec $PID ip link set dev 619ed3792e685_c name ssh_in
  ip netns exec $PID ip link set ssh_in up
  ip netns exec $PID ip addr add 157.0.0.65/24 dev ssh_in
fi
if [ "55_LONDrouter" == $container_name ]; then
  echo "Create Link for 55_LONDrouter (ssh) on bridge "
  ip link add bb18fc4af5c45_l type veth peer name bb18fc4af5c45_c
  ovs-vsctl del-port 55-ssh bb18fc4af5c45_l
  ovs-vsctl add-port 55-ssh bb18fc4af5c45_l
  ovs-vsctl set interface bb18fc4af5c45_l external_ids:container_id=55_LONDrouter external_ids:container_iface=ssh
  ip link set bb18fc4af5c45_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_LONDrouter)
  create_netns_link
  ip link set bb18fc4af5c45_c netns $PID
  ip netns exec $PID ip link set dev bb18fc4af5c45_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.10.1/16 dev ssh
fi
if [ "55_LONDhost" == $container_name ]; then
  echo "Create Link for 55_LONDhost (ssh) on bridge "
  ip link add 7261853c55065_l type veth peer name 7261853c55065_c
  ovs-vsctl del-port 55-ssh 7261853c55065_l
  ovs-vsctl add-port 55-ssh 7261853c55065_l
  ovs-vsctl set interface 7261853c55065_l external_ids:container_id=55_LONDhost external_ids:container_iface=ssh
  ip link set 7261853c55065_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_LONDhost)
  create_netns_link
  ip link set 7261853c55065_c netns $PID
  ip netns exec $PID ip link set dev 7261853c55065_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.10.2/16 dev ssh
fi
if [ "55_ZURIrouter" == $container_name ]; then
  echo "Create Link for 55_ZURIrouter (ssh) on bridge "
  ip link add 56f51f71b5f65_l type veth peer name 56f51f71b5f65_c
  ovs-vsctl del-port 55-ssh 56f51f71b5f65_l
  ovs-vsctl add-port 55-ssh 56f51f71b5f65_l
  ovs-vsctl set interface 56f51f71b5f65_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=ssh
  ip link set 56f51f71b5f65_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ZURIrouter)
  create_netns_link
  ip link set 56f51f71b5f65_c netns $PID
  ip netns exec $PID ip link set dev 56f51f71b5f65_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.1/16 dev ssh
fi
if [ "55_L2_UNIV_CERN" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_CERN (ssh) on bridge "
  ip link add 9d46365c7f005_l type veth peer name 9d46365c7f005_c
  ovs-vsctl del-port 55-ssh 9d46365c7f005_l
  ovs-vsctl add-port 55-ssh 9d46365c7f005_l
  ovs-vsctl set interface 9d46365c7f005_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=ssh
  ip link set 9d46365c7f005_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_CERN)
  create_netns_link
  ip link set 9d46365c7f005_c netns $PID
  ip netns exec $PID ip link set dev 9d46365c7f005_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.2/16 dev ssh
fi
if [ "55_L2_UNIV_ETHZ" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_ETHZ (ssh) on bridge "
  ip link add f431075f3cd25_l type veth peer name f431075f3cd25_c
  ovs-vsctl del-port 55-ssh f431075f3cd25_l
  ovs-vsctl add-port 55-ssh f431075f3cd25_l
  ovs-vsctl set interface f431075f3cd25_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=ssh
  ip link set f431075f3cd25_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_ETHZ)
  create_netns_link
  ip link set f431075f3cd25_c netns $PID
  ip netns exec $PID ip link set dev f431075f3cd25_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.3/16 dev ssh
fi
if [ "55_L2_UNIV_EPFL" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_EPFL (ssh) on bridge "
  ip link add 86736330428a5_l type veth peer name 86736330428a5_c
  ovs-vsctl del-port 55-ssh 86736330428a5_l
  ovs-vsctl add-port 55-ssh 86736330428a5_l
  ovs-vsctl set interface 86736330428a5_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=ssh
  ip link set 86736330428a5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_EPFL)
  create_netns_link
  ip link set 86736330428a5_c netns $PID
  ip netns exec $PID ip link set dev 86736330428a5_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.4/16 dev ssh
fi
if [ "55_L2_UNIV_student_1" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_student_1 (ssh) on bridge "
  ip link add 61d9ab2ee4055_l type veth peer name 61d9ab2ee4055_c
  ovs-vsctl del-port 55-ssh 61d9ab2ee4055_l
  ovs-vsctl add-port 55-ssh 61d9ab2ee4055_l
  ovs-vsctl set interface 61d9ab2ee4055_l external_ids:container_id=55_L2_UNIV_student_1 external_ids:container_iface=ssh
  ip link set 61d9ab2ee4055_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_student_1)
  create_netns_link
  ip link set 61d9ab2ee4055_c netns $PID
  ip netns exec $PID ip link set dev 61d9ab2ee4055_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.5/16 dev ssh
fi
if [ "55_L2_UNIV_staff_1" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_staff_1 (ssh) on bridge "
  ip link add f67821fceaef5_l type veth peer name f67821fceaef5_c
  ovs-vsctl del-port 55-ssh f67821fceaef5_l
  ovs-vsctl add-port 55-ssh f67821fceaef5_l
  ovs-vsctl set interface f67821fceaef5_l external_ids:container_id=55_L2_UNIV_staff_1 external_ids:container_iface=ssh
  ip link set f67821fceaef5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_staff_1)
  create_netns_link
  ip link set f67821fceaef5_c netns $PID
  ip netns exec $PID ip link set dev f67821fceaef5_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.6/16 dev ssh
fi
if [ "55_L2_UNIV_student_2" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_student_2 (ssh) on bridge "
  ip link add f66dce8ae6705_l type veth peer name f66dce8ae6705_c
  ovs-vsctl del-port 55-ssh f66dce8ae6705_l
  ovs-vsctl add-port 55-ssh f66dce8ae6705_l
  ovs-vsctl set interface f66dce8ae6705_l external_ids:container_id=55_L2_UNIV_student_2 external_ids:container_iface=ssh
  ip link set f66dce8ae6705_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_student_2)
  create_netns_link
  ip link set f66dce8ae6705_c netns $PID
  ip netns exec $PID ip link set dev f66dce8ae6705_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.7/16 dev ssh
fi
if [ "55_L2_UNIV_staff_2" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_staff_2 (ssh) on bridge "
  ip link add c8140c4f3bf15_l type veth peer name c8140c4f3bf15_c
  ovs-vsctl del-port 55-ssh c8140c4f3bf15_l
  ovs-vsctl add-port 55-ssh c8140c4f3bf15_l
  ovs-vsctl set interface c8140c4f3bf15_l external_ids:container_id=55_L2_UNIV_staff_2 external_ids:container_iface=ssh
  ip link set c8140c4f3bf15_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_staff_2)
  create_netns_link
  ip link set c8140c4f3bf15_c netns $PID
  ip netns exec $PID ip link set dev c8140c4f3bf15_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.8/16 dev ssh
fi
if [ "55_L2_UNIV_student_3" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_student_3 (ssh) on bridge "
  ip link add ff6b5465ad495_l type veth peer name ff6b5465ad495_c
  ovs-vsctl del-port 55-ssh ff6b5465ad495_l
  ovs-vsctl add-port 55-ssh ff6b5465ad495_l
  ovs-vsctl set interface ff6b5465ad495_l external_ids:container_id=55_L2_UNIV_student_3 external_ids:container_iface=ssh
  ip link set ff6b5465ad495_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_student_3)
  create_netns_link
  ip link set ff6b5465ad495_c netns $PID
  ip netns exec $PID ip link set dev ff6b5465ad495_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.9/16 dev ssh
fi
if [ "55_L2_UNIV_staff_3" == $container_name ]; then
  echo "Create Link for 55_L2_UNIV_staff_3 (ssh) on bridge "
  ip link add 7889d19beef95_l type veth peer name 7889d19beef95_c
  ovs-vsctl del-port 55-ssh 7889d19beef95_l
  ovs-vsctl add-port 55-ssh 7889d19beef95_l
  ovs-vsctl set interface 7889d19beef95_l external_ids:container_id=55_L2_UNIV_staff_3 external_ids:container_iface=ssh
  ip link set 7889d19beef95_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_L2_UNIV_staff_3)
  create_netns_link
  ip link set 7889d19beef95_c netns $PID
  ip netns exec $PID ip link set dev 7889d19beef95_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.11.10/16 dev ssh
fi
if [ "55_PARIrouter" == $container_name ]; then
  echo "Create Link for 55_PARIrouter (ssh) on bridge "
  ip link add 15bb69d485765_l type veth peer name 15bb69d485765_c
  ovs-vsctl del-port 55-ssh 15bb69d485765_l
  ovs-vsctl add-port 55-ssh 15bb69d485765_l
  ovs-vsctl set interface 15bb69d485765_l external_ids:container_id=55_PARIrouter external_ids:container_iface=ssh
  ip link set 15bb69d485765_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIrouter)
  create_netns_link
  ip link set 15bb69d485765_c netns $PID
  ip netns exec $PID ip link set dev 15bb69d485765_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.12.1/16 dev ssh
fi
if [ "55_PARIhost" == $container_name ]; then
  echo "Create Link for 55_PARIhost (ssh) on bridge "
  ip link add 92a3976440b15_l type veth peer name 92a3976440b15_c
  ovs-vsctl del-port 55-ssh 92a3976440b15_l
  ovs-vsctl add-port 55-ssh 92a3976440b15_l
  ovs-vsctl set interface 92a3976440b15_l external_ids:container_id=55_PARIhost external_ids:container_iface=ssh
  ip link set 92a3976440b15_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIhost)
  create_netns_link
  ip link set 92a3976440b15_c netns $PID
  ip netns exec $PID ip link set dev 92a3976440b15_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.12.2/16 dev ssh
fi
if [ "55_GENErouter" == $container_name ]; then
  echo "Create Link for 55_GENErouter (ssh) on bridge "
  ip link add a1c9e97f67f05_l type veth peer name a1c9e97f67f05_c
  ovs-vsctl del-port 55-ssh a1c9e97f67f05_l
  ovs-vsctl add-port 55-ssh a1c9e97f67f05_l
  ovs-vsctl set interface a1c9e97f67f05_l external_ids:container_id=55_GENErouter external_ids:container_iface=ssh
  ip link set a1c9e97f67f05_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_GENErouter)
  create_netns_link
  ip link set a1c9e97f67f05_c netns $PID
  ip netns exec $PID ip link set dev a1c9e97f67f05_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.13.1/16 dev ssh
fi
if [ "55_NEWYrouter" == $container_name ]; then
  echo "Create Link for 55_NEWYrouter (ssh) on bridge "
  ip link add 64cda697adcc5_l type veth peer name 64cda697adcc5_c
  ovs-vsctl del-port 55-ssh 64cda697adcc5_l
  ovs-vsctl add-port 55-ssh 64cda697adcc5_l
  ovs-vsctl set interface 64cda697adcc5_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=ssh
  ip link set 64cda697adcc5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_NEWYrouter)
  create_netns_link
  ip link set 64cda697adcc5_c netns $PID
  ip netns exec $PID ip link set dev 64cda697adcc5_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.14.1/16 dev ssh
fi
if [ "55_NEWYhost" == $container_name ]; then
  echo "Create Link for 55_NEWYhost (ssh) on bridge "
  ip link add a244b71954ca5_l type veth peer name a244b71954ca5_c
  ovs-vsctl del-port 55-ssh a244b71954ca5_l
  ovs-vsctl add-port 55-ssh a244b71954ca5_l
  ovs-vsctl set interface a244b71954ca5_l external_ids:container_id=55_NEWYhost external_ids:container_iface=ssh
  ip link set a244b71954ca5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_NEWYhost)
  create_netns_link
  ip link set a244b71954ca5_c netns $PID
  ip netns exec $PID ip link set dev a244b71954ca5_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.14.2/16 dev ssh
fi
if [ "55_BOSTrouter" == $container_name ]; then
  echo "Create Link for 55_BOSTrouter (ssh) on bridge "
  ip link add dfae9e4b1a245_l type veth peer name dfae9e4b1a245_c
  ovs-vsctl del-port 55-ssh dfae9e4b1a245_l
  ovs-vsctl add-port 55-ssh dfae9e4b1a245_l
  ovs-vsctl set interface dfae9e4b1a245_l external_ids:container_id=55_BOSTrouter external_ids:container_iface=ssh
  ip link set dfae9e4b1a245_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_BOSTrouter)
  create_netns_link
  ip link set dfae9e4b1a245_c netns $PID
  ip netns exec $PID ip link set dev dfae9e4b1a245_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.15.1/16 dev ssh
fi
if [ "55_BOSThost" == $container_name ]; then
  echo "Create Link for 55_BOSThost (ssh) on bridge "
  ip link add 2b785d24b1025_l type veth peer name 2b785d24b1025_c
  ovs-vsctl del-port 55-ssh 2b785d24b1025_l
  ovs-vsctl add-port 55-ssh 2b785d24b1025_l
  ovs-vsctl set interface 2b785d24b1025_l external_ids:container_id=55_BOSThost external_ids:container_iface=ssh
  ip link set 2b785d24b1025_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_BOSThost)
  create_netns_link
  ip link set 2b785d24b1025_c netns $PID
  ip netns exec $PID ip link set dev 2b785d24b1025_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.15.2/16 dev ssh
fi
if [ "55_ATLArouter" == $container_name ]; then
  echo "Create Link for 55_ATLArouter (ssh) on bridge "
  ip link add eebd352f357d5_l type veth peer name eebd352f357d5_c
  ovs-vsctl del-port 55-ssh eebd352f357d5_l
  ovs-vsctl add-port 55-ssh eebd352f357d5_l
  ovs-vsctl set interface eebd352f357d5_l external_ids:container_id=55_ATLArouter external_ids:container_iface=ssh
  ip link set eebd352f357d5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ATLArouter)
  create_netns_link
  ip link set eebd352f357d5_c netns $PID
  ip netns exec $PID ip link set dev eebd352f357d5_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.16.1/16 dev ssh
fi
if [ "55_ATLAhost" == $container_name ]; then
  echo "Create Link for 55_ATLAhost (ssh) on bridge "
  ip link add 503015395bf65_l type veth peer name 503015395bf65_c
  ovs-vsctl del-port 55-ssh 503015395bf65_l
  ovs-vsctl add-port 55-ssh 503015395bf65_l
  ovs-vsctl set interface 503015395bf65_l external_ids:container_id=55_ATLAhost external_ids:container_iface=ssh
  ip link set 503015395bf65_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_ATLAhost)
  create_netns_link
  ip link set 503015395bf65_c netns $PID
  ip netns exec $PID ip link set dev 503015395bf65_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.16.2/16 dev ssh
fi
if [ "55_MIAMrouter" == $container_name ]; then
  echo "Create Link for 55_MIAMrouter (ssh) on bridge "
  ip link add 28b3264884f85_l type veth peer name 28b3264884f85_c
  ovs-vsctl del-port 55-ssh 28b3264884f85_l
  ovs-vsctl add-port 55-ssh 28b3264884f85_l
  ovs-vsctl set interface 28b3264884f85_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=ssh
  ip link set 28b3264884f85_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_MIAMrouter)
  create_netns_link
  ip link set 28b3264884f85_c netns $PID
  ip netns exec $PID ip link set dev 28b3264884f85_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.17.1/16 dev ssh
fi
if [ "55_MIAMhost" == $container_name ]; then
  echo "Create Link for 55_MIAMhost (ssh) on bridge "
  ip link add 135a08f85afd5_l type veth peer name 135a08f85afd5_c
  ovs-vsctl del-port 55-ssh 135a08f85afd5_l
  ovs-vsctl add-port 55-ssh 135a08f85afd5_l
  ovs-vsctl set interface 135a08f85afd5_l external_ids:container_id=55_MIAMhost external_ids:container_iface=ssh
  ip link set 135a08f85afd5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_MIAMhost)
  create_netns_link
  ip link set 135a08f85afd5_c netns $PID
  ip netns exec $PID ip link set dev 135a08f85afd5_c name ssh
  ip netns exec $PID ip link set ssh up
  ip netns exec $PID ip addr add 158.55.17.2/16 dev ssh
fi
if [ "MATRIX" == $container_name ]; then
  echo "Create Link for MATRIX (group_55) on bridge "
  ip link add 03afe22d055f5_l type veth peer name 03afe22d055f5_c
  ovs-vsctl del-port matrix 03afe22d055f5_l
  ovs-vsctl add-port matrix 03afe22d055f5_l
  ovs-vsctl set interface 03afe22d055f5_l external_ids:container_id=MATRIX external_ids:container_iface=group_55
  ip link set 03afe22d055f5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' MATRIX)
  create_netns_link
  ip link set 03afe22d055f5_c netns $PID
  ip netns exec $PID ip link set dev 03afe22d055f5_c name group_55
  ip netns exec $PID ip link set group_55 up
  ip netns exec $PID ip addr add 55.0.198.2/8 dev group_55
fi
if [ "55_PARIrouter" == $container_name ]; then
  echo "Create Link for 55_PARIrouter (matrix_55) on bridge "
  ip link add 41dedabbd4d85_l type veth peer name 41dedabbd4d85_c
  ovs-vsctl del-port matrix 41dedabbd4d85_l
  ovs-vsctl add-port matrix 41dedabbd4d85_l
  ovs-vsctl set interface 41dedabbd4d85_l external_ids:container_id=55_PARIrouter external_ids:container_iface=matrix_55
  ip link set 41dedabbd4d85_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_PARIrouter)
  create_netns_link
  ip link set 41dedabbd4d85_c netns $PID
  ip netns exec $PID ip link set dev 41dedabbd4d85_c name matrix_55
  ip netns exec $PID ip link set matrix_55 up
  ip netns exec $PID ip addr add 55.0.198.1/24 dev matrix_55
  ip netns exec 2682610 ip link set dev matrix_55 address aa:11:11:11:00:55
fi
if [ "MATRIX" == $container_name ] || [ "55_PARIrouter" == $container_name ]; then
  echo "Link between MATRIX (group_55) and 55_PARIrouter (matrix_55)"
  port_id1=`ovs-vsctl get Interface 03afe22d055f5_l ofport`
  port_id2=`ovs-vsctl get Interface 41dedabbd4d85_l ofport`
  ovs-ofctl add-flow matrix in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow matrix in_port=$port_id2,actions=output:$port_id1
fi
if [ "DNS" == $container_name ]; then
  echo "Create Link for DNS (group_55) on bridge "
  ip link add 79f91a12c0775_l type veth peer name 79f91a12c0775_c
  ovs-vsctl del-port dns 79f91a12c0775_l
  ovs-vsctl add-port dns 79f91a12c0775_l
  ovs-vsctl set interface 79f91a12c0775_l external_ids:container_id=DNS external_ids:container_iface=group_55
  ip link set 79f91a12c0775_l up
  PID=$(docker inspect -f '{{.State.Pid}}' DNS)
  create_netns_link
  ip link set 79f91a12c0775_c netns $PID
  ip netns exec $PID ip link set dev 79f91a12c0775_c name group_55
  ip netns exec $PID ip link set group_55 up
  ip netns exec $PID ip addr add 198.0.0.100/24 dev group_55
fi
if [ "55_LONDrouter" == $container_name ]; then
  echo "Create Link for 55_LONDrouter (dns_55) on bridge "
  ip link add 4cc5f2fbd7465_l type veth peer name 4cc5f2fbd7465_c
  ovs-vsctl del-port dns 4cc5f2fbd7465_l
  ovs-vsctl add-port dns 4cc5f2fbd7465_l
  ovs-vsctl set interface 4cc5f2fbd7465_l external_ids:container_id=55_LONDrouter external_ids:container_iface=dns_55
  ip link set 4cc5f2fbd7465_l up
  PID=$(docker inspect -f '{{.State.Pid}}' 55_LONDrouter)
  create_netns_link
  ip link set 4cc5f2fbd7465_c netns $PID
  ip netns exec $PID ip link set dev 4cc5f2fbd7465_c name dns_55
  ip netns exec $PID ip link set dns_55 up
  ip netns exec $PID ip addr add 198.0.0.55/24 dev dns_55
fi
if [ "DNS" == $container_name ] || [ "55_LONDrouter" == $container_name ]; then
  echo "Link between DNS (group_55) and 55_LONDrouter (dns_55)"
  port_id1=`ovs-vsctl get Interface 79f91a12c0775_l ofport`
  port_id2=`ovs-vsctl get Interface 4cc5f2fbd7465_l ofport`
  ovs-ofctl add-flow dns in_port=$port_id1,actions=output:$port_id2
  ovs-ofctl add-flow dns in_port=$port_id2,actions=output:$port_id1
fi
if [ "DNS" == $container_name ]; then
  echo "Create Link for DNS (measurement) on bridge "
  ip link add 40716f1032135_l type veth peer name 40716f1032135_c
  ovs-vsctl del-port dns_measurement 40716f1032135_l
  ovs-vsctl add-port dns_measurement 40716f1032135_l
  ovs-vsctl set interface 40716f1032135_l external_ids:container_id=DNS external_ids:container_iface=measurement
  ip link set 40716f1032135_l up
  PID=$(docker inspect -f '{{.State.Pid}}' DNS)
  create_netns_link
  ip link set 40716f1032135_c netns $PID
  ip netns exec $PID ip link set dev 40716f1032135_c name measurement
  ip netns exec $PID ip link set measurement up
  ip netns exec $PID ip addr add 198.0.0.100/24 dev measurement
fi
if [ "MEASUREMENT" == $container_name ]; then
  echo "Create Link for MEASUREMENT (dns) on bridge "
  ip link add 6d3bbfb84abe5_l type veth peer name 6d3bbfb84abe5_c
  ovs-vsctl del-port dns_measurement 6d3bbfb84abe5_l
  ovs-vsctl add-port dns_measurement 6d3bbfb84abe5_l
  ovs-vsctl set interface 6d3bbfb84abe5_l external_ids:container_id=MEASUREMENT external_ids:container_iface=dns
  ip link set 6d3bbfb84abe5_l up
  PID=$(docker inspect -f '{{.State.Pid}}' MEASUREMENT)
  create_netns_link
  ip link set 6d3bbfb84abe5_c netns $PID
  ip netns exec $PID ip link set dev 6d3bbfb84abe5_c name dns
  ip netns exec $PID ip link set dns up
  ip netns exec $PID ip addr add 198.0.0.101/24 dev dns
fi
