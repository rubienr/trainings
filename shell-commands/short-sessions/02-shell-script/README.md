# Shell commands - Shell Script 101

In this session I will show how to create a simple shell script.
Of course many ways exist on how to do it - this is just one of many approaches.
No special skills are needed, neither sophisticated shell commands will be used.

In this session we will focus on a simple script and look in detail onto:

* shebang `#!`
* debugging with script trace
* get the script name and script directory
* returning to the script path
* variables
* functions and a simple `if` clause

In the end of the session we will obtain a fully working example.


## Basics

### `#!/bin/bash` - shebang

The shebang specifies the interpreter for the script file.
It must be the first line of code and is recommendet to be even the first line in file.
The modern way to declare the shebang is `#!/usr/bin/env bash`.
In our case we say: bash if you execte this file use `bash` as interpreter.

    #!/usr/bin/env bash      # modern way
    #!/usr/bin/bash          # ancient method

### Script arguments are passed by string and can be accessd with `$N` where N denotes the index.
The first argument is the name of the executable. 
Each argument is interpreted as separated by space (as word).
To pack multiple words to one argument use `""` or `''`.

    echo "$0"                # print the 1st argument of this shell
    /bin/bash
    
* Alternative: `$0` vs. `${BASH_SOURCE[0]}`

    Script:
    
        #!/bin/bash
        echo "[$0] vs. [${BASH_SOURCE[0]}]"

    Result:
    
        $ bash ./foo.sh
        [./foo.sh] vs. [./foo.sh]

        $ ./foo.sh
        [./foo.sh] vs. [./foo.sh]

        $ . ./foo.sh
        [bash.sh] vs. [./foo.sh]
        
        echo "[$0] vs. [${BASH_SOURCE[0]}]"
        [/bin/bash] vs. []            

### Variable assignment (in bash almost everything is a string)

    FOO=foo
    BAR="bar"                # use quotes whenever possible
    BAZ="$BAR"
    BIZ= "biz"               # wrong: no space is allowed 
    BIZ ="biz"               # wrong: no space is allowed 
    
### Access variable

    echo "FOO: $FOO"
    FOO: bar
    
    echo 'FOO: $FOO'         # with '' will not evaluate variables
    FOO:
  
    echo "FOOBAR: ${FOO}bar" # when ambiguous 
    FOOBAR: foobar
    
    echo "FOOBAR: $FOObar"   # wrong
    FOOBAR: 
      
    
### Variable scope is global by default. Use `local` to minimize the scope.

        VAR="foo"                # global
        local var="bar"          # to be used in a function `{}` scope

### enable/disable debugging/trace of script

        set -x                     # enable trace
        set xtrace

        set +x                     # disable trace

### Define a Funcion

Function parameter are optional and passed as string. 
To define a function properly it is recommended to

* prefix the function properly to not name-clash with other commands
* document the arguments
* rename the arguments
* declare a local scope for variables

Example:

    # function that concatenates two strings
    # $1 ... left string
    # $2 ... right string
    function func_concatenate() 
    {
        local left="$1"
        local right="$2"
        echo "${left}${right}"
    }

Call a function:

        func_concatenate "a b" cd
    
### `if` clauses

A simple if - else clause in shell can be written as follows:

    if expr1 ; then              # executes expr1
        expr2                    # if expr1 returns 0
    else          
        expr3                    # if expr1 returns not 0
    fi

`expr1` can be any shell expression. 
For a simpler reading the expression is can be executed with `test` which is writtenn as short form as `[` (see `man test`).

    if test -z "" ; then         # if string is empty
        expr2
    fi
    
or alternatively 
    
    if [ -z "" ] ; then         # if string is empty
                                # note `[` is equally to `test` and `[` is just an input argument
        expr2
    fi

### Get the output of evaluated command

    files=`ls`                   # ancient style, but very convenient to write
    files=$(ls)                  # bash specific, expressions can be nested
    echo "files: $files"
    README.md script.sh        
      
### Redirect output of a command
Sometimes it is needed to run a command, but we don't wnat to see any output.
In such cases we can send the `stdout` to a file or even `/dev/null`.
If the command's 'output goes to `stderr` this also needs to be forwarded separately. 

Stdout is referred as file descriptor 1 and stderr as 2. 
With this we can redirect the output as follows

    command > out.txt           # execute command and forward stdout to a file
    command 1> out.txt          # same as above but more explicit
    command 2> out.txt          # same as above but forward stderr only
    command > out.txt 2>&1      execute command, for ward stdout to file and forward stderr to stdout

Example:
    
    touch foo                     # create an empty file
    ls foo                                                                                                                                                                                                                                                      
    foo              

    ls foo > /dev/null 

    ls doesnotexist               # this file does not exist, ls prints to stderr 
    ls: cannot access doesnotexist: No such file or directory

    ls doesnotexist > /dev/null                                                                                                                                                                                                                        
    ls: cannot access doesnotexist: No such file or directory 

    ls doesnotexist 2> /dev/null  # forwards stderr to file
    ls doesnotexist > /dev/null 2>&1 # forwards stderr and also redirects stderr to stdout


### touch - change file timestamp

`touch` updates the access and modification times of a file to the current time.
If the file does not exist is is created empty.

    ls foo
    ls: cannot access foo: No such file or directory
    touch foo
    ls foo
    foo

## Create a script

Creating a script is nearly as simple as creating an empty file. 
Usually we choose the `.sh` but the file extension is optional.
The only thing we have to specify, is the intepreter the shell should use when executing the content.

Create a script file, make it exectable and specify the interpreter:
    
    touch script.sh
    echo '#!/usr/bin/env bash' > script.sh
    chmod u+x script.sh
    cat script.sh
    #!/bin/bash
    
    ./script.sh


### Obtain the script name and path
In almost every script it is helpful to kwow the script name and it's location.
I recomment to use this as the very first lines in each script.

    SCRIPT_NAME=`basename ${BASH_SOURCE[0]}`
    SCRIPT_PATH=`dirname ${BASH_SOURCE[0]}`

### Source other scripts
Sourcing means including other scrpts. 
While sourcing the whole script is executed. 

    source foo.sh
    # or alternatively
    . foo.sh

To find out if the current script is sourced or executed we can use a bash specific hack. 
Bash only allows return statements from functions and on top-level only if the scipt was sourced.
Thus we can write:

    (return 0 2>/dev/null) && SOURCE="1" || EXECUTE="1"
    

## Full Example

In this example we put all puzzles together and obtain a nice script
that can (python alike) be executed or used as "library".

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

Usage:

    ./script.sh

    ./script.sh  a bcd x
    abcd

    ./script.sh  "a bcd" x
    a bcdx

    . script.sh 
    New defined functions are:
      func_concatenate
      func_foo
      func_bar

