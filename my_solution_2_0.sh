#!/bin/bash

# welcome message
echo "Welcome to the Interactive File and Directory Explorer!"

while true; do
	# list all files and directories in the current path
	echo "Files and Directories inthe Current Path:"
	ls -lh | awk '{
	if (NR > 1) { # skip the first line (total size)
		printf "- %s %s %s\n", $9, $5, ($1 ~ /^d/ ? "(Directory)" : "")
	}
}'

	# prompt for input
	read -r -p "Enter a line of text (Press Enter without text to exit): " input
	# exit if the user enters an empty string
	if [ -z "$input" ]; then
		echo "Exiting the Interactive Explorer. Goodbye!"
		break
	fi

	# calculate and print the character count for the input line
	char_count=$(echo -n "$input" | wc -m)
	echo "Character Count: $char_count"
done

