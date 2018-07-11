#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo ""
read -p "xvirt > "

if [ $REPLY == "add-volume" ]; then
        xvirt-add-volume;
	exec xvirt;
elif [ $REPLY == "del-volume" ]; then
        xvirt-del-volume;
        exec xvirt;
elif [ $REPLY == "login" ]; then
        xvirt-login;
        exec xvirt;
elif [ $REPLY == "logout" ]; then
        xvirt-logout;
        exec xvirt;
elif [ $REPLY == "multipath-show" ]; then
        xvirt-multipath-show;
        exec xvirt;
elif [ $REPLY == "multipath-set" ]; then
        xvirt-multipath-set;
        exec xvirt;
elif [ $REPLY == "vm-list" ]; then
        xvirt-vm-list;
        exec xvirt;
elif [ $REPLY == "vol-list" ]; then
        xvirt-vol-list;
        exec xvirt;
elif [ $REPLY == "zfs-list" ]; then
        zfs list;
        exec xvirt;
elif [ $REPLY == "help" ]; then
	echo ""
	echo "|-------------------------------------------|"
	echo "| Aggiungi volume:          add-volume      |"
	echo "| Rimuovi volume:           del-volume      |"
	echo "| Login scst target:        login           |"
	echo "| Logout scst target:       logout          |"
	echo "| Lista device multipath:   multipath-show  |"
	echo "| Setta multipath:          multipath-set   |"
	echo "| Lista macchine virtuali:  vm-list         |"
	echo "| Lista volumi configurati: vol-list        |"
	echo "| Lista zfs:                zfs-list        |"
	echo "| Per uscire:               exit            |"
	echo "|-------------------------------------------|"
	echo ""
	exec xvirt;
elif [ $REPLY == "exit" ]; then
	exit;
else
	echo "";
	echo "Comando non esistente (help per lista comandi)";
	exec xvirt;
fi
