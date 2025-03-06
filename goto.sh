#!/bin/bash

readarray groups < ./mini_internet_project/platform/config/AS_config.txt
group_k=(${groups[$k]})
group_number="${group_k[0]}"

sudo docker exec -it ${group_number}_L2_UNIV_${2} bash