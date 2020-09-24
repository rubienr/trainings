#!/usr/bin/env bash

# get the script name with the leading directory name removed
SCRIPT_NAME=`basename ${BASH_SOURCE[0]}`

# strip last component from a file name
SCRIPT_PATH=`dirname ${BASH_SOURCE[0]}`

# find out if script is called/executed or sourced
(return 0 2>/dev/null) && EXECUTE="0" || EXECUTE="1"

# enable to debug the script
# set -x

# function that concatenates two strings
# $1 ... left string
# $2 ... right string
function func_concatenate() 
{
    local left="$1"
    local right="$2"
    
    if [ ! -z "$left" -o ! -z "$right" ] ; then
        echo "${left}${right}"
    fi
}

# a function
function func_foo() 
{
    echo "foo"
}

# another function
function func_bar() 
{
    echo "bar"
}

# concatenate the first two command line arguments
# $1 ... left string
# $2 ... right string
function main() 
{
    # store the current directory onto stack and
    # change to /
    pushd / > /dev/null 
    
    local left="$1"
    local right="$2"
    func_concatenate "$left" "$right"
    
    # change directory to peek of stack 
    # and pop stack
    popd > /dev/null
}

# python alike invocation if script is executed
if [ "x$EXECUTE" == "x1" ] ; then
    main "${@}" # pass all command line arguments (as strings)
    exit $?
fi

echo "New defined functions are:"
echo "  func_concatenate"
echo "  func_foo"
echo "  func_bar"
