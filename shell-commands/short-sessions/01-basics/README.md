# Shell Commands - Basics

In this session we will explore a few shell commands that will help you in your daily routine.
To bring everybody on the same page we start with basics.
You don't need to be a professional in bash scripting in order to be able to follow.
This session will scratch only the surface of a larger collection of commands.
If desired we can go into depth with that collection in follow up sessions.

Our shell commands cheat sheet: [https://github.com/rubienr/trainings/tree/master/shell-commands](https://github.com/rubienr/trainings/tree/master/shell-commands)

In this session we will focus on text files:

* how to scroll through them
* how to filter text from files

In the end of this session we will be able to filer out content of files and squeeze out data from tabular structures. We will discuss

* cat (tac)
* less
* grep
* cut
* tr
* wc
* sort
* uniq

and the basics:

* which
* man
* whatis

Especially for Linux beginners it is hard to find out what commands exist and what they do. To get a fast overview we use `which`, `whatis` and `man`.


## which - shows the full path of commands

Which searches for all commands in the current directory and all directories in the `PATH` variable.

    # find the command "man"
 
    $ which man                                                                                                                                                                                                                                                  
    /usr/bin/man     
 
    # find out if the command "ll" is an alias
 
    $ which ls                                                                                                                                                                                                                                                   
    alias ls='ls --color=auto'                                                                                                                                                                                                                                                      
        /usr/bin/ls 
 
    # find an unknown command
 
    $ which doesnotexist                                                                                                                                                                                                                                         
    /usr/bin/which: no doesnotexist in (/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/puppetlabs/bin:/home/raoul/bin)  


## man - search for references in the manual pages

Manual pages are a collection of manual pages that are structured in sections. 
With the `man` command we can find manual pages of almost all Unix commands (but also C/C++ API and much more). 
Usually there is no need to google a command's reference.

    # open the manual page of "which" - the command we discussed above
    
    WHICH(1)
    
    NAME
    
     which - shows the full path of (shell) commands.
    
    SYNOPSIS
    
     which [options] [--] programname [...]
    
    DESCRIPTION
    
    ...


* page up/down to scroll pages
* arrow up/down to scroll lines
* SIFT + / for search
* n  and N to jump to next occurrence
* q to quit

## whatis  - find sections the command occurs in

As said above manual pages are structured in sections:

1. Executable programs or shell commands
2. System calls (functions provided by the kernel)
3. Library calls (functions within program libraries)
4. Special files (usually found in /dev)
5. File formats and conventions eg /etc/passwd
6. Games
7. Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7)
8. System administration commands (usually only for root)
9. Kernel routines \[Non standard\]

If we would search for open, (could the open shell command or the C function), `man` would select the first section "open" refers to. 
For this we use whatis to find out which section we need:

    $ whatis open
    
    open (2)             - open and possibly create a file or device
    open (1)             - start a program on a new virtual terminal (VT).
    open (3pm)           - perl pragma to set default PerlIO layers for input and output
    open (3p)            - open a file
    open (n)             - Open a file-based or command pipeline channel
    
    $ man open   # will select the man page in the first section that matches
    
    $ man 2 open # will select the man page in section 2 which describes the C API of open: int open(...);

Alternative: `apropos` - search the manual page names and descriptions.


## cat - concatenate files and print on the standard output

    $ echo "file 1" >  file1.txt
    $ echo "file 2" >  file2.txt
    
    $ cat file1.txt file2.txt
    file 1
    file 2
    
    $ cat file2.txt file1.txt
    file 2
    file 1

