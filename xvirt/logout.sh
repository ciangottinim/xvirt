#!/bin/bash

TARGET=iqn.2018-04.rumble:multi
HOST1=172.16.1.235
HOST2=172.16.1.236

ssh $HOST1 iscsiadm -m node --targetname=$TARGET --logout
sleep 5
ssh $HOST2 iscsiadm -m node --targetname=$TARGET --logout

echo ""
echo "Done!"
echo ""
