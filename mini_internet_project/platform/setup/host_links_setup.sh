#!/bin/bash
#
# create links between hosts and routers
# if router has a host, defined in ./config/router_config.txt
# ip subnets are defined in ./config/subnet_config.sh

set -o errexit
set -o pipefail
set -o nounset

DIRECTORY="$1"
source "${DIRECTORY}"/config/subnet_config.sh
source "${DIRECTORY}"/setup/ovs-docker.sh

readarray groups < "${DIRECTORY}"/config/AS_config.txt

group_numbers=${#groups[@]}

for ((k=0;k<group_numbers;k++)); do
    group_k=(${groups[$k]})
    group_number="${group_k[0]}"
    group_as="${group_k[1]}"
    group_config="${group_k[2]}"
    group_router_config="${group_k[3]}"
    group_internal_links="${group_k[4]}"

    if [ "${group_as}" != "IXP" ];then

        readarray routers < "${DIRECTORY}"/config/$group_router_config
        n_routers=${#routers[@]}

        br_name="${group_number}"-host

        echo -n "-- add-br "${br_name}" " >> "${DIRECTORY}"/groups/add_bridges.sh
        echo "ip a add 0.0.0.0 dev ${br_name}" >> "${DIRECTORY}"/groups/ip_setup.sh

        for ((i=0;i<n_routers;i++)); do
            router_i=(${routers[$i]})
            rname="${router_i[0]}"
            property1="${router_i[1]}"
            property2="${router_i[2]}"

            if [[ "${property2}" == host* ]];then

                subnet_bridge="$(subnet_host_router "${group_number}" "${i}" "bridge")"
                subnet_router="$(subnet_host_router "${group_number}" "${i}" "router")"
                subnet_host="$(subnet_host_router "${group_number}" "${i}" "host")"

                ./setup/ovs-docker.sh add-port ${br_name} "host"  \
                "${group_number}"_"${rname}"router

                ./setup/ovs-docker.sh add-port ${br_name} "${rname}""router" \
                "${group_number}"_"${rname}"host

                ./setup/ovs-docker.sh connect-ports "${br_name}" \
                "host" "${group_number}"_"${rname}"router \
                "${rname}""router" "${group_number}"_"${rname}"host

                # set default ip address and default gw in host
                if [ "$group_config" == "Config" ]; then
                    get_docker_pid "${group_number}"_"${rname}"host
                    echo "PID=$DOCKER_PID" >> "${DIRECTORY}"/groups/ip_setup.sh
                    echo "create_netns_link" >> "${DIRECTORY}"/groups/ip_setup.sh
                    echo "ip netns exec \$PID ip a add "${subnet_host}" dev "${rname}"router" >> "${DIRECTORY}"/groups/ip_setup.sh
                    echo "ip netns exec \$PID ip link set dev "${rname}"router up" >> "${DIRECTORY}"/groups/ip_setup.sh
                    echo "ip netns exec \$PID ip route add default via "${subnet_router%/*} >> "${DIRECTORY}"/groups/ip_setup.sh
                fi
            fi
        done
    fi
done
