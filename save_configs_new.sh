#!/bin/bash

readarray groups < ./mini_internet_project/platform/config/AS_config.txt
group_k=(${groups[$k]})
group_number="${group_k[0]}"


dirname=configs_$(date +%m-%d-%Y_%H-%M-%S)
mkdir $dirname

run_as_router() {
    docker exec -i ${1}_${2}router vtysh -c "$3"
}

routers=( "LOND" 
          "ZURI" 
          "PARI" 
          "GENE" 
          "NEWY" 
          "BOST"
          "ATLA"
          "MIAM"
        )

for router in "${routers[@]}"; do
    run_as_router ${group_number} $router "show run" >> "$dirname/$router.txt"
done

zip ${dirname}.zip ${dirname}/*