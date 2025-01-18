#!/bin/bash

#writing update system script using conditionals

release_file=/etc/os-release

if grep -q "Arch" $release_file
then
	# if host os is based on Arch
	sudo pacman -Syu
fi

if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file
then
	# if host os is based on Debian or Ubuntu
	sudo apt update
	sudo apt dist-upgrade
fi

