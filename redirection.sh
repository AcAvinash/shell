#!/bin/bash

Red="\033[31m"
Green="\033[32m"
Reset="\033[0m"

DATE=$(date +"%Y-%m-%d %H:%M:%S")
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME_$DATE.log

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo -e "${Red}You must be root to run this script.${Reset}"
    exit 1
fi

Validate(){
    if [ $? -ne 0 ]; then
        echo -e "${Red} $2 is failed ${Reset}" &>> $LOGFILE    
        exit 1
    else
        echo -e "${Green} $2 is successful ${Reset}" &>> $LOGFILE
    fi
}

yum install mysql-server -y &>> $LOGFILE
Validate $? "MySQL installation"

yum install postfix -y &>> $LOGFILE
Validate $? "Postfix installation"