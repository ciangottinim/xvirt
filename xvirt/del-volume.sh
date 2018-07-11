#!/bin/bash

TARGET=iqn.2018-04.rumble:multi

scstadmin -write_config .scstconf && cat .scstconf

read -p "Lun to remove: "
LUN=$REPLY

read -p "Device to remove: "
DEVICE=$REPLY

scstadmin -rem_lun $LUN -driver iscsi -target $TARGET

scstadmin -close_dev $DEVICE -handler vdisk_fileio

read -p "Remove zvol from disk? (y/n) "
if [ $REPLY == "y" ] || [ $REPLY == "Y" ] || [ $REPLY == "yes" ]; then
        zfs destroy tank/volumes/$DEVICE;
fi

scstadmin -write_config .scstconf && cat .scstconf

read -p "Now opening last-lun to modify it (press ENTER to continue)"

vim /root/.last-lun
