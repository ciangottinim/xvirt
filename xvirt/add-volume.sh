#!/bin/bash

TARGET=iqn.2018-04.rumble:multi

read -p "Volume size in GB: "
GB=$REPLY
read -p "Volume name: "
NAME=$REPLY

if [ ! -f /root/.last-lun ]; then
	NEWLUN=0
	echo $NEWLUN>/root/.last-lun
else
	LUN=$(cat /root/.last-lun)
	NEWLUN=$(($LUN + 1))
	echo $NEWLUN>/root/.last-lun
fi

zfs create -V "$GB"gb tank/volumes/$NAME

scstadmin -open_dev $NAME -handler vdisk_fileio -attributes filename=/dev/zvol/tank/volumes/$NAME,nv_cache=1

scstadmin -add_lun $NEWLUN -target $TARGET -driver iscsi -device $NAME

scstadmin -write_config .scstconf && cat .scstconf
