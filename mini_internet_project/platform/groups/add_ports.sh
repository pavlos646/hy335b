#!/bin/bash
ovs-vsctl -- add-port 55-host eb582fd42df75_l \
-- set interface eb582fd42df75_l external_ids:container_id=55_LONDrouter external_ids:container_iface=host \
-- add-port 55-host 265e2a1fa4365_l \
-- set interface 265e2a1fa4365_l external_ids:container_id=55_LONDhost external_ids:container_iface=LONDrouter \
-- add-port 55-host 5f3d993226c45_l \
-- set interface 5f3d993226c45_l external_ids:container_id=55_PARIrouter external_ids:container_iface=host \
-- add-port 55-host 00865122ff485_l \
-- set interface 00865122ff485_l external_ids:container_id=55_PARIhost external_ids:container_iface=PARIrouter \
-- add-port 55-host 7681ab39c2ae5_l \
-- set interface 7681ab39c2ae5_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=host \
-- add-port 55-host 2734334e88cc5_l \
-- set interface 2734334e88cc5_l external_ids:container_id=55_NEWYhost external_ids:container_iface=NEWYrouter \
-- add-port 55-host 23ea4998c0bf5_l \
-- set interface 23ea4998c0bf5_l external_ids:container_id=55_BOSTrouter external_ids:container_iface=host \
-- add-port 55-host 4d94041d35085_l \
-- set interface 4d94041d35085_l external_ids:container_id=55_BOSThost external_ids:container_iface=BOSTrouter \
-- add-port 55-host 9e2fa5e8627b5_l \
-- set interface 9e2fa5e8627b5_l external_ids:container_id=55_ATLArouter external_ids:container_iface=host \
-- add-port 55-host d42b98a44e0e5_l \
-- set interface d42b98a44e0e5_l external_ids:container_id=55_ATLAhost external_ids:container_iface=ATLArouter \
-- add-port 55-host 75889f599e385_l \
-- set interface 75889f599e385_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=host \
-- add-port 55-host 4f6eac3ab13c5_l \
-- set interface 4f6eac3ab13c5_l external_ids:container_id=55_MIAMhost external_ids:container_iface=MIAMrouter \
-- add-port l2-55 28abfae9aab55_l \
-- set interface 28abfae9aab55_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=55-CERN \
-- add-port l2-55 044ff3f776a95_l \
-- set interface 044ff3f776a95_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=55-ETHZ \
-- add-port l2-55 95e77be050a15_l \
-- set interface 95e77be050a15_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=55-EPFL \
-- add-port l2-55 97c55e2530215_l \
-- set interface 97c55e2530215_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=55-ETHZ \
-- add-port l2-55 e9cee8418e235_l \
-- set interface e9cee8418e235_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=55-EPFL \
-- add-port l2-55 fa6e3e508d0c5_l \
-- set interface fa6e3e508d0c5_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=55-CERN \
-- add-port l2-55 fff5d3c25c5d5_l \
-- set interface fff5d3c25c5d5_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=55-student_1 \
-- add-port l2-55 d405209c6d6d5_l \
-- set interface d405209c6d6d5_l external_ids:container_id=55_L2_UNIV_student_1 external_ids:container_iface=55-CERN \
-- add-port l2-55 a3ca625814af5_l \
-- set interface a3ca625814af5_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=55-staff_1 \
-- add-port l2-55 1254e9f30fc05_l \
-- set interface 1254e9f30fc05_l external_ids:container_id=55_L2_UNIV_staff_1 external_ids:container_iface=55-CERN \
-- add-port l2-55 d04d8241b3895_l \
-- set interface d04d8241b3895_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=55-student_2 \
-- add-port l2-55 6bfd8b698be75_l \
-- set interface 6bfd8b698be75_l external_ids:container_id=55_L2_UNIV_student_2 external_ids:container_iface=55-ETHZ \
-- add-port l2-55 c01e0645ac235_l \
-- set interface c01e0645ac235_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=55-staff_2 \
-- add-port l2-55 2226ee9a9a0b5_l \
-- set interface 2226ee9a9a0b5_l external_ids:container_id=55_L2_UNIV_staff_2 external_ids:container_iface=55-ETHZ \
-- add-port l2-55 469a7cec7dd15_l \
-- set interface 469a7cec7dd15_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=55-student_3 \
-- add-port l2-55 72ceb5902f935_l \
-- set interface 72ceb5902f935_l external_ids:container_id=55_L2_UNIV_student_3 external_ids:container_iface=55-EPFL \
-- add-port l2-55 4351d5b11d8f5_l \
-- set interface 4351d5b11d8f5_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=55-staff_3 \
-- add-port l2-55 927fa039cc0e5_l \
-- set interface 927fa039cc0e5_l external_ids:container_id=55_L2_UNIV_staff_3 external_ids:container_iface=55-EPFL \
-- add-port l2-55 0ae3065de5ad5_l \
-- set interface 0ae3065de5ad5_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=ZURI-L2 \
-- add-port l2-55 11ed003cfc5a5_l \
-- set interface 11ed003cfc5a5_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=ZURIrouter \
-- add-port l2-55 309b94a931805_l \
-- set interface 309b94a931805_l external_ids:container_id=55_GENErouter external_ids:container_iface=GENE-L2 \
-- add-port l2-55 707b0abb02aa5_l \
-- set interface 707b0abb02aa5_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=GENErouter \
-- add-port int-55 8fdda6b3ce365_l \
-- set interface 8fdda6b3ce365_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=port_PARI \
-- add-port int-55 3a693008f5f85_l \
-- set interface 3a693008f5f85_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_ZURI \
-- add-port int-55 9659af376ea95_l \
-- set interface 9659af376ea95_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=port_LOND \
-- add-port int-55 35c07aa7dddc5_l \
-- set interface 35c07aa7dddc5_l external_ids:container_id=55_LONDrouter external_ids:container_iface=port_ZURI \
-- add-port int-55 37545494627b5_l \
-- set interface 37545494627b5_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_GENE \
-- add-port int-55 47353ab69a675_l \
-- set interface 47353ab69a675_l external_ids:container_id=55_GENErouter external_ids:container_iface=port_PARI \
-- add-port int-55 eeeb0f88d4055_l \
-- set interface eeeb0f88d4055_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_LOND \
-- add-port int-55 4f7cbc6703a75_l \
-- set interface 4f7cbc6703a75_l external_ids:container_id=55_LONDrouter external_ids:container_iface=port_PARI \
-- add-port int-55 2de634cec6275_l \
-- set interface 2de634cec6275_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_NEWY \
-- add-port int-55 89fc122ec6775_l \
-- set interface 89fc122ec6775_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_PARI \
-- add-port int-55 1038230c7dd25_l \
-- set interface 1038230c7dd25_l external_ids:container_id=55_PARIrouter external_ids:container_iface=port_MIAM \
-- add-port int-55 72b97822858a5_l \
-- set interface 72b97822858a5_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=port_PARI \
-- add-port int-55 bd54c93f27555_l \
-- set interface bd54c93f27555_l external_ids:container_id=55_LONDrouter external_ids:container_iface=port_BOST \
-- add-port int-55 279d512f3fdd5_l \
-- set interface 279d512f3fdd5_l external_ids:container_id=55_BOSTrouter external_ids:container_iface=port_LOND \
-- add-port int-55 e30fd3f89d1f5_l \
-- set interface e30fd3f89d1f5_l external_ids:container_id=55_LONDrouter external_ids:container_iface=port_NEWY \
-- add-port int-55 1182ac91595a5_l \
-- set interface 1182ac91595a5_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_LOND \
-- add-port int-55 900701b7a49b5_l \
-- set interface 900701b7a49b5_l external_ids:container_id=55_GENErouter external_ids:container_iface=port_MIAM \
-- add-port int-55 53c813eeae785_l \
-- set interface 53c813eeae785_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=port_GENE \
-- add-port int-55 c5c4518768025_l \
-- set interface c5c4518768025_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_BOST \
-- add-port int-55 f24c9fc80b575_l \
-- set interface f24c9fc80b575_l external_ids:container_id=55_BOSTrouter external_ids:container_iface=port_NEWY \
-- add-port int-55 5c44a41059a45_l \
-- set interface 5c44a41059a45_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_ATLA \
-- add-port int-55 d0d77a4ab0bc5_l \
-- set interface d0d77a4ab0bc5_l external_ids:container_id=55_ATLArouter external_ids:container_iface=port_NEWY \
-- add-port int-55 c782691b4d6d5_l \
-- set interface c782691b4d6d5_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=port_MIAM \
-- add-port int-55 ac678dff1e655_l \
-- set interface ac678dff1e655_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=port_NEWY \
-- add-port int-55 d316d67398895_l \
-- set interface d316d67398895_l external_ids:container_id=55_ATLArouter external_ids:container_iface=port_MIAM \
-- add-port int-55 7adfed1c16df5_l \
-- set interface 7adfed1c16df5_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=port_ATLA \
-- add-port ssh_to_group cce5f40b9a135_l \
-- set interface cce5f40b9a135_l external_ids:container_id=MEASUREMENT external_ids:container_iface=ssh_in \
-- add-port measurement 12dc3828879f5_l \
-- set interface 12dc3828879f5_l external_ids:container_id=MEASUREMENT external_ids:container_iface=group_55 \
-- add-port measurement fa08705c29255_l \
-- set interface fa08705c29255_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=measurement_55 \
-- add-port 55-ssh 62b34772fe115_l \
-- set interface 62b34772fe115_l external_ids:container_id=55_ssh external_ids:container_iface=ssh \
-- add-port ssh_to_group 619ed3792e685_l \
-- set interface 619ed3792e685_l external_ids:container_id=55_ssh external_ids:container_iface=ssh_in \
-- add-port 55-ssh bb18fc4af5c45_l \
-- set interface bb18fc4af5c45_l external_ids:container_id=55_LONDrouter external_ids:container_iface=ssh \
-- add-port 55-ssh 7261853c55065_l \
-- set interface 7261853c55065_l external_ids:container_id=55_LONDhost external_ids:container_iface=ssh \
-- add-port 55-ssh 56f51f71b5f65_l \
-- set interface 56f51f71b5f65_l external_ids:container_id=55_ZURIrouter external_ids:container_iface=ssh \
-- add-port 55-ssh 9d46365c7f005_l \
-- set interface 9d46365c7f005_l external_ids:container_id=55_L2_UNIV_CERN external_ids:container_iface=ssh \
-- add-port 55-ssh f431075f3cd25_l \
-- set interface f431075f3cd25_l external_ids:container_id=55_L2_UNIV_ETHZ external_ids:container_iface=ssh \
-- add-port 55-ssh 86736330428a5_l \
-- set interface 86736330428a5_l external_ids:container_id=55_L2_UNIV_EPFL external_ids:container_iface=ssh \
-- add-port 55-ssh 61d9ab2ee4055_l \
-- set interface 61d9ab2ee4055_l external_ids:container_id=55_L2_UNIV_student_1 external_ids:container_iface=ssh \
-- add-port 55-ssh f67821fceaef5_l \
-- set interface f67821fceaef5_l external_ids:container_id=55_L2_UNIV_staff_1 external_ids:container_iface=ssh \
-- add-port 55-ssh f66dce8ae6705_l \
-- set interface f66dce8ae6705_l external_ids:container_id=55_L2_UNIV_student_2 external_ids:container_iface=ssh \
-- add-port 55-ssh c8140c4f3bf15_l \
-- set interface c8140c4f3bf15_l external_ids:container_id=55_L2_UNIV_staff_2 external_ids:container_iface=ssh \
-- add-port 55-ssh ff6b5465ad495_l \
-- set interface ff6b5465ad495_l external_ids:container_id=55_L2_UNIV_student_3 external_ids:container_iface=ssh \
-- add-port 55-ssh 7889d19beef95_l \
-- set interface 7889d19beef95_l external_ids:container_id=55_L2_UNIV_staff_3 external_ids:container_iface=ssh \
-- add-port 55-ssh 15bb69d485765_l \
-- set interface 15bb69d485765_l external_ids:container_id=55_PARIrouter external_ids:container_iface=ssh \
-- add-port 55-ssh 92a3976440b15_l \
-- set interface 92a3976440b15_l external_ids:container_id=55_PARIhost external_ids:container_iface=ssh \
-- add-port 55-ssh a1c9e97f67f05_l \
-- set interface a1c9e97f67f05_l external_ids:container_id=55_GENErouter external_ids:container_iface=ssh \
-- add-port 55-ssh 64cda697adcc5_l \
-- set interface 64cda697adcc5_l external_ids:container_id=55_NEWYrouter external_ids:container_iface=ssh \
-- add-port 55-ssh a244b71954ca5_l \
-- set interface a244b71954ca5_l external_ids:container_id=55_NEWYhost external_ids:container_iface=ssh \
-- add-port 55-ssh dfae9e4b1a245_l \
-- set interface dfae9e4b1a245_l external_ids:container_id=55_BOSTrouter external_ids:container_iface=ssh \
-- add-port 55-ssh 2b785d24b1025_l \
-- set interface 2b785d24b1025_l external_ids:container_id=55_BOSThost external_ids:container_iface=ssh \
-- add-port 55-ssh eebd352f357d5_l \
-- set interface eebd352f357d5_l external_ids:container_id=55_ATLArouter external_ids:container_iface=ssh \
-- add-port 55-ssh 503015395bf65_l \
-- set interface 503015395bf65_l external_ids:container_id=55_ATLAhost external_ids:container_iface=ssh \
-- add-port 55-ssh 28b3264884f85_l \
-- set interface 28b3264884f85_l external_ids:container_id=55_MIAMrouter external_ids:container_iface=ssh \
-- add-port 55-ssh 135a08f85afd5_l \
-- set interface 135a08f85afd5_l external_ids:container_id=55_MIAMhost external_ids:container_iface=ssh \
-- add-port matrix 03afe22d055f5_l \
-- set interface 03afe22d055f5_l external_ids:container_id=MATRIX external_ids:container_iface=group_55 \
-- add-port matrix 41dedabbd4d85_l \
-- set interface 41dedabbd4d85_l external_ids:container_id=55_PARIrouter external_ids:container_iface=matrix_55 \
-- add-port dns 79f91a12c0775_l \
-- set interface 79f91a12c0775_l external_ids:container_id=DNS external_ids:container_iface=group_55 \
-- add-port dns 4cc5f2fbd7465_l \
-- set interface 4cc5f2fbd7465_l external_ids:container_id=55_LONDrouter external_ids:container_iface=dns_55 \
-- add-port dns_measurement 40716f1032135_l \
-- set interface 40716f1032135_l external_ids:container_id=DNS external_ids:container_iface=measurement \
-- add-port dns_measurement 6d3bbfb84abe5_l \
-- set interface 6d3bbfb84abe5_l external_ids:container_id=MEASUREMENT external_ids:container_iface=dns \
