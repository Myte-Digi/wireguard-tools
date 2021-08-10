#!/bin/bash
#sh ../wireguard-admin/wireguard-api/wireguard_scripts/fake_peers2.sh
#rm -rf ./wg0/client-*  && WGCG_CONFIG_FILE=server1.conf ./wgcg.sh -s
SUB_IP=0
SUB_SUB_IP=0
for i in {1..10000}
do
    IP="$(grep "/32" ./wg0/server-wg0.conf | tail -n1 | awk '{print $3}' | cut -d "/" -f 1 | cut -d "." -f 4)"
    echo "IP=${IP}"
    if [ -z "$IP" ]
    then
      IP=1
    fi

    if [ "$IP" -gt "254" ]
    then
      IP=0
    fi

    NEXT_IP=$((IP+1)) && WGCG_CONFIG_FILE=server1.conf ./wgcg.sh -c "user${SUB_IP}-${NEXT_IP}" "10.${SUB_SUB_IP}.${SUB_IP}.${NEXT_IP}"
    echo "NEXT_IP=$NEXT_IP"


    if [ "$NEXT_IP" -gt "254" ]
    then
      SUB_IP=$((SUB_IP+1))
      echo "SUB_IP=${SUB_IP}"
    fi


    if [ "$SUB_IP" -gt "254" ]
    then
      SUB_SUB_IP=$((SUB_SUB_IP+1))
      echo "SUB_SUB_IP=${SUB_SUB_IP}"
    fi
done

