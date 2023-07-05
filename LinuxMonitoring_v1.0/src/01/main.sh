#!bin/bash
if ! [[ $1 =~ ^-?[0-9]+$ ]] && [[ $# == 1 ]];
then
    echo "$1"
    exit 1
else
    if ! [[ $# == 1 ]] && ! [[ $1 =~ ^-?[0-9]+$ ]];
    then
        echo "Много или слишком мало аргументов"
    else
        echo "Недопустимый символ"
    fi
fi
