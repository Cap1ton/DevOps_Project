#!/bin/bash

HOSTNAME="HOSTNAME = $(hostname)"
echo "$HOSTNAME"

TIMEZONE="TIMEZONE = $(cat /etc/timezone) $(date -u +"%Z") $(date +"%z")"
echo "$TIMEZONE"

USER="USER = $(whoami)"
echo "$USER"

OS="OS = $(cat /etc/issue | awk '{printf "%s %s %s", $1, $2, $3}')"
echo "$OS"

DATE="DATE = $(date +"%d %h %Y %H:%M:%S")"
echo "$DATE"

UPTIME="UPTIME = $(uptime -p | awk '{print $2,$3,$4,$5}')"
echo "$UPTIME"

UPTIME_SEC="UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}') sec"
echo "$UPTIME_SEC"

IP="IP = $(hostname -I)"
echo "$IP"

MASK="$(ip a | grep -e "global")"
MASK=${MASK#*/}
MASK=${MASK%% *}
MASK="MASK = $(cat mask.txt | grep -w $MASK | awk '{print $2}')"
echo "$MASK"

GATEWAY="GATEWAY = $(ip r | grep default | awk '{print $3}')"
echo "$GATEWAY"

RAM_TOTAL="REM_TOTAL = $(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')"
echo "$RAM_TOTAL"

RAM_USED="REM_USED = $(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')"
echo "$RAM_USED"

RAM_FREE="REM_FREE = $(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')"
echo "$RAM_FREE"

SPACE_ROOT="SPACE_ROOT = $(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')"
echo "$SPACE_ROOT"

SPACE_ROOT_USED="SPACE_ROOT_USED = $(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')"
echo "$SPACE_ROOT_USED"

SPACE_ROOT_FREE="SPACE_ROOT_FREE = $(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')"
echo "$SPACE_ROOT_FREE"

