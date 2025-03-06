#!/bin/bash
ovs-vsctl set bridge l2-55 other-config:forward-bpdu=true
docker exec -d 55_L2_UNIV_ETHZ ovs-vsctl add-port br0 55-CERN -- set Port 55-CERN trunks=0
docker exec -d 55_L2_UNIV_CERN ovs-vsctl add-port br0 55-ETHZ -- set Port 55-ETHZ trunks=0
docker exec -d 55_L2_UNIV_ETHZ ovs-vsctl add-port br0 55-EPFL -- set Port 55-EPFL trunks=0
docker exec -d 55_L2_UNIV_EPFL ovs-vsctl add-port br0 55-ETHZ -- set Port 55-ETHZ trunks=0
docker exec -d 55_L2_UNIV_CERN ovs-vsctl add-port br0 55-EPFL -- set Port 55-EPFL trunks=0
docker exec -d 55_L2_UNIV_EPFL ovs-vsctl add-port br0 55-CERN -- set Port 55-CERN trunks=0
docker exec -d 55_L2_UNIV_CERN ovs-vsctl add-port br0 55-student_1
docker exec -d 55_L2_UNIV_CERN ovs-vsctl add-port br0 55-staff_1
docker exec -d 55_L2_UNIV_ETHZ ovs-vsctl add-port br0 55-student_2
docker exec -d 55_L2_UNIV_ETHZ ovs-vsctl add-port br0 55-staff_2
docker exec -d 55_L2_UNIV_EPFL ovs-vsctl add-port br0 55-student_3
docker exec -d 55_L2_UNIV_EPFL ovs-vsctl add-port br0 55-staff_3
docker exec -d 55_L2_UNIV_ETHZ ovs-vsctl add-port br0 ZURIrouter
docker exec -d 55_L2_UNIV_CERN ovs-vsctl add-port br0 GENErouter
