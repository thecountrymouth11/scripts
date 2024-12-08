#!/bin/bash


<< help
This script takes a process/service as an argument and checks/monitors its status
help

read -p "What do you wish to do with your service $1: (status/pid)" choice

function check_status() {
	echo "Monitoring service $choice"
	sudo systemctl status $1
}

if [[ $choice == "status" ]];
then
	check_status $1
elif [[ $choice == "pid" ]];
then
	echo "process id of $1 $( pgrep $1 )"
else
	echo "wrong choice"
fi

