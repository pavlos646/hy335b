#!/bin/bash

readarray groups < ./mini_internet_project/platform/config/AS_config.txt
group_k=(${groups[$k]})
group_number="${group_k[0]}"

echo "" > routers_backup.txt
docker exec -i ${group_number}_ZURIrouter vtysh -c "show int brief" | grep "ZURI-L2" | awk '{if ($NF != "" && $NF != "default") print $1, $NF}' >> routers_backup.txt
docker exec -i ${group_number}_GENErouter vtysh -c "show int brief" | grep "GENE-L2" | awk '{if ($NF != "" && $NF != "default") print $1, $NF}' >> routers_backup.txt

echo -n "" > hosts_backup.txt

runner (){
    echo "$1" >> hosts_backup.txt
    result1=$(docker exec -it ${group_number}_$1 bash -c "ifconfig | awk '/^${group_number}-/ {print substr(\$1, 1, length(\$1)-1)}'")
    if [ -z "$result1" ]; then
        echo "NOTHING" >> hosts_backup.txt
    else
        echo "$result1" >> hosts_backup.txt
    fi

    result2=$(docker exec -it ${group_number}_$1 bash -c "ifconfig | grep -A1 "^${group_number}-" | awk '/inet / {print \$2, \$4}';")
    if [ -z "$result2" ]; then
        echo "NOTHING" >> hosts_backup.txt
    else
        echo "$result2" >> hosts_backup.txt
    fi

    result3=$(docker exec -it ${group_number}_$1 bash -c "netstat -rn | awk '\$1 == \"0.0.0.0\" {print \$2, \$8}'")
    if [ -z "$result3" ]; then
        echo "NOTHING" >> hosts_backup.txt
    else
        echo "$result3" >> hosts_backup.txt
    fi
}

hosts=( "L2_UNIV_staff_1" 
        "L2_UNIV_staff_2" 
        "L2_UNIV_staff_3" 
        "L2_UNIV_student_1" 
        "L2_UNIV_student_2" 
        "L2_UNIV_student_3"
        )

# for host in $hosts;do echo $host;done
for host in "${hosts[@]}"; do
    runner $host
done

