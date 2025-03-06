#!/bin/bash

# TODO: cleanup the previous saved config

readarray groups < ./mini_internet_project/platform/config/AS_config.txt
group_k=(${groups[$k]})
group_number="${group_k[0]}"

runner (){
    echo "$1" >> test.txt
    docker exec -it ${group_number}_$1 bash -c "
        ifconfig | awk '/^${group_number}-/ {print substr(\$1, 1, length(\$1)-1)}';
        ifconfig | grep -A1 "^${group_number}-" | awk '/inet / {print \$2}';
        netstat -rn | awk '\$1 == \"0.0.0.0\" {print \$2, \$8}'
    " >> test.txt
    echo -en "\n" >> test.txt
}

hosts=( "L2_UNIV_staff_1" 
        "L2_UNIV_staff_2" 
        "L2_UNIV_staff_3" 
        "L2_UNIV_student_1" 
        "L2_UNIV_student_2" 
        "L2_UNIV_student_3"
        "MIAMhost"
        "ATLAhost"
        "BOSThost"
        "NEWYhost"
        "PARIhost"
        "LONDhost"
        )

# for host in $hosts;do echo $host;done
for host in "${hosts[@]}"; do
    runner $host
done