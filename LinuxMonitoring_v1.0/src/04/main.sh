#!/bin/bash

error_target=1
if [[ $# != 0 ]]; then
    echo "Error, function does not expect arguments"
    exit 1
fi
default1=0
default2=0
default3=0
default4=0
source conf.conf
export param1=$column1_background
export param2=$column1_font_color
export param3=$column2_background
export param4=$column2_font_color

if [[ $param1 == "" || $param2 == "" || $param3 == "" || $param4 == "" ]]; then
    source default.conf
    if [[ $param1 == "" ]]; then
        export param1=$column1_background
        if [[ $param1 == $param2 ]]; then
            export param1=$column1_background2
        fi
        default1=1
    fi

    if [[ $param2 == "" ]]; then
        export param2=$column1_font_color
        if [[ $param1 == $param2 ]]; then
            export param2=$column1_font_color2
        fi
        default2=1
    fi

    if [[ $param3 == "" ]]; then
        export param3=$column2_background
        if [[ $param3 == $param4 ]]; then
            export param3=$column2_background2
        fi
        default3=1
    fi

    if [[ $param4 == "" ]]; then
        export param4=$column2_font_color
        if [[ $param3 == $param4 ]]; then
            export param4=$column2_font_color2
        fi
        default4=1
    fi
fi


if [[ $param1 == $param2 ]] || [[ $param3 == $param4 ]]; then
    echo "Error, the background color and font settings cannot be the same"
    echo "Run the script again without duplicating 1 with 2 and 3 with 4 parameters."
else
param=($param1 $param2 $param3 $param4)
    for i in {0..3..1}
    do
        case ${param[$i]} in
        1)
            param[$i]="7"
            ;;
        2)
            param[$i]="1"
            ;;
        3)
            param[$i]="2"
            ;;
        4)
            param[$i]="6"
            ;;
        5)
            param[$i]="5"
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
   bash info.sh ${param[0]} ${param[1]} ${param[2]} ${param[3]} $default1 $default2 $default3 $default4
fi
