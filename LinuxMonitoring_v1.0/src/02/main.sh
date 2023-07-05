#!/bin/bash

yes_no=0

if [[ $1 ]]; then
    echo "Error, function does not expect arguments"
else
    bash info.sh
    read -p "Do you want to write data to log file? (y/n)" yes_no
    if [[ $yes_no == y || $yes_no == Y ]]; then
        file="$(date +"%d_%m_%y_%H_%M_%S").status"
        bash info.sh > $file
    fi
fi



