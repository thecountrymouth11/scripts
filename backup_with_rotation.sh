#!/bin/bash

#checking if directory path is provided
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <directory_path>"
	exit 1
fi

#get the directory path
dir_path="$1"

#checking if directory exists
if [ ! -d "$dir_path" ]; then
	echo "Error: Directory $dir_path does not exist."
	exit 1
fi

#creating a timestamped backup folder
timestamp=$(date +"%Y-%m-%d-%H-%M-%S") 
backup_dir="$dir_path/backup_$timestamp"

mkdir "$backup_dir"
if [ $? -ne 0 ]; then
	echo "Error: Failed to create backup directory."
	exit 1
fi

#copying all files, including hidden ones,  form directory to backup directory
shopt -s dotglob nullglob #including hidden files nad handling emoty directories
cp -r "$dir_path"/* "$backup_dir" 2>/dev/null
shopt -s dotglob nullglob #reset shell options

if [ $? -eq 0 ]; then
	echo "Backup created: $backup_dir"
else
	echo "Warning: No files to backup or an error occurred."
fi

#Implementing backup rotation (last 3 backups only)
backup_dirs=($(ls -dt "$dir_path"/backup_* 2>/dev/null))

if [ ${#backup_dirs[@]} -gt 3 ]; then
	for ((i=3; i<${#backup_dirs[@]}; i++)); do
		rm -rf "${backup_dirs[$i]}"
		echo "Old backup removed: ${backup_dirs[$i]}"
	done
fi

exit 0

