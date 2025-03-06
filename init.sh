#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <ASN>"
    exit 1
fi

if [[ "$1" =~ ^[0-9]+$ ]] && [ "$1" -ge 1 ] && [ "$1" -le 255 ]; then
    cd ./mini_internet_project/platform/docker_images/
    ./pull_images.sh
    cd ../
 	echo "${1}   AS  Config  router_config_full.txt    internal_links_config_full.txt    layer2_switches_config.txt          layer2_hosts_config.txt         layer2_links_config.txt" > config/AS_config.txt
	./startup.sh
else
    echo "Error: The argument must be an integer between 1 and 255."
    exit 2
fi
