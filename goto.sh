#!/bin/bash

print_usage() {
    echo "Usage: ./goto.sh UNIV [hostname], example: ./goto.sh UNIV student_1"
    echo "	./goto.sh UNIV [switch_name], example: ./goto.sh UNIV CERN"
    echo "	./goto.sh [router_name] router, example: ./goto.sh ZURI router"
    echo "	./goto.sh [router_name] host, example: ./goto.sh ZURI host"
}

if [ "$#" -ne 2 ]; then
    print_usage
    exit 1
fi

readarray groups < ./mini_internet_project/platform/config/AS_config.txt
group_k=(${groups[$k]})
group_number="${group_k[0]}"

if [[ "$1" == *"UNIV"* ]]; then
    sudo docker exec -it ${group_number}_L2_UNIV_${2} bash
elif [[ "$2" == "router" ]]; then
    sudo docker exec -it ${group_number}_${1}router vtysh
elif [[ "$2" == "host" ]]; then
    sudo docker exec -it ${group_number}_${1}host bash
else
    echo "Error: Invalid arguments."
    print_usage
    exit 1
fi
