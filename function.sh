#!/bin/bash
Red="\033[31m"
Green="\033[32m"
Reset="\033[0m"

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo -e "${Red}You must be root to run this script."
    exit 1
fi

# Function to check if a command exists
Validate(){
  if [ $1 -ne 0 ]; then
    echo -e "${Red}  $2 is failure ${Reset}"
    exit 1
  else
    echo -e "${Green}  $2 is success${Reset}"
  fi
}

# Function to install a package using yum
yum install mysql-server -y
Validate $? "MySQL installation"

yum install postfix -y
Validate $? "Postfix installation"