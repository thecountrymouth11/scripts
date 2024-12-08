#!/bin/bash


<< condition
This is a
demo of IF ELSE condition
in shell script
condition

read -p "Is it raining (Yes/No)" choice

if [[ $choice == "Yes" || $choice == "yes" ]];
then
	echo "Take an umbrella"
elif [[ $choice == "No" || $choice == "no" ]];
then
	echo "No need for umbrella"
else
	echo "You need to use either Yes or No"
fi

