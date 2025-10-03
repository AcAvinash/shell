#!/bin/bash

Red="\033[31m"
Green="\033[32m"
Reset="\033[0m"

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo -e "${Red}You must enter as root user${Reset}"
    exit 1
fi
echo "You are root user"

yum install mysql-server -y
if [ $? -eq 0 ]; then
    echo -e "${Green}MySQL installation completed successfully.${Reset}"
else
    echo -e "${Red}MySQL installation failed.${Reset}"
    exit 1
fi

yum install postfix -y
if [ $? -eq 0 ]; then
    echo -e "${Green}Postfix installation completed successfully.${Reset}"
else
    echo -e "${Red}Postfix installation failed.${Reset}"
    exit 1
fi
