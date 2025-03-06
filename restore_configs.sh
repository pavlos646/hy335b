#!/bin/bash

echo "" > current_config.txt

readarray groups < ./mini_internet_project/platform/config/AS_config.txt
group_k=(${groups[$k]})
group_number="${group_k[0]}"

docker exec -i ${group_number}_ZURIrouter vtysh -c "show int brief" | grep "ZURI-L2" | awk '{if ($NF != "" && $NF != "default") print $1, $NF}' >> current_config.txt
docker exec -i ${group_number}_GENErouter vtysh -c "show int brief" | grep "GENE-L2" | awk '{if ($NF != "" && $NF != "default") print $1, $NF}' >> current_config.txt

input_file="routers_backup.txt"


declare -A current_ip_config

while IFS= read -r line; do
    interface=$(echo "$line" | awk '{print $1}')
    ip=$(echo "$line" | awk '{print $2}')
    
    if [[ -n "$ip" && "$ip" != "default" ]]; then
        current_ip_config["$interface"]="$ip"
    fi
done < "current_config.txt"

while IFS= read -r line; do
    if [[ "$line" =~ ^GENE ]]; then
        interface=$(echo "$line" | awk '{print $1}')
        backup_ip=$(echo "$line" | awk '{print $2}')
        
        if [[ -z "$backup_ip" || "${current_ip_config[$interface]}" == "$backup_ip" ]]; then
            continue
        fi
        
        echo "Configuring GENE interface: $interface with IP: $backup_ip"
        
        docker exec ${group_number}_GENErouter vtysh -c "conf t" \
            -c "interface $interface" \
            -c "no ip address ${current_ip_config[$interface]}" \
            -c "ip address $backup_ip" \
            -c "exit" \
            -c "exit" \
            -c "write"
    fi
done < "$input_file"

while IFS= read -r line; do
    if [[ "$line" =~ ^ZURI ]]; then
        interface=$(echo "$line" | awk '{print $1}')
        backup_ip=$(echo "$line" | awk '{print $2}')
        
        if [[ -z "$backup_ip" || "${current_ip_config[$interface]}" == "$backup_ip" ]]; then
            continue
        fi
        
        echo "Configuring ZURI interface: $interface with IP: $backup_ip"
        
        docker exec ${group_number}_ZURIrouter vtysh -c "conf t" \
            -c "interface $interface" \
            -c "no ip address ${current_ip_config[$interface]}" \
            -c "ip address $backup_ip" \
            -c "exit" \
            -c "exit" \
            -c "write"
    fi
done < "$input_file"

rm -f current_config.txt


input_file="hosts_backup.txt"

while IFS= read -r line; do
    # Read the next three lines
    read -r interface
    read -r ip_netmask
    read -r gateway

    line=$(echo "$line" | tr -d '\r')

    if [ "$interface" != "NOTHING" ] && [ "$ip_netmask" != "NOTHING" ]; then
        interface=$(echo "$interface" | tr -d '\r')
        ip=$(echo "$ip_netmask" | awk '{print $1}' | tr -d '\r')
        netmask=$(echo "$ip_netmask" | awk '{print $2}' | tr -d '\r')

        docker exec ${group_number}_$line bash -c "ifconfig $interface $ip netmask $netmask up" > /dev/null 2>&1
    fi

    if [ "$gateway" != "NOTHING" ]; then
        curr_conf=$(docker exec ${group_number}_$line bash -c "netstat -rn | awk '\$1 == \"0.0.0.0\" {print \$2, \$8}'") > /dev/null 2>&1
        curr_conf_array=($curr_conf)
        docker exec ${group_number}_$line bash -c "route del default gw ${curr_conf_array[0]} ${curr_conf_array[1]}" > /dev/null 2>&1

        gateway_ip=$(echo "$gateway" | awk '{print $1}' | tr -d '\r')
        gateway_interface=$(echo "$gateway" | awk '{print $2}' | tr -d '\r')

        docker exec ${group_number}_$line bash -c "route add default gw $gateway_ip $gateway_interface" > /dev/null 2>&1
    fi

done < "$input_file"