Since almost everything is a file in Unix, with cat you can read a few things:

    $ cat /dev/sda2`
    �~;�h&�h&�h&�uY+{����u�u�u�uYd
    ��;�h&�h&�h&�uY�V��^C # pressed CONROL + C to abort
    
    $ cat /dev/urandom
    ������"��K�as=���hN�b # pressed CONROL + C to abort
    
    $ reset # re-initialize your terminal in case the binary output broke it

To reverse and concatenate files use `tac`.


## less - scroll file content

In contrast to cat, it does not dump the file content to the terminal but allows you to scroll a file forward and backward. Searching string occurrences works the same way as explained with the man command.

    $ less /etc/issue
    \S
    Kernel \r on an \m

* SIFT + / for search
* n  and N to jump to next occurrence
* q to quit
* SHIFT + f to jump to the last line, and wait for new lines (helpful for reading logs while they are written)
* h to enter the help mode, q to return to file


##  grep - print lines matching pattern

Grep searches the input file for lines containing the search pattern. By default it prints the matching lines.

    $ cat file1.txt file2.txt
    file 1
    file 2
    
    $ grep fi file1.txt
    file 1
    
    $ grep -R fi .
    ./file1.txt:file 1
    ./file2.txt:file 2
    
    $ echo -en "foo\nbar\nbaz\n"
    foo
    bar
    baz
    
    $ echo -en "foo\nbar\nbaz\n" | grep oo
    foo
    
    $ echo -en "CamelCaseStuffString\nfoo\n" | grep camelcase
    
    $ echo -en "CamelCaseStuffString\nfoo\n" | grep -i camelcase
    CamelCaseStuffString

Grep can take input from stdin instead of files:

    $ echo -en "foo\nbar\nbaz\n"
    foo
    bar
    baz
    
    $ echo -en "foo\nbar\nbaz\n"  | grep oo
    foo

Frequently used options are:

* -R, --dereference-recursive - search in all files in this path recursively
* -v, --invert-match - print non matching lines
* -B, --before-context N -  print the matching line and N lines before
* -A, --after-context N -  print the matching line and N lines after
* -C, --context N - print the matching line and N lines before and after
* -E, --extended-regexp - nterpret patern as an extended regular expression
* -i, --ignore-case

    

##  cut - remove sections from each line of files

Print selected parts of lines from each FILE to standard output.

    $ echo "a b c d" | cut -d' ' -f1  
    a
     
    $ echo "a b c d" | cut -d' ' -f1,2
    a b
     
    $ echo "a b c d" | cut -d' ' -f2-
    b c d
     
    $ echo "a b c d" | cut -d' ' -f-2
    a b

Frequently used options are:

* -d, --delimiter - use another delimiter than tab
* -f, --fields - fields to print starting with 1
* -c, --complement -complement the set of selected fields

##  tr - translate or delete characters

Translate, squeeze, and/or delete characters from standard input, writing to standard output.

    $ echo "a b c d" | tr "abcd" "efgh"
    e f g h
     
    $ echo "a b  c   dd" | tr -s " d"
    a b c d

Frequently used options are:

* -s, --squeeze-repeats - replace each input sequence of a repeated character that is listed in SET1 with a single occurrence of that character
* -d, --delete - delete characters in SET1, do not translate
* -c, --complement - use the complement of SET1

## wc - word count

Count words, lines and bytes in a file.

    $  echo -en "foo\nbar\nbaz biz\n" | wc -l
    3

    $  echo -en "foo\nbar\nbaz biz\n" | wc -w
    4

Frequently used options are:

* -w, --words
* -l, --lines

## sort - sort lines of text files

Write sorted concatenation of all file(s) to standard output.

    $ sort file2.txt file1.txt file2.txt
    file 1
    file 2
    file 2
     
    $  echo -en "foo\nbar\nbaz biz\n" | sort
    bar
    baz biz
    foo

## uniq - report or omit repeated line

Filter adjacent matching lines from INPUT (or standard input), writing to OUTPUT (or standard output).

    $ cat file1.txt file2.txt file2.txt file1.txt
    file 1
    file 2
    file 2
    file 1
     
    $ cat file1.txt file2.txt file2.txt file1.txt | uniq
    file 1
    file 2
    file 1
     
    $ cat file1.txt file2.txt file2.txt file1.txt | uniq -c
    1 file 1
    2 file 2
    1 file 1

Frequently used options are:

* -c, --count - prepend the number of occurence
* -d, --repeated - print only repeated (one for each group)
* -u, --unique - only print uniqe lines

## Extract content from tabular data

In the following example we want to use the presented shell commands to obtain data from a listing:

    $ cat healthystuff.txt
    what    shape    color  family
    apple   round    yellow fruit
    cabbage roundish green  vegetable
    apple   round    yellow fruit
    tomato  round    red    fruit
    cucumber longish green  vegetable

### Find out how many healthy stuff is listed

    # 1st: extract the first column
    $ cat healthystuff.txt | cut -d' ' -f1
    what
    apple
    cabbage
    apple
    tomato
    cucumber
     
    # 2nd remove duplicates
    $ cat healthystuff.txt | cut -d' ' -f1 | sort
    apple
    apple
    cabbage
    cucumber
    tomato
    what
     
    $ cat healthystuff.txt | cut -d' ' -f1 | sort | uniq
    apple
    cabbage
    cucumber
    tomato
    what
     
    # 3rd count lines
    cat healthystuff.txt | cut -d' ' -f1 | sort | uniq | wc -l
    5
 
    # the correct result is 4, due to the first line in file: "what    shape    col3   col4"


### Get all shape types

    # 1st: extract the second column
     
    $ cat healthystuff.txt | cut -d' ' -f2
     
     
    roundish
     
     
    longish
    # The cluttered output happens because the column separator is one or multiple spaces " ".
     
    # squeeze spaces
    $ cat healthystuff.txt | tr -s ' '             
    what shape col3 col4
    apple round yellow fruit
    cabbage roundish green vegetable
    apple round yellow fruit
    tomato round red fruit
    cucumber longish green vegetable
     
    # finally get the second column
    $ cat healthystuff.txt | tr -s ' '  | cut -d' ' -f2
    shape
    round
    roundish
    round
    round
    longish
     
    # 2nd remove duplicates
     
    cat healthystuff.txt | tr -s ' '  | cut -d' ' -f2 | sort | uniq
    longish
    round
    roundish
    shape
     
    # and finally remove the "shape" line
    $ cat healthystuff.txt | tr -s ' '  | cut -d' ' -f2 | sort | uniq | grep -v shape
    longish
    round
    roundish

### Count all fruit families

    # 1st get last column
 
    $ cat healthystuff.txt | tr -s ' ' | cut -d' ' -f4
    family
    fruit
    vegetable
    fruit
    fruit
    vegetable
     
    # 2nd count adjacent duplicate occurences
     
    cat healthystuff.txt | tr -s ' ' | cut -d' ' -f4 | sort | uniq -c
          1 family
          3 fruit
          2 vegetable
