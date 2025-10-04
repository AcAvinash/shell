
#!/bin/bash
# task: delete old logs from /home/ec2-user/app_logs

R="\033[31m"
G="\033[32m"
Y="\033[33m"
N="\033[0m"

APP_LOGS_DIR="/home/ec2-user/app_logs"
DATE=$(date +"%Y-%m-%d %H:%M:%S")
SCRIPT_NAME=$0
LOGSDIR=/home/ec2-user/shellscript_logs
LOGFILE="${LOGSDIR}/${SCRIPT_NAME}_${DATE}.log"
FILE_TO_DELETE=$(find $APP_LOGS_DIR -type f -name "*.log" -mtime +7)

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo -e "${R}You must be root to run this script.${N}"
    exit 1
fi  

while read line; do
    if [ -f "$line" ]; then
        rm -f "$line"
        if [ $? -eq 0 ]; then
            echo -e "${G}Deleted: $line${N}" | tee -a $LOGFILE
        else
            echo -e "${R}Failed to delete: $line${N}" | tee -a $LOGFILE
        fi
    else
        echo -e "${Y}No log files older than 7 days found.${N}" | tee -a $LOGFILE
    fi

done <<< "$FILE_TO_DELETE"