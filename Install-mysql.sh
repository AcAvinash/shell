#!/bin/bash

 Red: \033[31m
 Green: \033[32m

USERID=$(id -u)
if [ $USERID -ne 0]; then
    echo "$Red You must enter as root user"
    exit 1
fi
echo "You are root user"
yum install mysql-server -y

if [ $? -eq 0 ]; then
    echo "$Green MySQL installation completed successfully."
else
    echo "$Red MySQL installation failed."
    exit 1
fi

yum install postfix -y
if [ $? -eq 0 ]; then
    echo "$Green Postfix installation completed successfully."
else
    echo "$Red Postfix installation failed."
    exit 1
fi