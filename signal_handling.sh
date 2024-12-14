#!/bin/bash


# function to handle the SIGINT (Ctrl+C)
handle_signal(){
	echo
	echo "Caught SIGINT (Ctrl+C). Cleaning up..."
	# adding cleanup commands here
	rm -f temp_file.txt
	echo "Cleanup complete. Exiting."
	exit 0
}

# trap SIGNAL and calling handle_signal function
trap handle_signal SIGINT

# simulating the work
echo "Creating a temporary file..."
touch temp_file.txt
echo "Temporary file created successfully: temp_file.txt"
echo "Script is running. Press (Ctrl + C) to stop it."

# Adding infinite loop to keep the script running
while true; do
	echo "Working... (Press Ctrl + C to stop)"
	sleep 5
done

