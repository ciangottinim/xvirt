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

sleep 5

echo ""
echo ""
echo "HOST $HOSTNAME2"
echo ""
ssh $HOST2 multipath -ll
echo ""

echo "----------------------------------------------"
echo ""
