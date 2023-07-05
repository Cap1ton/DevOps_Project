#!/bin/bash

error_target=1
param=($1 $2 $3 $4)
if [[ $# != 4 ]]; then
    echo "Error, incorrect number of arguments"
elif [[ $1 == $2 ]] || [[ $3 == $4 ]]; then
    echo "Error, the background color and font settings cannot be the same"
    echo "Run the script again without duplicating 1 with 2 and 3 with 4 parameters."
else
    for i in 0 1 2 3
    do
        case ${param[$i]} in
        1)
            param[$i]="6"
            ;;
        2)
            param[$i]="1"
            ;;
        3)
            param[$i]="2"
            ;;
        4)
            param[$i]="3"
            ;;
        5)
            param[$i]="4"
            ;;
        6)
            param[$i]="0"
            ;;
        *)
            echo "Error, wrong color setting: ${param[$i]}"
            exit 1
            ;;
        esac
    done
    bash info.sh ${param[0]} ${param[1]} ${param[2]} ${param[3]}
fi


