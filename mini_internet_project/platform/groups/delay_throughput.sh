#!/bin/bash
tc qdisc add dev 28abfae9aab55_l root netem delay 1000 
echo -n " -- set interface 28abfae9aab55_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 044ff3f776a95_l root netem delay 1000 
echo -n " -- set interface 044ff3f776a95_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 95e77be050a15_l root netem delay 1000 
echo -n " -- set interface 95e77be050a15_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 97c55e2530215_l root netem delay 1000 
echo -n " -- set interface 97c55e2530215_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev e9cee8418e235_l root netem delay 1000 
echo -n " -- set interface e9cee8418e235_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev fa6e3e508d0c5_l root netem delay 1000 
echo -n " -- set interface fa6e3e508d0c5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
echo -n " -- set interface tap_g55_vpn_1 ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev tap_g55_vpn_1 root netem delay 1000 
tc qdisc add dev fff5d3c25c5d5_l root netem delay 1000 
echo -n " -- set interface fff5d3c25c5d5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev d405209c6d6d5_l root netem delay 1000 
echo -n " -- set interface d405209c6d6d5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev a3ca625814af5_l root netem delay 1000 
echo -n " -- set interface a3ca625814af5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 1254e9f30fc05_l root netem delay 1000 
echo -n " -- set interface 1254e9f30fc05_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev d04d8241b3895_l root netem delay 1000 
echo -n " -- set interface d04d8241b3895_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 6bfd8b698be75_l root netem delay 1000 
echo -n " -- set interface 6bfd8b698be75_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev c01e0645ac235_l root netem delay 1000 
echo -n " -- set interface c01e0645ac235_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 2226ee9a9a0b5_l root netem delay 1000 
echo -n " -- set interface 2226ee9a9a0b5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 469a7cec7dd15_l root netem delay 1000 
echo -n " -- set interface 469a7cec7dd15_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 72ceb5902f935_l root netem delay 1000 
echo -n " -- set interface 72ceb5902f935_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 4351d5b11d8f5_l root netem delay 1000 
echo -n " -- set interface 4351d5b11d8f5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 927fa039cc0e5_l root netem delay 1000 
echo -n " -- set interface 927fa039cc0e5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
echo -n " -- set interface tap_g55_vpn_3 ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev tap_g55_vpn_3 root netem delay 1000 
echo -n " -- set interface 0ae3065de5ad5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
echo -n " -- set interface 11ed003cfc5a5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
echo -n " -- set interface 309b94a931805_l ingress_policing_rate=10000 " >> groups/throughput.sh 
echo -n " -- set interface 707b0abb02aa5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 8fdda6b3ce365_l root netem delay 100 
echo -n " -- set interface 8fdda6b3ce365_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 3a693008f5f85_l root netem delay 100 
echo -n " -- set interface 3a693008f5f85_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 9659af376ea95_l root netem delay 1000 
echo -n " -- set interface 9659af376ea95_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 35c07aa7dddc5_l root netem delay 1000 
echo -n " -- set interface 35c07aa7dddc5_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 37545494627b5_l root netem delay 20 
echo -n " -- set interface 37545494627b5_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 47353ab69a675_l root netem delay 20 
echo -n " -- set interface 47353ab69a675_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev eeeb0f88d4055_l root netem delay 20 
echo -n " -- set interface eeeb0f88d4055_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 4f7cbc6703a75_l root netem delay 20 
echo -n " -- set interface 4f7cbc6703a75_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 2de634cec6275_l root netem delay 1000 
echo -n " -- set interface 2de634cec6275_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 89fc122ec6775_l root netem delay 1000 
echo -n " -- set interface 89fc122ec6775_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 1038230c7dd25_l root netem delay 50 
echo -n " -- set interface 1038230c7dd25_l ingress_policing_rate=1000 " >> groups/throughput.sh 
tc qdisc add dev 72b97822858a5_l root netem delay 50 
echo -n " -- set interface 72b97822858a5_l ingress_policing_rate=1000 " >> groups/throughput.sh 
tc qdisc add dev bd54c93f27555_l root netem delay 10000 
echo -n " -- set interface bd54c93f27555_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 279d512f3fdd5_l root netem delay 10000 
echo -n " -- set interface 279d512f3fdd5_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev e30fd3f89d1f5_l root netem delay 100 
echo -n " -- set interface e30fd3f89d1f5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 1182ac91595a5_l root netem delay 100 
echo -n " -- set interface 1182ac91595a5_l ingress_policing_rate=10000 " >> groups/throughput.sh 
tc qdisc add dev 900701b7a49b5_l root netem delay 100 
echo -n " -- set interface 900701b7a49b5_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 53c813eeae785_l root netem delay 100 
echo -n " -- set interface 53c813eeae785_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev c5c4518768025_l root netem delay 10 
echo -n " -- set interface c5c4518768025_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev f24c9fc80b575_l root netem delay 10 
echo -n " -- set interface f24c9fc80b575_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 5c44a41059a45_l root netem delay 100 
echo -n " -- set interface 5c44a41059a45_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev d0d77a4ab0bc5_l root netem delay 100 
echo -n " -- set interface d0d77a4ab0bc5_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev c782691b4d6d5_l root netem delay 10 
echo -n " -- set interface c782691b4d6d5_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev ac678dff1e655_l root netem delay 10 
echo -n " -- set interface ac678dff1e655_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev d316d67398895_l root netem delay 100 
echo -n " -- set interface d316d67398895_l ingress_policing_rate=100000 " >> groups/throughput.sh 
tc qdisc add dev 7adfed1c16df5_l root netem delay 100 
echo -n " -- set interface 7adfed1c16df5_l ingress_policing_rate=100000 " >> groups/throughput.sh 
wait
