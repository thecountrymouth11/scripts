#!/bin/bash

# default value for a parameter
password=${1:-"Password"}

# length of a parameter
length=${#password}

# default value if input is empty
greetings=${2:-"Hello"}

# adding strings using parameter expansion
message="$greetings, $password. Your password has $length characters"

# printing output
echo "$message"

# demonstrate replacing part of the string
updated_password=${password/Password/Passwd}
echo "updated password: $updated_password"

# showing fallback to default if no input
echo "Default: ${3:-No input provided}"

