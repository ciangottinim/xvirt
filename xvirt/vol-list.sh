#!/bin/bash

HOSTNAME1=zed
HOSTNAME2=yasuo
POOL=Volumes
HOST1=172.16.1.235
HOST2=172.16.1.236

ssh $HOST1 virsh pool-refresh $POOL
ssh $HOST2 virsh pool-refresh $POOL

echo ""
echo "Host $HOSTNAME1 volumes list"
echo ""
ssh $HOST1 virsh vol-list Volumes --details

sleep 5

echo ""
echo "Host $HOSTNAME2 volumes list"
echo ""
ssh $HOST2 virsh vol-list Volumes --details
