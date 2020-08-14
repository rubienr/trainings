# Schell commands - Shell Script 101

In this session I will show how to create a simple shell script.
Of course many ways exist on how to do it - this is just one of many approaches.
No special skills are needed, neither sophisticated shell commands will be used.

In this session we will focus on a simple script and look in detail onto:

* shebang `#!`
* get the script name and script directory
* working in the correct path

In the end of the session wie will obtain a fully working example.


## Basics

* `#!/bin/bash` - shebang

    The shebang specifies the interpreter for the script file.
    It must be the first line of code and is recommendet to be even the first line in file.
    The modern way to declare the shebang is `#!/usr/bin/env bash`.
    In our case we say: bash if you execte this file use `bash` as interpreter.

* Script arguments are passed by string and can be accessd with `$N` where N denotes the index.
    
        echo "$0"
        /bin/bash

* Variable assignment (in bash almost everything is a string)

        FOO=foo
        BAR="bar"                # use quotes whenever possible
        BAZ="$BAR"
        BIZ= "biz"               # wrong: no space is allowed 
        BIZ ="biz"               # wrong: no space is allowed 
    
* Access variable

        echo "FOO: $FOO"
        FOO: bar
        
        echo 'FOO: $FOO'         # with '' will not evaluate variables
        FOO:
      
        echo "FOOBAR: ${FOO}bar" # when ambiguous 
        FOOBAR: foobar
        
        echo "FOOBAR: $FOObar"   # wrong
        FOOBAR: 
      
    
* Variable scope is global by default. Use `local` to minimize the scope.

        VAR="foo"                # global
        local var="bar"          # to be used in a function `{}` scope
    
* Get the output of evaluated command

    files=`ls`                   # old style, but very convenient to write
    files=$(ls)                  # with sub shell
    echo "files: $ls"
    README.md script.sh        

* enable/disable debugging/trace of script

      set -x                     # enable trace
      set xtrace
      
      set +x                     # disable trace
      
* touch - change file timestamp

    Update the access and modification times of a file to the current time.
    If the file does not exist is is created empty.

## Create the script

Creating a script is nearly as simple as creating an empty file. 
Usually we choose the `.sh` but the file extension is optional.
The only thing we have to specify, is the intepreter she shell should use when executing the content.

Create a script file, make it exectable and specify the interpreter:
    
    $ touch script.sh
    $ echo '#!/usr/bin/env bash' > script.sh
    $ chmod u+x script.sh
    $ cat script.sh
    #!/bin/bash
    $ ./script.sh


## Obtain the script name and path
In almost every script it is helpful to kwow the script name and it's location.
I recomment to use this as the very first lines in each script.

    SCRIPT_NAME=`basename "$0"`
    SCRIPT_PATH='$(dirname ${BASH_SOURCE[0]})'

## Source other scripts
Sourcing means including other scrpts. 
While soucing the whole script is executed. 

    source foo.sh
    # or alternatively
    . foo.sh

To find out if we are sourced or executed we can use:

    (return 0 2>/dev/null) && SOURCE="1" || EXECUTE="1"

## Functions

    function func_concatenate() 
    {
        echo "function concatenate"
    }

Function parameter are optional and passed as string. 
Better document the expected variables.

    # function that concatenates two strings
    # $1 ... left string
    # $2 ... right string
    function func_concatenate() 
    {
        # note: $0 is globally declared and always the script name
        local left="$1"
        local right="$2"
        echo "${left}${right}"
    }
    
Call a function
    
    func_concatenate "a" "bcd"
    

## Example

In this example we put all puzzles together and obtain a nice script
that can (python alike) be executed or used as "library".

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


* usage

        $ ./script.sh foo bar
        foobar
        
        $ ./script.sh foo       bar 
        foobar

        $ ./script.sh "foo " bar
        foo bar

        $ . script.sh
        function visible: func_concatenate
        
        $ func_concatenate foo bar
        foobar


