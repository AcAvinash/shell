# task: install multiple packages with single script
# user will pass the packages through command line arguments
# user shoul have root privileges to run this script
# while installing it should store the logs
# before installing it should check the package is already installed or not
# check successfully installed or not

#!/bin/bash

R="\033[31m"
G="\033[32m"
Y="\033[33m"
N="\033[0m"

DATE=$(date +"%Y-%m-%d %H:%M:%S")
SCRIPT_NAME=$0
LOGFILE="/tmp/${SCRIPT_NAME}_${DATE}.log"

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo -e "${R}You must be root to run this script.${N}"
    exit 1
fi
Validate(){
    if [ $? -ne 0 ]; then
        echo -e "${R} $2 is failed ${N}" 
        exit 1
    else
        echo -e "${G} $2 is successful ${N}" 
    fi
}

for i in "$@"
do
    yum list installed $i &>> $LOGFILE
    if [ $? -ne 0 ]; then
        yum install $i -y &>> $LOGFILE
        Validate $? "$i installation"
    else
        echo -e "${G}$i is already installed${N}"
    fi
done
