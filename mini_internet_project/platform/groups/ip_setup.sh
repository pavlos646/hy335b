#!/bin/bash
source "/home/ubuntu/MINI_INTERNET/hy335b/mini_internet_project/platform/setup/ovs-docker.sh"
echo "host links"
ip a add 0.0.0.0 dev 55-host
#ip link add eb582fd42df75_l type veth peer name eb582fd42df75_c
ip link set eb582fd42df75_l up
PID=2682348
create_netns_link
ip link set eb582fd42df75_c netns $PID
ip netns exec $PID ip link set dev eb582fd42df75_c name host
ip netns exec $PID ip link set host up
#ip link add 265e2a1fa4365_l type veth peer name 265e2a1fa4365_c
ip link set 265e2a1fa4365_l up
PID=2682433
create_netns_link
ip link set 265e2a1fa4365_c netns $PID
ip netns exec $PID ip link set dev 265e2a1fa4365_c name LONDrouter
ip netns exec $PID ip link set LONDrouter up
port_id1=`ovs-vsctl get Interface eb582fd42df75_l ofport`
port_id2=`ovs-vsctl get Interface 265e2a1fa4365_l ofport`
ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
PID=2682433
create_netns_link
ip netns exec $PID ip a add 55.101.0.1/24 dev LONDrouter
ip netns exec $PID ip link set dev LONDrouter up
ip netns exec $PID ip route add default via 55.101.0.2
#ip link add 5f3d993226c45_l type veth peer name 5f3d993226c45_c
ip link set 5f3d993226c45_l up
PID=2682610
create_netns_link
ip link set 5f3d993226c45_c netns $PID
ip netns exec $PID ip link set dev 5f3d993226c45_c name host
ip netns exec $PID ip link set host up
#ip link add 00865122ff485_l type veth peer name 00865122ff485_c
ip link set 00865122ff485_l up
PID=2682734
create_netns_link
ip link set 00865122ff485_c netns $PID
ip netns exec $PID ip link set dev 00865122ff485_c name PARIrouter
ip netns exec $PID ip link set PARIrouter up
port_id1=`ovs-vsctl get Interface 5f3d993226c45_l ofport`
port_id2=`ovs-vsctl get Interface 00865122ff485_l ofport`
ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
PID=2682734
create_netns_link
ip netns exec $PID ip a add 55.103.0.1/24 dev PARIrouter
ip netns exec $PID ip link set dev PARIrouter up
ip netns exec $PID ip route add default via 55.103.0.2
#ip link add 7681ab39c2ae5_l type veth peer name 7681ab39c2ae5_c
ip link set 7681ab39c2ae5_l up
PID=2682931
create_netns_link
ip link set 7681ab39c2ae5_c netns $PID
ip netns exec $PID ip link set dev 7681ab39c2ae5_c name host
ip netns exec $PID ip link set host up
#ip link add 2734334e88cc5_l type veth peer name 2734334e88cc5_c
ip link set 2734334e88cc5_l up
PID=2683057
create_netns_link
ip link set 2734334e88cc5_c netns $PID
ip netns exec $PID ip link set dev 2734334e88cc5_c name NEWYrouter
ip netns exec $PID ip link set NEWYrouter up
port_id1=`ovs-vsctl get Interface 7681ab39c2ae5_l ofport`
port_id2=`ovs-vsctl get Interface 2734334e88cc5_l ofport`
ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
PID=2683057
create_netns_link
ip netns exec $PID ip a add 55.105.0.1/24 dev NEWYrouter
ip netns exec $PID ip link set dev NEWYrouter up
ip netns exec $PID ip route add default via 55.105.0.2
#ip link add 23ea4998c0bf5_l type veth peer name 23ea4998c0bf5_c
ip link set 23ea4998c0bf5_l up
PID=2683171
create_netns_link
ip link set 23ea4998c0bf5_c netns $PID
ip netns exec $PID ip link set dev 23ea4998c0bf5_c name host
ip netns exec $PID ip link set host up
#ip link add 4d94041d35085_l type veth peer name 4d94041d35085_c
ip link set 4d94041d35085_l up
PID=2683274
create_netns_link
ip link set 4d94041d35085_c netns $PID
ip netns exec $PID ip link set dev 4d94041d35085_c name BOSTrouter
ip netns exec $PID ip link set BOSTrouter up
port_id1=`ovs-vsctl get Interface 23ea4998c0bf5_l ofport`
port_id2=`ovs-vsctl get Interface 4d94041d35085_l ofport`
ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
PID=2683274
create_netns_link
ip netns exec $PID ip a add 55.106.0.1/24 dev BOSTrouter
ip netns exec $PID ip link set dev BOSTrouter up
ip netns exec $PID ip route add default via 55.106.0.2
#ip link add 9e2fa5e8627b5_l type veth peer name 9e2fa5e8627b5_c
ip link set 9e2fa5e8627b5_l up
PID=2683391
create_netns_link
ip link set 9e2fa5e8627b5_c netns $PID
ip netns exec $PID ip link set dev 9e2fa5e8627b5_c name host
ip netns exec $PID ip link set host up
#ip link add d42b98a44e0e5_l type veth peer name d42b98a44e0e5_c
ip link set d42b98a44e0e5_l up
PID=2683487
create_netns_link
ip link set d42b98a44e0e5_c netns $PID
ip netns exec $PID ip link set dev d42b98a44e0e5_c name ATLArouter
ip netns exec $PID ip link set ATLArouter up
port_id1=`ovs-vsctl get Interface 9e2fa5e8627b5_l ofport`
port_id2=`ovs-vsctl get Interface d42b98a44e0e5_l ofport`
ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
PID=2683487
create_netns_link
ip netns exec $PID ip a add 55.107.0.1/24 dev ATLArouter
ip netns exec $PID ip link set dev ATLArouter up
ip netns exec $PID ip route add default via 55.107.0.2
#ip link add 75889f599e385_l type veth peer name 75889f599e385_c
ip link set 75889f599e385_l up
PID=2683592
create_netns_link
ip link set 75889f599e385_c netns $PID
ip netns exec $PID ip link set dev 75889f599e385_c name host
ip netns exec $PID ip link set host up
#ip link add 4f6eac3ab13c5_l type veth peer name 4f6eac3ab13c5_c
ip link set 4f6eac3ab13c5_l up
PID=2683697
create_netns_link
ip link set 4f6eac3ab13c5_c netns $PID
ip netns exec $PID ip link set dev 4f6eac3ab13c5_c name MIAMrouter
ip netns exec $PID ip link set MIAMrouter up
port_id1=`ovs-vsctl get Interface 75889f599e385_l ofport`
port_id2=`ovs-vsctl get Interface 4f6eac3ab13c5_l ofport`
ovs-ofctl add-flow 55-host in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow 55-host in_port=$port_id2,actions=output:$port_id1
PID=2683697
create_netns_link
ip netns exec $PID ip a add 55.108.0.1/24 dev MIAMrouter
ip netns exec $PID ip link set dev MIAMrouter up
ip netns exec $PID ip route add default via 55.108.0.2
echo "layer2 links"
#ip link add 28abfae9aab55_l type veth peer name 28abfae9aab55_c
ip link set 28abfae9aab55_l up
PID=2681384
create_netns_link
ip link set 28abfae9aab55_c netns $PID
ip netns exec $PID ip link set dev 28abfae9aab55_c name 55-CERN
ip netns exec $PID ip link set 55-CERN up
#ip link add 044ff3f776a95_l type veth peer name 044ff3f776a95_c
ip link set 044ff3f776a95_l up
PID=2681248
create_netns_link
ip link set 044ff3f776a95_c netns $PID
ip netns exec $PID ip link set dev 044ff3f776a95_c name 55-ETHZ
ip netns exec $PID ip link set 55-ETHZ up
port_id1=`ovs-vsctl get Interface 28abfae9aab55_l ofport`
port_id2=`ovs-vsctl get Interface 044ff3f776a95_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 95e77be050a15_l type veth peer name 95e77be050a15_c
ip link set 95e77be050a15_l up
PID=2681384
create_netns_link
ip link set 95e77be050a15_c netns $PID
ip netns exec $PID ip link set dev 95e77be050a15_c name 55-EPFL
ip netns exec $PID ip link set 55-EPFL up
#ip link add 97c55e2530215_l type veth peer name 97c55e2530215_c
ip link set 97c55e2530215_l up
PID=2681609
create_netns_link
ip link set 97c55e2530215_c netns $PID
ip netns exec $PID ip link set dev 97c55e2530215_c name 55-ETHZ
ip netns exec $PID ip link set 55-ETHZ up
port_id1=`ovs-vsctl get Interface 95e77be050a15_l ofport`
port_id2=`ovs-vsctl get Interface 97c55e2530215_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add e9cee8418e235_l type veth peer name e9cee8418e235_c
ip link set e9cee8418e235_l up
PID=2681248
create_netns_link
ip link set e9cee8418e235_c netns $PID
ip netns exec $PID ip link set dev e9cee8418e235_c name 55-EPFL
ip netns exec $PID ip link set 55-EPFL up
#ip link add fa6e3e508d0c5_l type veth peer name fa6e3e508d0c5_c
ip link set fa6e3e508d0c5_l up
PID=2681609
create_netns_link
ip link set fa6e3e508d0c5_c netns $PID
ip netns exec $PID ip link set dev fa6e3e508d0c5_c name 55-CERN
ip netns exec $PID ip link set 55-CERN up
port_id1=`ovs-vsctl get Interface e9cee8418e235_l ofport`
port_id2=`ovs-vsctl get Interface fa6e3e508d0c5_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add fff5d3c25c5d5_l type veth peer name fff5d3c25c5d5_c
ip link set fff5d3c25c5d5_l up
PID=2681248
create_netns_link
ip link set fff5d3c25c5d5_c netns $PID
ip netns exec $PID ip link set dev fff5d3c25c5d5_c name 55-student_1
ip netns exec $PID ip link set 55-student_1 up
#ip link add d405209c6d6d5_l type veth peer name d405209c6d6d5_c
ip link set d405209c6d6d5_l up
PID=2681865
create_netns_link
ip link set d405209c6d6d5_c netns $PID
ip netns exec $PID ip link set dev d405209c6d6d5_c name 55-CERN
ip netns exec $PID ip link set 55-CERN up
port_id1=`ovs-vsctl get Interface fff5d3c25c5d5_l ofport`
port_id2=`ovs-vsctl get Interface d405209c6d6d5_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add a3ca625814af5_l type veth peer name a3ca625814af5_c
ip link set a3ca625814af5_l up
PID=2681248
create_netns_link
ip link set a3ca625814af5_c netns $PID
ip netns exec $PID ip link set dev a3ca625814af5_c name 55-staff_1
ip netns exec $PID ip link set 55-staff_1 up
#ip link add 1254e9f30fc05_l type veth peer name 1254e9f30fc05_c
ip link set 1254e9f30fc05_l up
PID=2682034
create_netns_link
ip link set 1254e9f30fc05_c netns $PID
ip netns exec $PID ip link set dev 1254e9f30fc05_c name 55-CERN
ip netns exec $PID ip link set 55-CERN up
port_id1=`ovs-vsctl get Interface a3ca625814af5_l ofport`
port_id2=`ovs-vsctl get Interface 1254e9f30fc05_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add d04d8241b3895_l type veth peer name d04d8241b3895_c
ip link set d04d8241b3895_l up
PID=2681384
create_netns_link
ip link set d04d8241b3895_c netns $PID
ip netns exec $PID ip link set dev d04d8241b3895_c name 55-student_2
ip netns exec $PID ip link set 55-student_2 up
#ip link add 6bfd8b698be75_l type veth peer name 6bfd8b698be75_c
ip link set 6bfd8b698be75_l up
PID=2682095
create_netns_link
ip link set 6bfd8b698be75_c netns $PID
ip netns exec $PID ip link set dev 6bfd8b698be75_c name 55-ETHZ
ip netns exec $PID ip link set 55-ETHZ up
port_id1=`ovs-vsctl get Interface d04d8241b3895_l ofport`
port_id2=`ovs-vsctl get Interface 6bfd8b698be75_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add c01e0645ac235_l type veth peer name c01e0645ac235_c
ip link set c01e0645ac235_l up
PID=2681384
create_netns_link
ip link set c01e0645ac235_c netns $PID
ip netns exec $PID ip link set dev c01e0645ac235_c name 55-staff_2
ip netns exec $PID ip link set 55-staff_2 up
#ip link add 2226ee9a9a0b5_l type veth peer name 2226ee9a9a0b5_c
ip link set 2226ee9a9a0b5_l up
PID=2682155
create_netns_link
ip link set 2226ee9a9a0b5_c netns $PID
ip netns exec $PID ip link set dev 2226ee9a9a0b5_c name 55-ETHZ
ip netns exec $PID ip link set 55-ETHZ up
port_id1=`ovs-vsctl get Interface c01e0645ac235_l ofport`
port_id2=`ovs-vsctl get Interface 2226ee9a9a0b5_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 469a7cec7dd15_l type veth peer name 469a7cec7dd15_c
ip link set 469a7cec7dd15_l up
PID=2681609
create_netns_link
ip link set 469a7cec7dd15_c netns $PID
ip netns exec $PID ip link set dev 469a7cec7dd15_c name 55-student_3
ip netns exec $PID ip link set 55-student_3 up
#ip link add 72ceb5902f935_l type veth peer name 72ceb5902f935_c
ip link set 72ceb5902f935_l up
PID=2682212
create_netns_link
ip link set 72ceb5902f935_c netns $PID
ip netns exec $PID ip link set dev 72ceb5902f935_c name 55-EPFL
ip netns exec $PID ip link set 55-EPFL up
port_id1=`ovs-vsctl get Interface 469a7cec7dd15_l ofport`
port_id2=`ovs-vsctl get Interface 72ceb5902f935_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 4351d5b11d8f5_l type veth peer name 4351d5b11d8f5_c
ip link set 4351d5b11d8f5_l up
PID=2681609
create_netns_link
ip link set 4351d5b11d8f5_c netns $PID
ip netns exec $PID ip link set dev 4351d5b11d8f5_c name 55-staff_3
ip netns exec $PID ip link set 55-staff_3 up
#ip link add 927fa039cc0e5_l type veth peer name 927fa039cc0e5_c
ip link set 927fa039cc0e5_l up
PID=2682271
create_netns_link
ip link set 927fa039cc0e5_c netns $PID
ip netns exec $PID ip link set dev 927fa039cc0e5_c name 55-EPFL
ip netns exec $PID ip link set 55-EPFL up
port_id1=`ovs-vsctl get Interface 4351d5b11d8f5_l ofport`
port_id2=`ovs-vsctl get Interface 927fa039cc0e5_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 0ae3065de5ad5_l type veth peer name 0ae3065de5ad5_c
ip link set 0ae3065de5ad5_l up
PID=2682520
create_netns_link
ip link set 0ae3065de5ad5_c netns $PID
ip netns exec $PID ip link set dev 0ae3065de5ad5_c name ZURI-L2
ip netns exec $PID ip link set ZURI-L2 up
#ip link add 11ed003cfc5a5_l type veth peer name 11ed003cfc5a5_c
ip link set 11ed003cfc5a5_l up
PID=2681384
create_netns_link
ip link set 11ed003cfc5a5_c netns $PID
ip netns exec $PID ip link set dev 11ed003cfc5a5_c name ZURIrouter
ip netns exec $PID ip link set ZURIrouter up
port_id1=`ovs-vsctl get Interface 0ae3065de5ad5_l ofport`
port_id2=`ovs-vsctl get Interface 11ed003cfc5a5_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 309b94a931805_l type veth peer name 309b94a931805_c
ip link set 309b94a931805_l up
PID=2682813
create_netns_link
ip link set 309b94a931805_c netns $PID
ip netns exec $PID ip link set dev 309b94a931805_c name GENE-L2
ip netns exec $PID ip link set GENE-L2 up
#ip link add 707b0abb02aa5_l type veth peer name 707b0abb02aa5_c
ip link set 707b0abb02aa5_l up
PID=2681248
create_netns_link
ip link set 707b0abb02aa5_c netns $PID
ip netns exec $PID ip link set dev 707b0abb02aa5_c name GENErouter
ip netns exec $PID ip link set GENErouter up
port_id1=`ovs-vsctl get Interface 309b94a931805_l ofport`
port_id2=`ovs-vsctl get Interface 707b0abb02aa5_l ofport`
ovs-ofctl add-flow l2-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow l2-55 in_port=$port_id2,actions=output:$port_id1
echo "internal links"
ip link set dev int-55 up
#ip link add 8fdda6b3ce365_l type veth peer name 8fdda6b3ce365_c
ip link set 8fdda6b3ce365_l up
PID=2682520
create_netns_link
ip link set 8fdda6b3ce365_c netns $PID
ip netns exec $PID ip link set dev 8fdda6b3ce365_c name port_PARI
ip netns exec $PID ip link set port_PARI up
#ip link add 3a693008f5f85_l type veth peer name 3a693008f5f85_c
ip link set 3a693008f5f85_l up
PID=2682610
create_netns_link
ip link set 3a693008f5f85_c netns $PID
ip netns exec $PID ip link set dev 3a693008f5f85_c name port_ZURI
ip netns exec $PID ip link set port_ZURI up
port_id1=`ovs-vsctl get Interface 8fdda6b3ce365_l ofport`
port_id2=`ovs-vsctl get Interface 3a693008f5f85_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 9659af376ea95_l type veth peer name 9659af376ea95_c
ip link set 9659af376ea95_l up
PID=2682520
create_netns_link
ip link set 9659af376ea95_c netns $PID
ip netns exec $PID ip link set dev 9659af376ea95_c name port_LOND
ip netns exec $PID ip link set port_LOND up
#ip link add 35c07aa7dddc5_l type veth peer name 35c07aa7dddc5_c
ip link set 35c07aa7dddc5_l up
PID=2682348
create_netns_link
ip link set 35c07aa7dddc5_c netns $PID
ip netns exec $PID ip link set dev 35c07aa7dddc5_c name port_ZURI
ip netns exec $PID ip link set port_ZURI up
port_id1=`ovs-vsctl get Interface 9659af376ea95_l ofport`
port_id2=`ovs-vsctl get Interface 35c07aa7dddc5_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 37545494627b5_l type veth peer name 37545494627b5_c
ip link set 37545494627b5_l up
PID=2682610
create_netns_link
ip link set 37545494627b5_c netns $PID
ip netns exec $PID ip link set dev 37545494627b5_c name port_GENE
ip netns exec $PID ip link set port_GENE up
#ip link add 47353ab69a675_l type veth peer name 47353ab69a675_c
ip link set 47353ab69a675_l up
PID=2682813
create_netns_link
ip link set 47353ab69a675_c netns $PID
ip netns exec $PID ip link set dev 47353ab69a675_c name port_PARI
ip netns exec $PID ip link set port_PARI up
port_id1=`ovs-vsctl get Interface 37545494627b5_l ofport`
port_id2=`ovs-vsctl get Interface 47353ab69a675_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add eeeb0f88d4055_l type veth peer name eeeb0f88d4055_c
ip link set eeeb0f88d4055_l up
PID=2682610
create_netns_link
ip link set eeeb0f88d4055_c netns $PID
ip netns exec $PID ip link set dev eeeb0f88d4055_c name port_LOND
ip netns exec $PID ip link set port_LOND up
#ip link add 4f7cbc6703a75_l type veth peer name 4f7cbc6703a75_c
ip link set 4f7cbc6703a75_l up
PID=2682348
create_netns_link
ip link set 4f7cbc6703a75_c netns $PID
ip netns exec $PID ip link set dev 4f7cbc6703a75_c name port_PARI
ip netns exec $PID ip link set port_PARI up
port_id1=`ovs-vsctl get Interface eeeb0f88d4055_l ofport`
port_id2=`ovs-vsctl get Interface 4f7cbc6703a75_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 2de634cec6275_l type veth peer name 2de634cec6275_c
ip link set 2de634cec6275_l up
PID=2682610
create_netns_link
ip link set 2de634cec6275_c netns $PID
ip netns exec $PID ip link set dev 2de634cec6275_c name port_NEWY
ip netns exec $PID ip link set port_NEWY up
#ip link add 89fc122ec6775_l type veth peer name 89fc122ec6775_c
ip link set 89fc122ec6775_l up
PID=2682931
create_netns_link
ip link set 89fc122ec6775_c netns $PID
ip netns exec $PID ip link set dev 89fc122ec6775_c name port_PARI
ip netns exec $PID ip link set port_PARI up
port_id1=`ovs-vsctl get Interface 2de634cec6275_l ofport`
port_id2=`ovs-vsctl get Interface 89fc122ec6775_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 1038230c7dd25_l type veth peer name 1038230c7dd25_c
ip link set 1038230c7dd25_l up
PID=2682610
create_netns_link
ip link set 1038230c7dd25_c netns $PID
ip netns exec $PID ip link set dev 1038230c7dd25_c name port_MIAM
ip netns exec $PID ip link set port_MIAM up
#ip link add 72b97822858a5_l type veth peer name 72b97822858a5_c
ip link set 72b97822858a5_l up
PID=2683592
create_netns_link
ip link set 72b97822858a5_c netns $PID
ip netns exec $PID ip link set dev 72b97822858a5_c name port_PARI
ip netns exec $PID ip link set port_PARI up
port_id1=`ovs-vsctl get Interface 1038230c7dd25_l ofport`
port_id2=`ovs-vsctl get Interface 72b97822858a5_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add bd54c93f27555_l type veth peer name bd54c93f27555_c
ip link set bd54c93f27555_l up
PID=2682348
create_netns_link
ip link set bd54c93f27555_c netns $PID
ip netns exec $PID ip link set dev bd54c93f27555_c name port_BOST
ip netns exec $PID ip link set port_BOST up
#ip link add 279d512f3fdd5_l type veth peer name 279d512f3fdd5_c
ip link set 279d512f3fdd5_l up
PID=2683171
create_netns_link
ip link set 279d512f3fdd5_c netns $PID
ip netns exec $PID ip link set dev 279d512f3fdd5_c name port_LOND
ip netns exec $PID ip link set port_LOND up
port_id1=`ovs-vsctl get Interface bd54c93f27555_l ofport`
port_id2=`ovs-vsctl get Interface 279d512f3fdd5_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add e30fd3f89d1f5_l type veth peer name e30fd3f89d1f5_c
ip link set e30fd3f89d1f5_l up
PID=2682348
create_netns_link
ip link set e30fd3f89d1f5_c netns $PID
ip netns exec $PID ip link set dev e30fd3f89d1f5_c name port_NEWY
ip netns exec $PID ip link set port_NEWY up
#ip link add 1182ac91595a5_l type veth peer name 1182ac91595a5_c
ip link set 1182ac91595a5_l up
PID=2682931
create_netns_link
ip link set 1182ac91595a5_c netns $PID
ip netns exec $PID ip link set dev 1182ac91595a5_c name port_LOND
ip netns exec $PID ip link set port_LOND up
port_id1=`ovs-vsctl get Interface e30fd3f89d1f5_l ofport`
port_id2=`ovs-vsctl get Interface 1182ac91595a5_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 900701b7a49b5_l type veth peer name 900701b7a49b5_c
ip link set 900701b7a49b5_l up
PID=2682813
create_netns_link
ip link set 900701b7a49b5_c netns $PID
ip netns exec $PID ip link set dev 900701b7a49b5_c name port_MIAM
ip netns exec $PID ip link set port_MIAM up
#ip link add 53c813eeae785_l type veth peer name 53c813eeae785_c
ip link set 53c813eeae785_l up
PID=2683592
create_netns_link
ip link set 53c813eeae785_c netns $PID
ip netns exec $PID ip link set dev 53c813eeae785_c name port_GENE
ip netns exec $PID ip link set port_GENE up
port_id1=`ovs-vsctl get Interface 900701b7a49b5_l ofport`
port_id2=`ovs-vsctl get Interface 53c813eeae785_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add c5c4518768025_l type veth peer name c5c4518768025_c
ip link set c5c4518768025_l up
PID=2682931
create_netns_link
ip link set c5c4518768025_c netns $PID
ip netns exec $PID ip link set dev c5c4518768025_c name port_BOST
ip netns exec $PID ip link set port_BOST up
#ip link add f24c9fc80b575_l type veth peer name f24c9fc80b575_c
ip link set f24c9fc80b575_l up
PID=2683171
create_netns_link
ip link set f24c9fc80b575_c netns $PID
ip netns exec $PID ip link set dev f24c9fc80b575_c name port_NEWY
ip netns exec $PID ip link set port_NEWY up
port_id1=`ovs-vsctl get Interface c5c4518768025_l ofport`
port_id2=`ovs-vsctl get Interface f24c9fc80b575_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add 5c44a41059a45_l type veth peer name 5c44a41059a45_c
ip link set 5c44a41059a45_l up
PID=2682931
create_netns_link
ip link set 5c44a41059a45_c netns $PID
ip netns exec $PID ip link set dev 5c44a41059a45_c name port_ATLA
ip netns exec $PID ip link set port_ATLA up
#ip link add d0d77a4ab0bc5_l type veth peer name d0d77a4ab0bc5_c
ip link set d0d77a4ab0bc5_l up
PID=2683391
create_netns_link
ip link set d0d77a4ab0bc5_c netns $PID
ip netns exec $PID ip link set dev d0d77a4ab0bc5_c name port_NEWY
ip netns exec $PID ip link set port_NEWY up
port_id1=`ovs-vsctl get Interface 5c44a41059a45_l ofport`
port_id2=`ovs-vsctl get Interface d0d77a4ab0bc5_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add c782691b4d6d5_l type veth peer name c782691b4d6d5_c
ip link set c782691b4d6d5_l up
PID=2682931
create_netns_link
ip link set c782691b4d6d5_c netns $PID
ip netns exec $PID ip link set dev c782691b4d6d5_c name port_MIAM
ip netns exec $PID ip link set port_MIAM up
#ip link add ac678dff1e655_l type veth peer name ac678dff1e655_c
ip link set ac678dff1e655_l up
PID=2683592
create_netns_link
ip link set ac678dff1e655_c netns $PID
ip netns exec $PID ip link set dev ac678dff1e655_c name port_NEWY
ip netns exec $PID ip link set port_NEWY up
port_id1=`ovs-vsctl get Interface c782691b4d6d5_l ofport`
port_id2=`ovs-vsctl get Interface ac678dff1e655_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
#ip link add d316d67398895_l type veth peer name d316d67398895_c
ip link set d316d67398895_l up
PID=2683391
create_netns_link
ip link set d316d67398895_c netns $PID
ip netns exec $PID ip link set dev d316d67398895_c name port_MIAM
ip netns exec $PID ip link set port_MIAM up
#ip link add 7adfed1c16df5_l type veth peer name 7adfed1c16df5_c
ip link set 7adfed1c16df5_l up
PID=2683592
create_netns_link
ip link set 7adfed1c16df5_c netns $PID
ip netns exec $PID ip link set dev 7adfed1c16df5_c name port_ATLA
ip netns exec $PID ip link set port_ATLA up
port_id1=`ovs-vsctl get Interface d316d67398895_l ofport`
port_id2=`ovs-vsctl get Interface 7adfed1c16df5_l ofport`
ovs-ofctl add-flow int-55 in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow int-55 in_port=$port_id2,actions=output:$port_id1
echo "external links"
echo "measurement links"
#ip link add cce5f40b9a135_l type veth peer name cce5f40b9a135_c
ip link set cce5f40b9a135_l up
PID=2686012
create_netns_link
ip link set cce5f40b9a135_c netns $PID
ip netns exec $PID ip link set dev cce5f40b9a135_c name ssh_in
ip netns exec $PID ip link set ssh_in up
ip netns exec $PID ip addr add 157.0.0.250/24 dev ssh_in
ip link set dev measurement up
#ip link add 12dc3828879f5_l type veth peer name 12dc3828879f5_c
ip link set 12dc3828879f5_l up
PID=2686012
create_netns_link
ip link set 12dc3828879f5_c netns $PID
ip netns exec $PID ip link set dev 12dc3828879f5_c name group_55
ip netns exec $PID ip link set group_55 up
ip netns exec $PID ip addr add 55.0.199.2/24 dev group_55
#ip link add fa08705c29255_l type veth peer name fa08705c29255_c
ip link set fa08705c29255_l up
PID=2682520
create_netns_link
ip link set fa08705c29255_c netns $PID
ip netns exec $PID ip link set dev fa08705c29255_c name measurement_55
ip netns exec $PID ip link set measurement_55 up
ip netns exec $PID ip addr add 55.0.199.1/24 dev measurement_55
ip netns exec 2682520 ip link set dev measurement_55 address aa:22:22:22:00:55
port_id1=`ovs-vsctl get Interface 12dc3828879f5_l ofport`
port_id2=`ovs-vsctl get Interface fa08705c29255_l ofport`
ovs-ofctl add-flow measurement in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow measurement in_port=$port_id2,actions=output:$port_id1
echo "ssh links"
ip a add 157.0.0.1/24 dev ssh_to_group
ip link set dev ssh_to_group up
ip link set dev 55-ssh up
#ip link add 62b34772fe115_l type veth peer name 62b34772fe115_c
ip link set 62b34772fe115_l up
PID=2681188
create_netns_link
ip link set 62b34772fe115_c netns $PID
ip netns exec $PID ip link set dev 62b34772fe115_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.0.2/16 dev ssh
#ip link add 619ed3792e685_l type veth peer name 619ed3792e685_c
ip link set 619ed3792e685_l up
PID=2681188
create_netns_link
ip link set 619ed3792e685_c netns $PID
ip netns exec $PID ip link set dev 619ed3792e685_c name ssh_in
ip netns exec $PID ip link set ssh_in up
ip netns exec $PID ip addr add 157.0.0.65/24 dev ssh_in
#ip link add bb18fc4af5c45_l type veth peer name bb18fc4af5c45_c
ip link set bb18fc4af5c45_l up
PID=2682348
create_netns_link
ip link set bb18fc4af5c45_c netns $PID
ip netns exec $PID ip link set dev bb18fc4af5c45_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.10.1/16 dev ssh
#ip link add 7261853c55065_l type veth peer name 7261853c55065_c
ip link set 7261853c55065_l up
PID=2682433
create_netns_link
ip link set 7261853c55065_c netns $PID
ip netns exec $PID ip link set dev 7261853c55065_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.10.2/16 dev ssh
#ip link add 56f51f71b5f65_l type veth peer name 56f51f71b5f65_c
ip link set 56f51f71b5f65_l up
PID=2682520
create_netns_link
ip link set 56f51f71b5f65_c netns $PID
ip netns exec $PID ip link set dev 56f51f71b5f65_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.1/16 dev ssh
#ip link add 9d46365c7f005_l type veth peer name 9d46365c7f005_c
ip link set 9d46365c7f005_l up
PID=2681248
create_netns_link
ip link set 9d46365c7f005_c netns $PID
ip netns exec $PID ip link set dev 9d46365c7f005_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.2/16 dev ssh
#ip link add f431075f3cd25_l type veth peer name f431075f3cd25_c
ip link set f431075f3cd25_l up
PID=2681384
create_netns_link
ip link set f431075f3cd25_c netns $PID
ip netns exec $PID ip link set dev f431075f3cd25_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.3/16 dev ssh
#ip link add 86736330428a5_l type veth peer name 86736330428a5_c
ip link set 86736330428a5_l up
PID=2681609
create_netns_link
ip link set 86736330428a5_c netns $PID
ip netns exec $PID ip link set dev 86736330428a5_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.4/16 dev ssh
#ip link add 61d9ab2ee4055_l type veth peer name 61d9ab2ee4055_c
ip link set 61d9ab2ee4055_l up
PID=2681865
create_netns_link
ip link set 61d9ab2ee4055_c netns $PID
ip netns exec $PID ip link set dev 61d9ab2ee4055_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.5/16 dev ssh
#ip link add f67821fceaef5_l type veth peer name f67821fceaef5_c
ip link set f67821fceaef5_l up
PID=2682034
create_netns_link
ip link set f67821fceaef5_c netns $PID
ip netns exec $PID ip link set dev f67821fceaef5_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.6/16 dev ssh
#ip link add f66dce8ae6705_l type veth peer name f66dce8ae6705_c
ip link set f66dce8ae6705_l up
PID=2682095
create_netns_link
ip link set f66dce8ae6705_c netns $PID
ip netns exec $PID ip link set dev f66dce8ae6705_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.7/16 dev ssh
#ip link add c8140c4f3bf15_l type veth peer name c8140c4f3bf15_c
ip link set c8140c4f3bf15_l up
PID=2682155
create_netns_link
ip link set c8140c4f3bf15_c netns $PID
ip netns exec $PID ip link set dev c8140c4f3bf15_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.8/16 dev ssh
#ip link add ff6b5465ad495_l type veth peer name ff6b5465ad495_c
ip link set ff6b5465ad495_l up
PID=2682212
create_netns_link
ip link set ff6b5465ad495_c netns $PID
ip netns exec $PID ip link set dev ff6b5465ad495_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.9/16 dev ssh
#ip link add 7889d19beef95_l type veth peer name 7889d19beef95_c
ip link set 7889d19beef95_l up
PID=2682271
create_netns_link
ip link set 7889d19beef95_c netns $PID
ip netns exec $PID ip link set dev 7889d19beef95_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.11.10/16 dev ssh
#ip link add 15bb69d485765_l type veth peer name 15bb69d485765_c
ip link set 15bb69d485765_l up
PID=2682610
create_netns_link
ip link set 15bb69d485765_c netns $PID
ip netns exec $PID ip link set dev 15bb69d485765_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.12.1/16 dev ssh
#ip link add 92a3976440b15_l type veth peer name 92a3976440b15_c
ip link set 92a3976440b15_l up
PID=2682734
create_netns_link
ip link set 92a3976440b15_c netns $PID
ip netns exec $PID ip link set dev 92a3976440b15_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.12.2/16 dev ssh
#ip link add a1c9e97f67f05_l type veth peer name a1c9e97f67f05_c
ip link set a1c9e97f67f05_l up
PID=2682813
create_netns_link
ip link set a1c9e97f67f05_c netns $PID
ip netns exec $PID ip link set dev a1c9e97f67f05_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.13.1/16 dev ssh
#ip link add 64cda697adcc5_l type veth peer name 64cda697adcc5_c
ip link set 64cda697adcc5_l up
PID=2682931
create_netns_link
ip link set 64cda697adcc5_c netns $PID
ip netns exec $PID ip link set dev 64cda697adcc5_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.14.1/16 dev ssh
#ip link add a244b71954ca5_l type veth peer name a244b71954ca5_c
ip link set a244b71954ca5_l up
PID=2683057
create_netns_link
ip link set a244b71954ca5_c netns $PID
ip netns exec $PID ip link set dev a244b71954ca5_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.14.2/16 dev ssh
#ip link add dfae9e4b1a245_l type veth peer name dfae9e4b1a245_c
ip link set dfae9e4b1a245_l up
PID=2683171
create_netns_link
ip link set dfae9e4b1a245_c netns $PID
ip netns exec $PID ip link set dev dfae9e4b1a245_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.15.1/16 dev ssh
#ip link add 2b785d24b1025_l type veth peer name 2b785d24b1025_c
ip link set 2b785d24b1025_l up
PID=2683274
create_netns_link
ip link set 2b785d24b1025_c netns $PID
ip netns exec $PID ip link set dev 2b785d24b1025_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.15.2/16 dev ssh
#ip link add eebd352f357d5_l type veth peer name eebd352f357d5_c
ip link set eebd352f357d5_l up
PID=2683391
create_netns_link
ip link set eebd352f357d5_c netns $PID
ip netns exec $PID ip link set dev eebd352f357d5_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.16.1/16 dev ssh
#ip link add 503015395bf65_l type veth peer name 503015395bf65_c
ip link set 503015395bf65_l up
PID=2683487
create_netns_link
ip link set 503015395bf65_c netns $PID
ip netns exec $PID ip link set dev 503015395bf65_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.16.2/16 dev ssh
#ip link add 28b3264884f85_l type veth peer name 28b3264884f85_c
ip link set 28b3264884f85_l up
PID=2683592
create_netns_link
ip link set 28b3264884f85_c netns $PID
ip netns exec $PID ip link set dev 28b3264884f85_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.17.1/16 dev ssh
#ip link add 135a08f85afd5_l type veth peer name 135a08f85afd5_c
ip link set 135a08f85afd5_l up
PID=2683697
create_netns_link
ip link set 135a08f85afd5_c netns $PID
ip netns exec $PID ip link set dev 135a08f85afd5_c name ssh
ip netns exec $PID ip link set ssh up
ip netns exec $PID ip addr add 158.55.17.2/16 dev ssh
echo "matrix_setup"
ip link set dev matrix up
#ip link add 03afe22d055f5_l type veth peer name 03afe22d055f5_c
ip link set 03afe22d055f5_l up
PID=2687500
create_netns_link
ip link set 03afe22d055f5_c netns $PID
ip netns exec $PID ip link set dev 03afe22d055f5_c name group_55
ip netns exec $PID ip link set group_55 up
ip netns exec $PID ip addr add 55.0.198.2/8 dev group_55
#ip link add 41dedabbd4d85_l type veth peer name 41dedabbd4d85_c
ip link set 41dedabbd4d85_l up
PID=2682610
create_netns_link
ip link set 41dedabbd4d85_c netns $PID
ip netns exec $PID ip link set dev 41dedabbd4d85_c name matrix_55
ip netns exec $PID ip link set matrix_55 up
ip netns exec $PID ip addr add 55.0.198.1/24 dev matrix_55
ip netns exec 2682610 ip link set dev matrix_55 address aa:11:11:11:00:55
port_id1=`ovs-vsctl get Interface 03afe22d055f5_l ofport`
port_id2=`ovs-vsctl get Interface 41dedabbd4d85_l ofport`
ovs-ofctl add-flow matrix in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow matrix in_port=$port_id2,actions=output:$port_id1
echo "dns links"
ip link set dev dns up
#ip link add 79f91a12c0775_l type veth peer name 79f91a12c0775_c
ip link set 79f91a12c0775_l up
PID=2687669
create_netns_link
ip link set 79f91a12c0775_c netns $PID
ip netns exec $PID ip link set dev 79f91a12c0775_c name group_55
ip netns exec $PID ip link set group_55 up
ip netns exec $PID ip addr add 198.0.0.100/24 dev group_55
#ip link add 4cc5f2fbd7465_l type veth peer name 4cc5f2fbd7465_c
ip link set 4cc5f2fbd7465_l up
PID=2682348
create_netns_link
ip link set 4cc5f2fbd7465_c netns $PID
ip netns exec $PID ip link set dev 4cc5f2fbd7465_c name dns_55
ip netns exec $PID ip link set dns_55 up
ip netns exec $PID ip addr add 198.0.0.55/24 dev dns_55
port_id1=`ovs-vsctl get Interface 79f91a12c0775_l ofport`
port_id2=`ovs-vsctl get Interface 4cc5f2fbd7465_l ofport`
ovs-ofctl add-flow dns in_port=$port_id1,actions=output:$port_id2
ovs-ofctl add-flow dns in_port=$port_id2,actions=output:$port_id1
ip link set dev dns_measurement up
#ip link add 40716f1032135_l type veth peer name 40716f1032135_c
ip link set 40716f1032135_l up
PID=2687669
create_netns_link
ip link set 40716f1032135_c netns $PID
ip netns exec $PID ip link set dev 40716f1032135_c name measurement
ip netns exec $PID ip link set measurement up
ip netns exec $PID ip addr add 198.0.0.100/24 dev measurement
#ip link add 6d3bbfb84abe5_l type veth peer name 6d3bbfb84abe5_c
ip link set 6d3bbfb84abe5_l up
PID=2686012
create_netns_link
ip link set 6d3bbfb84abe5_c netns $PID
ip netns exec $PID ip link set dev 6d3bbfb84abe5_c name dns
ip netns exec $PID ip link set dns up
ip netns exec $PID ip addr add 198.0.0.101/24 dev dns
