#!/bin/bash

#TASK-1: Comments
#This is a single line comment
<< comment
this is a
multi-line comment
and the naming could be anything
comment

#TASK-2: Echo
echo "Hi, This is my day-1 practising scripting."

#TASK-3: Variables
name="tarun"
age=28

#TASK-4: Using Variables
echo "Hi, my name is $name, and I am $age years old!"

#TASK-5 Using Built-in Variables
echo "This is a user $USER"
echo "My current bash path $BASH"
echo "My present working directory $PWD"

#TASK-6 Wildcards
echo "Listing all files with extension 'sh'"
ls *.sh
