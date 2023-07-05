#!/bin/bash

head=$(tput setab $1)$(tput setaf $2)
desc=$(tput setab $3)$(tput setaf $4)
normal=$(tput sgr0)

HOSTNAME="${head}HOSTNAME${normal} = ${desc}$(hostname)${normal}"
echo "$HOSTNAME"

TIMEZONE="${head}TIMEZONE${normal} = ${desc}$(cat /etc/timezone) $(date -u +"%Z") $(date +"%z")${normal}"
echo "$TIMEZONE"

USER="${head}USER${normal} = ${desc}$(whoami)${normal}"
echo "$USER"

OS="${head}OS${normal} = ${desc}$(cat /etc/issue | awk '{printf "%s %s %s", $1, $2, $3}')${normal}"
echo "$OS"

DATE="${head}DATE${normal} = ${desc}$(date +"%d %h %Y %H:%M:%S")${normal}"
echo "$DATE"

UPTIME="${head}UPTIME${normal} = ${desc}$(uptime -p | awk '{print $2,$3,$4,$5}')${normal}"
echo "$UPTIME"

UPTIME_SEC="${head}UPTIME_SEC${normal} = ${desc}$(cat /proc/uptime | awk '{print $1}') sec${normal}"
echo "$UPTIME_SEC"

IP="${head}IP${normal} = ${desc}$(hostname -I)${normal}"
echo "$IP"

MASK="${head}$(ip a | grep -e "global")${normal}"
MASK=${MASK#*/}
MASK=${MASK%% *}
MASK="${head}MASK${normal} = ${desc}$(cat mask.txt | grep -w $MASK | awk '{print $2}')${normal}"
echo "$MASK"

GATEWAY="${head}GATEWAY${normal} = ${desc}$(ip r | grep default | awk '{print $3}')${normal}"
echo "$GATEWAY"

RAM_TOTAL="${head}REM_TOTAL${normal} = ${desc}$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')${normal}"
echo "$RAM_TOTAL"

RAM_USED="${head}REM_USED${normal} = ${desc}$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')${normal}"
echo "$RAM_USED"

RAM_FREE="${head}REM_FREE${normal} = ${desc}$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')${normal}"
echo "$RAM_FREE"

SPACE_ROOT="${head}SPACE_ROOT${normal} = ${desc}$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')${normal}"
echo "$SPACE_ROOT"

SPACE_ROOT_USED="${head}SPACE_ROOT_USED${normal} = ${desc}$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')${normal}"
echo "$SPACE_ROOT_USED"

SPACE_ROOT_FREE="${head}SPACE_ROOT_FREE${normal} = ${desc}$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')${normal}"
echo "$SPACE_ROOT_FREE"


all_color_param=($1 $2 $3 $4)
default_param=($5 $6 $7 $8)
color_name=(black green black green)

for i in {0..3..1}
do
    if [[ ${default_param[$i]} != 0 ]]; then
        default_param[$i]="default"
        if [[ ${all_color_param[$i]} -eq 6 && $i -eq 0 ]]; then
           color_name[$i]="blue"
        fi
        if [[ ${all_color_param[$i]} -eq 3 && $i -eq 1 ]]; then
            color_name[$i]="white"
        fi
        if [[ ${all_color_param[$i]} -eq 6 && $i -eq 2 ]]; then
            color_name[$i]="blue"
        fi
        if [[ ${all_color_param[$i]} -eq 3 && $i -eq 3 ]]; then
            color_name[$i]="white"
        fi
    else
        case ${all_color_param[$i]} in
            7)
                default_param[$i]="1"
                color_name[$i]="white"
                ;;
            1)
                default_param[$i]="2"
                color_name[$i]="red"
                ;;
            2)
                default_param[$i]="3"
                color_name[$i]="green"
                ;;
            6)
                default_param[$i]="4"
                color_name[$i]="blue"
                ;;
            5)
                default_param[$i]="5"
                color_name[$i]="purple"
                ;;
            0)
                default_param[$i]="6"
                color_name[$i]="black"
                ;;
        esac
    fi
done

echo "Column 1 background = ${default_param[0]} (${color_name[0]})"
echo "Column 1 font color = ${default_param[1]} (${color_name[1]})"
echo "Column 2 background = ${default_param[2]} (${color_name[2]})"
echo "Column 2 font color = ${default_param[3]} (${color_name[3]})"
