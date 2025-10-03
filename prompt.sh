#!/bin/bash
# Promt to read the input from user
echo "Enter your name: "
read USERNAME
echo "Hello, $USERNAME! Welcome to the bash scripting world."
echo "Enter your pasword:"
read -s PASSWORD
echo "Password for user $USERNAME is set $PASSWORD"
# Note: -s option is used to hide the input while typing the password
# -p option is used to prompt the user with a message