#!/bin/bash
ovs-vsctl -- add-br 55-host -- add-br l2-55 -- add-br int-55 -- add-br measurement -- add-br ssh_to_group -- add-br 55-ssh -- add-br matrix -- add-br dns -- add-br dns_measurement 