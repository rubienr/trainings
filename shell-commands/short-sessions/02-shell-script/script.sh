#!/usr/bin/env bash
SCRIPT_NAME=`basename "$0"`
SCRIPT_PATH='$(dirname ${BASH_SOURCE[0]})'
(return 0 2>/dev/null) && EXECUTE="0" || EXECUTE="1"

# set -x

# function that concatenates two strings
# $1 ... left string
# $2 ... right string
function func_concatenate() 
{
    local left="$1"
    local right="$2"
    echo "${left}${right}"
}

# concatenate the first two command line arguments
# $1 ... left string
# $2 ... right string
function main() 
{    
    if [ "x$EXECUTE" == "x1" ] ; then
        local left="$1"
        local right="$2"
        func_concatenate "$left" "$right"
    else
        echo "function visible: func_concatenate"
    fi
}

main "${@}" # pass all command line arguments (as strings)
