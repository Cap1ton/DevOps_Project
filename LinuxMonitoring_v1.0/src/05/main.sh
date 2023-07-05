#!/bin/bash

begin_time=$(date +%s)

if [[ $# == 1 ]]; then
    if [[ "${1: -1}" != "/" || -z $(find $1) ]]; then
        echo "Error, incorrect path"
    else
        source info.sh
        folders $1
        files_caunt $1
        files10 $1
        execution_time $begin_time
    fi
else
    echo "Error, incorrect number of arguments"
fi
