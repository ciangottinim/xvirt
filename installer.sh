#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

rm -rf /etc/xvirt

echo ""
echo "Copio gli eseguibili"
echo ""
cp -r xvirt /etc/

# AGGIUNGI PERSONALIZZAZIONE E CONFIGURAZIONE

echo ""
echo "Installazione xvirt in corso..."
echo ""
ln -s /etc/xvirt/add-volume.sh /usr/bin/xvirt-add-volume
ln -s /etc/xvirt/del-volume.sh /usr/bin/xvirt-del-volume
ln -s /etc/xvirt/login.sh /usr/bin/xvirt-login
ln -s /etc/xvirt/logout.sh /usr/bin/xvirt-logout
ln -s /etc/xvirt/multipath-set.sh /usr/bin/xvirt-multipath-set
ln -s /etc/xvirt/multipath-show.sh /usr/bin/xvirt-multipath-show
ln -s /etc/xvirt/vm-list.sh /usr/bin/xvirt-vm-list
ln -s /etc/xvirt/vol-list.sh /usr/bin/xvirt-vol-list
ln -s /etc/xvirt/xvirt.sh /usr/bin/xvirt
sleep 5

echo "Done!"
