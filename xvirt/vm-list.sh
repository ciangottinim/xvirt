#!/bin/bash

HOST1=172.16.1.235
HOST2=172.16.1.236
HOSTNAME1="zed"
HOSTNAME2="yasuo"

echo ""
echo "Lista macchine virtuali host $HOSTNAME1:"
echo ""

ssh $HOST1 virsh list

echo "----------------------------------------------------"
echo ""

echo "Lista macchine virtuali host $HOSTNAME2:"
echo ""

ssh $HOST2 virsh list

echo "----------------------------------------------------"
echo ""
