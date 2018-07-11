#!/bin/bash

HOSTNAME1="zed"
HOSTNAME2="yasuo"

HOST1=172.16.1.235
HOST2=172.16.1.236

echo ""
echo "HOST $HOSTNAME1"
echo ""
ssh $HOST1 multipath -ll
echo ""

echo "----------------------------------------------"
echo ""

read -p "Viene aperto il file multipath.conf per settare il nome del volume (premere ENTER)"

scp $HOST1:/etc/multipath.conf /root/.multipath

vim /root/.multipath

scp /root/.multipath $HOST1:/etc/multipath.conf
ssh $HOST1 service multipath-tools reload

scp /root/.multipath $HOST2:/etc/multipath.conf
ssh $HOST2 service multipath-tools reload

echo ""
echo "Done!"
echo ""
