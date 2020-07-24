# Table of Contents
*[Shell Commands - A Swiss Army Knife](#Shell-Commands---A-Swiss-Army-Knife)
  *[Introduction](#Introduction)
  *[Commands - Tooling](#Commands---Tooling)
   *[bash, alias, pipe, stream](#bash-alias-pipe-stream)
   *[reverse interactive search](#reverse-interactive-search)
 *[as you type, the command history is searched interactively](#as-you-type-the-command-history-is-searched-interactively)
 *[type baz](#type-baz)
 *[press ENTER to execute found command](#press-ENTER-to-execute-found-command)
 *[type grep, then press ENTER](#type-grep-then-press-ENTER)
   *[pipes & streams](#pipes-&-streams)
   *[cd - change directory](#cd---change-directory)
   *[pwd - print name of current/working directory](#pwd---print-name-of-currentworking-directory)
   *[alias ](#alias-)
    *[list available aliases](#list-available-aliases)
    *[define alias ](#define-alias-)
   *[loops](#loops)
   *[whatis, man](#whatis-man)
    *[whatis](#whatis)
    *[man](#man)
   *[less (zless), (multi)tail, vim](#less-zless-multitail-vim)
    *[less](#less)
     *[search in file (same procedure as for less, tail, top, vim, and much more)](#search-in-file-same-procedure-as-for-less-tail-top-vim-and-much-more)
     *[auto scroll if new lines are appended (i.e. log files)](#auto-scroll-if-new-lines-are-appended-i.e.-log-files)
     *[go to line](#go-to-line)
   *[tail](#tail)
    *[auto scroll ](#auto-scroll-)
    *[print last lines](#print-last-lines)
   *[multitail - browse through several files at once](#multitail---browse-through-several-files-at-once)
   *[vim - Vi IMproved, a programmers text editor](#vim---Vi-IMproved-a-programmers-text-editor)
    *[open folder](#open-folder)
    *[open file](#open-file)
    *[save document](#save-document)
    *[go to line](#go-to-line)
    *[edit content](#edit-content)
    *[search in file](#search-in-file)
   *[which, whereis](#which-whereis)
    *[which - show full path to (shell) commands](#which---show-full-path-to-shell-commands)
    *[whereis - locate the binary, source, and man page for commands](#whereis---locate-the-binary-source-and-man-page-for-commands)
   *[ps, pstree, top](#ps-pstree-top)
    *[ps - report a snapshot of the current processes](#ps---report-a-snapshot-of-the-current-processes)
    *[pstree - display a tree of processes](#pstree---display-a-tree-of-processes)
    *[top - display Linux processes](#top---display-Linux-processes)
     *[shortcuts](#shortcuts)
     *[view](#view)
   *[diff (zdiff) - compare files line by line](#diff-zdiff---compare-files-line-by-line)
    *[with files TODO](#with-files-TODO)
    *[with folder TODO](#with-folder-TODO)
   *[cat (zcat) - concatenate files and  print to stdout](#cat-zcat---concatenate-files-and--print-to-stdout)
   *[filterdiff, lsdiff ](#filterdiff-lsdiff-)
    *[filterdiff - extract or exclude diffs from a diff file](#filterdiff---extract-or-exclude-diffs-from-a-diff-file)
    *[lsdiff - show which files are modified by a patch](#lsdiff---show-which-files-are-modified-by-a-patch)
   *[patch](#patch)
   *[find - search for files in a directory hierarchy](#find---search-for-files-in-a-directory-hierarchy)
    *[by name ... `find ./ -name "pattern"`](#by-name-...-`find-.--name-"pattern"`)
    *[by size ... `find ./ -type f -size +1k -size -10M`](#by-size-...-`find-.--type-f--size-+1k--size--10M`)
    *[by last changed age ... find ./ -cmin <minutes>1](#by-last-changed-age-...-find-.--cmin-<minutes>1)
     *[examples](#examples)
   *[grep (zgrep) - print lines matching a pattern](#grep-zgrep---print-lines-matching-a-pattern)
   *[tr - translate or delete characters](#tr---translate-or-delete-characters)
   *[cut - remove sections from each line of files TODO](#cut---remove-sections-from-each-line-of-files-TODO)
   *[wc (word count) - print newline, word, and byte counts for each file](#wc-word-count---print-newline-word-and-byte-counts-for-each-file)
    *[arguments](#arguments)
   *[sort, uniq](#sort-uniq)
    *[sort - sort lines of text files ](#sort---sort-lines-of-text-files-)
     *[examples](#examples)
    *[uniq - report or omit repeated lines](#uniq---report-or-omit-repeated-lines)
     *[examples ](#examples-)
   *[sed - stream editor](#sed---stream-editor)
 filter*[#filtertext parts from:](##filtertext-parts-from:)
 *[trial 1](#trial-1)
 *[trial 2 - strengthen the regular expression for the captures](#trial-2---strengthen-the-regular-expression-for-the-captures)
 *[trial 3 - What happened in trial 2 is that only the matching part is replaced. For this we now match the whole line:](#trial-3---What-happened-in-trial-2-is-that-only-the-matching-part-is-replaced.-For-this-we-now-match-the-whole-line:)
 *[trial 3 - Bring the output into a tabular format:](#trial-3---Bring-the-output-into-a-tabular-format:)
   *[dmesg - print or control the kernel ring buffer](#dmesg---print-or-control-the-kernel-ring-buffer)
   *[dirs, pushd, popd](#dirs-pushd-popd)
    *[dirs - list stack](#dirs---list-stack)
    *[pushd - change to directory, and store it to stack](#pushd---change-to-directory-and-store-it-to-stack)
    *[popd - change to directory stored on top of stack, and remove from stack !MACRO](#popd---change-to-directory-stored-on-top-of-stack-and-remove-from-stack-!MACRO)
   *[wget - the non-interactive network downloader](#wget---the-non-interactive-network-downloader)
   *[rsync, scp](#rsync-scp)
    *[rsync - a fast, versatile, remote (and local) file-copying tool ](#rsync---a-fast-versatile-remote-and-local-file-copying-tool-)
    *[scp - secure copy (remote file copy program)](#scp---secure-copy-remote-file-copy-program)
   *[who - show who is logged on](#who---show-who-is-logged-on)
   *[du, df, lsblk ](#du-df-lsblk-)
    *[du - estimate file space usage](#du---estimate-file-space-usage)
    *[df - report file system disk space usage](#df---report-file-system-disk-space-usage)
    *[lsblk - list block devices](#lsblk---list-block-devices)
   *[watch - execute a program periodically, showing output fullscreen ](#watch---execute-a-program-periodically-showing-output-fullscreen-)
   *[CTRL+z (sleep), fg (foreground), jobs](#CTRL+z-sleep-fg-foreground-jobs)
   *[screen - screen manager with VT100/ANSI terminal emulation](#screen---screen-manager-with-VT100ANSI-terminal-emulation)
   *[nmap - network exploration tool and security / port scanner](#nmap---network-exploration-tool-and-security--port-scanner)
   *[route - show / manipulate the IP routing table ](#route---show--manipulate-the-IP-routing-table-)
    *[add default GW](#add-default-GW)
    *[add net](#add-net)
    *[del default gw](#del-default-gw)
   *[del net](#del-net)
   *[ls{hw,usb,pci,blk,cpu}](#lshwusbpciblkcpu)
    *[lshw - list hardware](#lshw---list-hardware)
    *[lsusb - list USB devices](#lsusb---list-USB-devices)
    *[lspci - list all PCI devices](#lspci---list-all-PCI-devices)
    *[lsblk - list block devices](#lsblk---list-block-devices)
    *[lscpu - display information about the CPU architecture](#lscpu---display-information-about-the-CPU-architecture)
   *[Reminder for Other Useful Commands](#Reminder-for-Other-Useful-Commands)
    *[Unix commands cheat sheet](#Unix-commands-cheat-sheet)
---
# Shell Commands - A Swiss Army Knife

## Introduction

This summary recaps UNIX commands, such as man, which, whatis, alias, grep, find, but, xargs, wget, ..., which an experienced Linux user should know. 
The intention is to provide a very brief overview of commands to enhance personal skills, stimulate creativity or to simply act as look-up. 
The content may be also of interest for ongoing SEs or novices. Especially when digging into log or configuration files.

## Commands - Tooling

### bash, alias, pipe, stream

* copy: `CONTROL + SHIFT + c`
* paste: `CONTROL + SHIFT + v`
* end of file - can be used to close current terminal: `CONTROL + d`
* sigterm: `CONTROL + c`
  * to terminate current program
  * to abandon the command line (instead of clearing)
  
```
me@pc ~ $ garbage¹²³¼[¹{ ¹[]³¼¹]³½{^C
me@pc ~ $ 
```

### reverse interactive search

The shell history can be interactively searched in reverse (from last to oldest command). As you type the search result is updated interactively. 

* start search: `CTRL + r`
* search next older (reverse) command: `CTRL + r`
* search next younger (forward) command: `CTRL + SHIFT + r`
* execute command: `ENTER`
* exit search: `CTRL + c`

```
me@pc ~/tmp :( $ mkdir d
me@pc ~/tmp $ cd d
me@pc ~/tmp/d $ ls
me@pc ~/tmp/d $ touch foobar.txt
me@pc ~/tmp/d $ echo "foo" >> foobar.txt 
me@pc ~/tmp/d $ echo "bar" >> foobar.txt 
me@pc ~/tmp/d $ echo "baz" >> foobar.txt 
me@pc ~/tmp/f $ grep bar foobar.txt 
bar
me@pc ~/tmp/f $ cat foobar.txt 
foo
bar
baz
me@pc ~/tmp/d $ # press CONTROL + r
(reverse-i-search)`':
# as you type, the command history is searched interactively
# type baz
(reverse-i-search)`echo': echo "baz" >> foobar.txt 
# press ENTER to execute found command
me@pc ~/tmp/f $ cat foobar.txt 
foo
bar
baz
baz
me@pc ~/tmp/f $ # press CONTROL + r
(reverse-i-search)`':
# type grep, then press ENTER
(reverse-i-search)`grep': grep bar foobar.txt
me@pc ~/tmp/f $ grep bar foobar.txt 
bar
me@pc ~/tmp/f $
```

### pipes & streams

* pipe: to transport the output of one application to the input of an other
  * `echo "foo" | grep f --color=always`
* stream: to store an application output to a file 
  * wipe content before writing to file `>`: `echo "foo" > bar.txt`
  * append to content `>>`: `echo "foo" >> bar.txt`
  * truncate output: `echo foo > /dev/null`
  * redirect stderr (2) to stdout (1): `echo "foo" > /dev/null 2>`

### cd - change directory

Note: The argument `-` is equivalent to `$OLDPWD`.

```
me@pc ~/workspaces/workspace-trunk/compass-display $ cd
me@pc ~ $ cd -
/home/users/raoul/workspaces/workspace-trunk/compass-display
me@pc ~/workspaces/workspace-trunk/compass-display $ cd $OLDPWD
me@pc ~ $ 
```

### pwd - print name of current/working directory
```
me@pc ~/workspaces/workspace-trunk/compass-display $ pwd
/home/users/raoul/workspaces/workspace-trunk/compass-display
me@pc ~/workspaces/workspace-trunk/compass-display $ echo $PWD
/home/users/raoul/workspaces/workspace-trunk/compass-display
me@pc ~/workspaces/workspace-trunk/compass-display $ 
```

### alias 
#### list available aliases
Alias with no arguments or with the `-p` option prints the list of aliases in the form alias `name=value` on standard output.
```
me@pc ~ $ alias
alias dir='dir --color=auto'
alias ll='ls -lah --color=always'
[...]
```
#### define alias 
When arguments are supplied, an alias is defined for each name whose value is given. 
A trailing space in value causes the next word to be checked for alias substitution when the alias is expanded. 
For each name in the argument list for which no value is supplied, the name and value of the alias is printed. 
Alias returns true unless a name is given for which no alias has been defined.
```
me@pc ~ $ cat ~/.bashrc
alias ll='ls -lah'
```

### loops
```
me@pc ~ $ while true ; do echo "foo"; sleep 1; done
foo
foo
^C
me@pc ~ $ 
me@pc ~ $ while my_script.py ; do echo "foo"; sleep 1; done
```

### whatis, man
#### whatis
* If the search term is ambiguous the command `whatis` lists in which sections the term occurs.
```
me@pc ~ $ whatis open
open (2)             - open and possibly create a file or device
open (3p)            - open a file
open (n)             - Open a file-based or command pipeline channel
open (3pm)           - perl pragma to set default PerlIO layers for input and output
 
raoul@pc46 ~ $ man 3 open
open(3pm)                                                    Perl Programmers Reference Guide                                                   open(3pm)

NAME
       open - perl pragma to set default PerlIO layers for input and output
[...]
```

#### man
* search for a distinct term
```
me@pc ~ $ man ls
LS(1)                                                                 User Commands                                                                 LS(1)

NAME
       ls - list directory contents
[...]
```
* search within manual page (same procedure as for `less`, `tail`, `top`, `vim`, and much more):
  * enter /  → write the search term human → press `ENTER` → 
    * → press `n` for next occurrence
    * → press `SHIFT + n` for previous occurrence

### less (zless), (multi)tail, vim
#### less
##### search in file (same procedure as for less, tail, top, vim, and much more)
* enter /  → write the search term i.e. ERROR → press enter
  * → press n for next occurrence
  * → press SHIFT + n for previous occurrence
* Note: After pressing /, use up/down arrow keys to navigate the history of entered search terms.

```
me@pc ~ $ less /var/log/messages
Aug 21 09:43:58 pc46 distccd[19510]: (dcc_r_file_timed) 4359202 bytes received in 0.017438s, rate 244124kB/s
Aug 21 09:44:19 pc46 distccd[19510]: (dcc_collect_child) ERROR: Compilation takes too long, timeout.
Aug 21 09:44:19 pc46 distccd[19510]: job complete
/ERROR
```

##### auto scroll if new lines are appended (i.e. log files)
* enable with SHIFT + f
* disable with CONTROL + c

```
me@pc ~ $ less /var/log/messages
[...]
Aug 23 15:21:15 pc46 dbus-daemon: dbus[744]: [system] Successfully activated service 'org.freedesktop.problems'
Aug 23 15:21:15 pc46 dbus[744]: [system] Successfully activated service 'org.freedesktop.problems'
Waiting for data... (interrupt to abort)
```

##### go to line
* press `shift +`: → enter line number → press `ENTER`
* display current line number `CTRL + g`


### tail
#### auto scroll 
```
me@pc ~ $ tail -f /var/log/messages
[...]
Aug 23 15:25:01 pc systemd: Started Session 2754 of user pcp.
Aug 23 15:25:01 pc systemd: Starting Session 2754 of user pcp.
Aug 23 15:25:01 pc systemd: Removed slice user-993.slice.
Aug 23 15:25:01 pc systemd: Stopping user-993.slice.
^C
me@pc ~ $
```

#### print last lines
```
me@pc ~ $ tail /var/log/messages
[...]
Aug 23 15:25:01 pc systemd: Started Session 2754 of user pcp.
Aug 23 15:25:01 pc systemd: Starting Session 2754 of user pcp.
Aug 23 15:25:01 pc systemd: Removed slice user-993.slice.
Aug 23 15:25:01 pc systemd: Stopping user-993.slice.
me@pc ~ $
```

### multitail - browse through several files at once
TODO


### vim - Vi IMproved, a programmers text editor
#### open folder
* navigate using up/down arrow keys, select file and press enter

```
me@pc ~ $ vim workspaces/svn/
" ============================================================================                                                                              
" Netrw Directory Listing                                        (netrw v149)
"   /home/users/raoul/workspaces/svn
"   Sorted by      name
"   Sort sequence: [\/]$,\<core\%(\.\d\+\)\=\>,\.h$,\.c$,\.cpp$,\~\=\*$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$
"   Quick Help: <F1>:help  -:go up dir  D:delete  R:rename  s:sort-by  x:exec
" ============================================================================
../
./
.idea/
.svn/
im2/
projects/
repmax/
.clang-format
.clang-tidy
.cproject
.project
CMakeLists.txt
CMakeLists.txt.user
CTestConfig.cmake
conanfile.py
```

#### open file
```
me@pc ~ $ vim workspaces/svn/.clang-format
  1 Language:        Cpp
  2 AccessModifierOffset: -4
  3 AlignAfterOpenBracket: Align
 [...]
```

#### save document
* `ESC` → `SHIFT + :` → enter `w`, press `ENTER`
  * `q!` ... quit and discard changes
  * `q` ... quit
  * `x` ... save and quit
  * `w` ... save file

#### go to line
* press `SHIFT + :` → `ENTER` line number → press `ENTER`

#### edit content
* press `INSERT` → edit

#### search in file
* press `ESC` to enter normal mode → enter `/`  → write the search term i.e. av → press `ENTER` → 
  * → press `n` for next occurrence
  * → press `SHIFT + n` for previous occurrence
* **Note:** Separate multiple terms with pipe (or)  such as `/FAIL|ERR`.
* **Note:** When in command mode, use the up/down arrow keys to autocomplete commands from history, i.e. type `/` then use arrow keys to search back-/forward for commands starting with `/`.


### which, whereis
#### which - show full path to (shell) commands
```
me@pc ~ $ which vim
/usr/bin/vim
me@pc ~ $
me@pc ~ $ which ls
alias ls='ls --color=always'
        /usr/bin/ls
raoul@pc46 ~ $ alias ls
alias ls='ls --color=always'
```

#### whereis - locate the binary, source, and man page for commands
```
me@pc ~ $ whereis vim
vim: /usr/bin/vim /usr/share/vim /usr/share/man/man1/vim.1.gz
me@pc ~ $
me@pc ~ $ whereis ls
ls: /usr/bin/ls /usr/share/man/man1/ls.1.gz /usr/share/man/man1p/ls.1p.gz
me@pc ~ $ alias ls
alias ls='ls --color=always'
```

### ps, pstree, top
#### ps - report a snapshot of the current processes
```
me@pc ~ $ ps aux | less
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0 191444  3888 ?        Ss   Aug13   0:28 /usr/lib/systemd/systemd --switched-root --system --deserialize 21
root         2  0.0  0.0      0     0 ?        S    Aug13   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S    Aug13   0:20 [ksoftirqd/0]
[...]
root       268  0.0  0.0      0     0 ?        S    Aug13   0:00 [scsi_eh_0]
root       269  0.0  0.0      0     0 ?        S<   Aug13   0:00 [scsi_tmf_0]
:
```

#### pstree - display a tree of processes
```
me@pc ~ $ pstree -p | less
systemd(1)-+-ModemManager(757)-+-{ModemManager}(765)
           |                   `-{ModemManager}(783)
           |-NetworkManager(792)-+-dhclient(870)
           |                     |-{NetworkManager}(837)
           |                     `-{NetworkManager}(840)
           |-Xvnc(1184)
           |-accounts-daemon(852)-+-{accounts-daemon}(855)
           |                      `-{accounts-daemon}(859)
           |-akonadi_control(3006)-+-akonadi_agent_l(3045)---{akonadi_agent_l}(3058)
           |                       |-akonadi_nepomuk(3049)
           |                       |-akonadiserver(3008)-+-mysqld(3010)-+-{mysqld}(3013)
           |                       |                     |              |-{mysqld}(5859)
:
```

#### top - display Linux processes
```
me@pc ~ $ top
top - 15:57:59 up 10 days,  7:54, 19 users,  load average: 0.20, 0.33, 0.35
Tasks: 323 total,   1 running, 322 sleeping,   0 stopped,   0 zombie
%Cpu(s):  3.0 us,  1.1 sy,  0.0 ni, 95.4 id,  0.5 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 16178184 total,  4644304 free,  4750236 used,  6783644 buff/cache
KiB Swap:  8127484 total,  7481968 free,   645516 used. 10828584 avail Mem
 
  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND                                                                                 
 1131 root      20   0  495500 302932  98024 S   3.3  1.9  63:54.91 X                                                                                       
15188 me        20   0  703132  70772  36628 S   3.0  0.4  16:53.95 konsole                                                                                 
30253 me        20   0  287212 176292   6860 S   1.7  1.1  36:17.62 astoshmi                                                                                
 2978 me        20   0 1533680 144116  39332 S   1.3  0.9  31:40.53 plasma-desktop                                                                          
 2954 me        20   0  843056  31112  13116 S   0.3  0.2   2:27.19 kwin                                                                                    
11254 me        20   0  859176 102396  33536 S   0.3  0.6   0:21.90 chrome                                                                                  
30065 me        20   0  168148   2524   1608 R   0.3  0.0   0:00.01 top                                                                                     
    1 root      20   0  191444   3888   2008 S   0.0  0.0   0:28.19 systemd                                                                                                                                                          
   29 root      20   0       0      0      0 S   0.0  0.0   0:01.07 khungtaskd
```

##### shortcuts
* colour ... `z` - Toggle colours on/off.
* help ... `h` - Enters the help page. Exit the page with q or ESC.
* sort column ... `<` and `>` By - pressing `<` or `>` the column to the left/right of the current column becomes the sorted one.
* sgtore settings ... `W` Writes the current settings to `~/.toprc`.

##### view
Set the threads or forrest (pstree alike) view.
* threads ... H
* forrest ... V

Example how to enable colour, highlichting and store setting: `zbxyW`


### diff (zdiff) - compare files line by line
#### with files TODO
#### with folder TODO

### cat (zcat) - concatenate files and  print to stdout
TODO

### filterdiff, lsdiff 
#### filterdiff - extract or exclude diffs from a diff file
```
me@pc ~/tmp $ # filter: include files einding with .p* and exclude ending with .pl
me@pc ~/tmp $ filterdiff --include=*.p* --exclude=*.pl correlator2-useccase-perl-tests-merged_avsimulator-missing.patch  | lsdiff
avcommon/perl/AVBlackBoxTest.pm
avcommon/perl/AVOptions.pm
avcommon/perl/AVUtilities.pm
avcommon/perl/AVTestProgramHandling.pm
avcommon/perl/AVTest.pm
avcommon/perl/AVBlackBoxTest.pm.orig
avcommon/perl/AVProjectIncludes.pm
projects/avibit/acemax/tests/local_test_server/local_test_server_common.pm
projects/avibit/acemax/tests/local_test_server/RTF_export.pm
projects/avibit/acemax/tests/correlator2/dual_channel_tests/run/a_processstate_shm.pid
projects/avibit/acemax/tests/correlator2/cor_single_or_dual_channel_common.pm
me@pc ~/tmp $
```

#### lsdiff - show which files are modified by a patch
```
me@pc ~/tmp :( $ lsdiff mydiff.patch
avcommon/perl/AVBlackBoxTest.pm
avcommon/perl/AVOptions.pm
avcommon/perl/AVUtilities.pm
avcommon/perl/AVTestProgramHandling.pm
avcommon/perl/AVTest.pm
avcommon/perl/AVBlackBoxTest.pm.orig
avcommon/perl/AVProjectIncludes.pm
projects/avibit/acemax/tests/local_test_server/local_test_server_common.pm
projects/avibit/acemax/tests/local_test_server/RTF_export.pm
projects/avibit/acemax/tests/correlator2/dual_channel_tests/log
projects/avibit/acemax/tests/correlator2/dual_channel_tests/run/a_processstate_shm.pid
projects/avibit/acemax/tests/correlator2/dual_channel_tests/channel_a/config/avtimereference.cfg
projects/avibit/acemax/tests/correlator2/dual_channel_tests/channel_b/config/avtimereference.cfg
projects/avibit/acemax/tests/correlator2/dual_channel_tests/log_uc_f7/avtimereferenceserver-20181210.log
projects/avibit/acemax/tests/correlator2/cor_single_or_dual_channel_common.pm
me@pc ~/tmp $
```

### patch
```
patch - apply a diff file to an original
me@pc ~/workspaces/workspace-3 $ mkdir stash
me@pc ~/workspaces/workspace-3 $ cd svn
me@pc ~/workspaces/workspace-3/svn $ svn diff > ../stash/my.patch   # stash changes away
me@pc ~/workspaces/workspace-3/svn $ svn revert -R .                # do sth
me@pc ~/workspaces/workspace-3/svn $ patch -p0 < ../stash/my.patch  # restore stash
me@pc ~/workspaces/workspace-3/svn $svn st                          # plausi check
...
```



### find - search for files in a directory hierarchy
#### by name ... `find ./ -name "pattern"`
```
-size n[cwbkMG]
             File uses n units of space.  The following suffixes can be used:
 
             `b'    for 512-byte blocks (this is the default if no suffix is used)
 
             `c'    for bytes
 
             `w'    for two-byte words
 
             `k'    for Kilobytes (units of 1024 bytes)
 
             `M'    for Megabytes (units of 1048576 bytes)
 
             `G'    for Gigabytes (units of 1073741824 bytes)
 
             The size does not count indirect blocks, but it does count blocks in sparse files that are not actually allocated.  Bear in mind  that  the
             `%k'  and  `%b'  format  specifiers  of -printf handle sparse files differently.  The `b' suffix always denotes 512-byte blocks and never 1
             Kilobyte blocks, which is different to the behaviour of -ls.
```

#### by size ... `find ./ -type f -size +1k -size -10M`
```
-size n[cwbkMG]
             File uses n units of space.  The following suffixes can be used:
 
             `b'    for 512-byte blocks (this is the default if no suffix is used)
 
             `c'    for bytes
 
             `w'    for two-byte words
 
             `k'    for Kilobytes (units of 1024 bytes)
 
             `M'    for Megabytes (units of 1048576 bytes)
 
             `G'    for Gigabytes (units of 1073741824 bytes)
 
             The size does not count indirect blocks, but it does count blocks in sparse files that are not actually allocated.  Bear in mind  that  the
             `%k'  and  `%b'  format  specifiers  of -printf handle sparse files differently.  The `b' suffix always denotes 512-byte blocks and never 1
             Kilobyte blocks, which is different to the behaviour of -ls.
```

#### by last changed age ... find ./ -cmin <minutes>1
##### examples

TODO
search for arbitrary files and summarize their size `find . -name "*.log" -size +3M -exec du -ch {} +`

```
me@pc:~/workspaces$ find . -name "*.log" -size +3M -exec du -ch {} +
TODO - example
835M    total
```

TODO explanation
```
me@pc:~/workspaces$ find . -name "*.log" -size +3M | xargs ls -lah
TODO - example
```


### grep (zgrep) - print lines matching a pattern
* case insensitive ... `-i` - match using insensitive case
* invert match ... `-v` - prints non-matching lines
* regular expression ... `-E`
* context ... `-C NUM` - Print NUM lines of output context.
* after context ... `-A` - Print NUM lines of trailing context after matching lines.
* before context ... `-B` - Print  NUM  lines of leading context before matching lines.

TODO examples

* **Note:** (question) grep does not match the end of line at `EOF`. 
(warning) grep will never match the end of line at the last line of file. 
Thus, it is a good style to always append empty newline at `EOF`.

* **Hint:** (question) grep does not match, although the pattern is correct. 
(warning) If the output is printed to stderr, stderr must be redirected to stdout: `a.out 2>&1 | grep "foo".`


### tr - translate or delete characters
Translate, squeeze, and/or delete characters from standard input, writing to standard output. 
When translating use the mapping of SET1 and SET2 (first character of SET1 corresponds to first character of SET2).
When deleting use characters of SET1. TODO

TODO examples 

### cut - remove sections from each line of files TODO
TODO examples 

### wc (word count) - print newline, word, and byte counts for each file
#### arguments
* wc --lines or -l
* wc --words or -w
* wc --max-line-length or -L

TODO example

Count number of log entries for specific track having an invalid or valid FL: TODO


### sort, uniq
#### sort - sort lines of text files 
Write sorted concatenation of all FILE(s) to standard output.
##### examples
* `sort --ignore-case` fold lower case to upper case characters
* `sort --reverse` reverse the result of comparisons
* `sort --random-sort` sort by random hash of keys

#### uniq - report or omit repeated lines
Filter adjacent matching lines from INPUT (or standard input), writing to OUTPUT (or standard output).
TODO examples

##### examples 
* `uniq --count` prefix lines by the number of occurrences
* `uniq --repeated` only print duplicate lines, one for each group
* `uniq --ignore-case` ignore differences in case when comparing
* `uniq --skip-chars=N` avoid comparing the first N characters
* `uniq --check-chars=N` compare no more than N characters in lines

TODO examples

### sed - stream editor
sed is a stream editor for filtering and transforming text. 
This section provides a brief introduction (TODO more examples from CF...)
examples
* `sed "<options>" <input-file>`  read input file, apply options and print the result to std-out
* `sed --in-place "<options>" <input-file>` same as above, but edit file content
* `echo "<text>" | sed "<options>"` provide input to sed by std-in instead of file
* `sed "s/<regexp>/<replacement>/" <input-file>` substitute <regexp> by <replacement>
* `-r` ... use regular expressions - allow unescaped regular expressions. Example: `\(\[0-9\].*\)` vs. `([0-9].*)`
* `-n` ... quiet - suppress automatic printing of pattern space

example - filter text: capture groups with regular expression

Filter out parts from from a text and present it in a tabular form:
```
#filter text parts from:
item a time 10:00 foo
item bcd time 12:00 bar
 
# trial 1
$ echo -e "item a time 10:00 foo\nitem bcd time 12:00 bar" | sed -rn "s/item (.*) time (.*)/|\2|\1|/p"
|10:00 foo|a|
|12:00 bar|bcd|
 
# trial 2 - strengthen the regular expression for the captures
$ echo -e "item a time 10:00 foo\nitem bcd time 12:00 bar" | sed -rn "s/item ([a-z]*) time ([0-9:]*)/|\2|\1|/p"
|10:00|a| foo
|12:00|bcd| bar
 
# trial 3 - What happened in trial 2 is that only the matching part is replaced. For this we now match the whole line:
$ echo -e "item a time 10:00 foo\nitem bcd time 12:00 bar" | sed -rn "s/.*item ([a-z]*) time ([0-9:]*).*/|\2|\1|/p"
|10:00|a|
|12:00|bcd|
 
# trial 3 - Bring the output into a tabular format:
$ echo -e "item a time 10:00 foo\nitem bcd time 12:00 bar" | sed -rn "s/.*item ([a-z]*) time ([0-9:]*).*/|\2|\1\t|/p"
|10:00|a        |
|12:00|bcd      |
```

### dmesg - print or control the kernel ring buffer

TODO add -W 

human readable plus colour
```
me@pc ~ $ dmesg -H
[...]
[ +0.254083] IPv6: ADDRCONF(NETDEV_CHANGE): vethb648f58: link becomes ready
[ +0.000016] docker0: port 1(vethb648f58) entered forwarding state
[ +0.000022] docker0: port 1(vethb648f58) entered forwarding state
[ +15.037201] docker0: port 1(vethb648f58) entered forwarding state
[Sep14 14:16] perf: interrupt took too long (2504 > 2500), lowering kernel.perf_event_max_sample_rate to 79000
[Sep14 14:28] archreplayer_th[12074]: segfault at 302b8008 ip 00000000f50ab8ef sp 00000000f2c8bb10 error 4 in libc-2.12.so[f5038000+190000]
[Sep14 16:50] perf: interrupt took too long (3132 > 3130), lowering kernel.perf_event_max_sample_rate to 63000
[Sep15 14:49] perf: interrupt took too long (3919 > 3915), lowering kernel.perf_event_max_sample_rate to 51000
[Sep15 17:30] traps: chrome[8893] trap int3 ip:7f881976ff11 sp:7ffcf09d9660 error:0
[Sep17 14:11] overlayfs: Warning: Copying up utmp, but open R/O on fd 3 which will cease to be coherent [pid=20394 utempter]
[Sep17 14:20] QThread[18576]: segfault at 10 ip 0000000000000010 sp 00000000ef6767ac error 14 in repplayer[8048000+13c000]
[Sep17 14:22] FS-Cache: Loaded
[ +0.005725] FS-Cache: Netfs 'nfs' registered for caching
[ +0.003427] Key type dns_resolver registered
[ +0.008383] NFS: Registering the id_resolver key type
[ +0.000012] Key type id_resolver registered
[ +0.000001] Key type id_legacy registered
me@pc ~ $
```

human readable timestamps
```
me@pc ~ $ dmesg -T
[...]
[Fri Sep 14 10:53:40 2018] IPv6: ADDRCONF(NETDEV_CHANGE): vethb648f58: link becomes ready
[Fri Sep 14 10:53:40 2018] docker0: port 1(vethb648f58) entered forwarding state
[Fri Sep 14 10:53:40 2018] docker0: port 1(vethb648f58) entered forwarding state
[Fri Sep 14 10:53:55 2018] docker0: port 1(vethb648f58) entered forwarding state
[Fri Sep 14 14:16:50 2018] perf: interrupt took too long (2504 > 2500), lowering kernel.perf_event_max_sample_rate to 79000
[Fri Sep 14 14:28:15 2018] archreplayer_th[12074]: segfault at 302b8008 ip 00000000f50ab8ef sp 00000000f2c8bb10 error 4 in libc-2.12.so[f5038000+190000]
[Fri Sep 14 16:50:12 2018] perf: interrupt took too long (3132 > 3130), lowering kernel.perf_event_max_sample_rate to 63000
[Sat Sep 15 14:49:22 2018] perf: interrupt took too long (3919 > 3915), lowering kernel.perf_event_max_sample_rate to 51000
[Sat Sep 15 17:30:25 2018] traps: chrome[8893] trap int3 ip:7f881976ff11 sp:7ffcf09d9660 error:0
[Mon Sep 17 14:11:21 2018] overlayfs: Warning: Copying up utmp, but open R/O on fd 3 which will cease to be coherent [pid=20394 utempter]
[Mon Sep 17 14:20:34 2018] QThread[18576]: segfault at 10 ip 0000000000000010 sp 00000000ef6767ac error 14 in repplayer[8048000+13c000]
[Mon Sep 17 14:22:49 2018] FS-Cache: Loaded
[Mon Sep 17 14:22:49 2018] FS-Cache: Netfs 'nfs' registered for caching
[Mon Sep 17 14:22:49 2018] Key type dns_resolver registered
[Mon Sep 17 14:22:49 2018] NFS: Registering the id_resolver key type
[Mon Sep 17 14:22:49 2018] Key type id_resolver registered
[Mon Sep 17 14:22:49 2018] Key type id_legacy registered
me@pc ~ $
```

old style `tail -f`
```
me@pc ~ $ sudo tail -f /var/log/messages
Sep 17 16:51:38 pc46 distccd[17815]: (dcc_collect_child) cc times: user 0.000000s, system 0.000000s, 0 minflt, 0 majflt
Sep 17 16:51:38 pc46 distccd[17815]: /opt/avibit64/gcc/gcc-6.2.0/bin/g++ /home/users/patrick.ehrenhoefer/workspace/birmingham/svn/avcommon/src5/utils/avstopbarsimulator/avstopbarsimulator.cpp on localhost completed ok
Sep 17 16:51:38 pc46 distccd[17815]: job complete
Sep 17 16:51:38 pc46 distccd[17815]: (dcc_job_summary) client: 10.1.7.199:56978 COMPILE_OK exit:0 sig:0 core:0 ret:0 time:13250ms /opt/avibit64/gcc/gcc-6.2.0/bin/g++ /home/users/patrick.ehrenhoefer/workspace/birmingham/svn/avcommon/src5/utils/avstopbarsimulator/avstopbarsimulator.cpp
Sep 17 16:51:38 pc46 distccd[17815]: (dcc_preforked_child) worn out
Sep 17 16:51:38 pc46 distccd[17815]: (dcc_exit) exit: code 0; self: 0.024018 user 0.593421 sys; children: 139.984030 user 6.289045 sys
Sep 17 16:51:38 pc46 distccd[1021]: (dcc_log_child_exited) child 17815 exited: exit status 0
Sep 17 16:51:40 pc46 distccd[19270]: (dcc_check_client) connection from 10.1.7.199:56994
Sep 17 16:51:40 pc46 distccd[19270]: compile from repexportdatawidget.cpp to repexportdatawidget.cpp.o
Sep 17 16:51:50 pc46 distccd[19270]: (dcc_r_file_timed) 3124870 bytes received in 0.083676s, rate 36470kB/s
Sep 17 16:51:52 pc46 distccd[19270]: (dcc_collect_child) cc times: user 0.000000s, system 0.000000s, 0 minflt, 0 majflt
Sep 17 16:51:52 pc46 distccd[19270]: /opt/avibit64/gcc/gcc-6.2.0/bin/g++ /home/users/patrick.ehrenhoefer/workspace/birmingham/svn/repmax/src5/core/ui/repexportdatawidget.cpp on localhost completed ok
Sep 17 16:51:52 pc46 distccd[19270]: job complete
Sep 17 16:51:52 pc46 distccd[19270]: (dcc_job_summary) client: 10.1.7.199:56994 COMPILE_OK exit:0 sig:0 core:0 ret:0 time:12236ms /opt/avibit64/gcc/gcc-6.2.0/bin/g++ /home/users/patrick.ehrenhoefer/workspace/birmingham/svn/repmax/src5/core/ui/repexportdatawidget.cpp
^Cme@pc ~ $
```

### dirs, pushd, popd
This commands allows to change directories as with cd, but additionally stores the history to a stack. The current directory is always on stack.
#### dirs - list stack
    dirs ... list stack
        if listed horizontally (dirs or dirs -l), left most is the top of stack (index 0)
        if listed vertically (dirs -p or dirs -v), upper most is top of stack (index 0)

#### pushd - change to directory, and store it to stack
#### popd - change to directory stored on top of stack, and remove from stack !MACRO

TODO examples

### wget - the non-interactive network downloader
GNU Wget is a free utility for non-interactive download of files from the Web. It supports HTTP, HTTPS, and FTP protocols, as well as retrieval through HTTP proxies.

args 
* `--user=user`
* `--password=password`
* `--continue` ... continue getting a partially-downloaded file.
* `--no-check-certificate` ... Don't check the server certificate against the available certificate authorities. Also don't require the URL host name to match the common name presented by the certificate. !MACRO

### rsync, scp
#### rsync - a fast, versatile, remote (and local) file-copying tool 
TODO rsync example

#### scp - secure copy (remote file copy program)
TODO scp local example: if progress bar is needed ...
TODO Note: mention ssh-copy-id

### who - show who is logged on
TODO explain
* `who -all`

### du, df, lsblk 
#### du - estimate file space usage
Summarize disk usage of each FILE, recursively for directories.
example
* du -sh


#### df - report file system disk space usage
df displays the amount of disk space available on the file system containing each file name argument. If no file name is given, the space available on all currently mounted file systems is shown. Disk space is shown in 1K blocks by default, unless the environment variable POSIXLY_CORRECT is set, in which case 512-byte blocks are used.
example
* df -h

#### lsblk - list block devices
The command prints all block devices (except RAM disks) in a tree-like format by default. Use lsblk --help to get a list of all available columns.
example
* lsblk

TODO examples (code block)

### watch - execute a program periodically, showing output fullscreen 
args 

* `watch '<command>'`
* `watch -n '<command>'`

examples
```
me@pc ~ $ # periodically list USB devices
me@pc ~ $ watch -n1 'ls /dev/ttyUSB*'
Every 1.0s: ls /dev/ttyUSB* Mon Sep 17 17:29:39 2018
ls: cannot access /dev/ttyUSB*: No such file or directory
 
 
^C
me@pc ~/empty $
```

### CTRL+z (sleep), fg (foreground), jobs
args
* pause and send current job to background ... CTRL+z
* resume job from background ... fg
* list jobs in background ... jobs -l

examples
pause and resume
```
me@pc ~/empty $ watch 'ls'
Every 2.0s: ls
 
CTRL+z # <--- pause job
[5]+  Stopped                 watch 'ls'
me@pc ~/empty $ # job is now paused in background
me@pc ~/empty $ fg
Every 2.0s: ls
 
^C
me@pc ~/empty $
```

multiple jobs
```
me@pc ~/empty $ watch 'ls'
Every 2.0s: ls
 
CTRL+z # <--- pause job 1
[1]+  Stopped                 watch 'ls'
me@pc ~/empty :( $ watch 'ls'
Every 2.0s: ls
 
CTRL+z # <--- pause job 2
[2]+  Stopped                 watch 'ls'
me@pc ~/empty :( $ watch 'ls'
Every 2.0s: ls
 
CTRL+z # <--- pause job 3
[3]+  Stopped                 watch 'ls'
me@pc ~/empty :( $ watch 'ls'
Every 2.0s: ls
 
CTRL+z # <--- pause job 4
[4]+  Stopped                 watch 'ls'
me@pc ~/empty :( $ jobs
[1]   Stopped                 watch 'ls'
[2]   Stopped                 watch 'ls'
[3]-  Stopped                 watch 'ls'
[4]+  Stopped                 watch 'ls' # <--- last job paused
me@pc ~/empty $ fg 2 # <--- bring back job 2
Every 2.0s: ls
 
^C  # <--- abort job
me@pc ~/empty $ jobs
[1]   Stopped                 watch 'ls'
[3]-  Stopped                 watch 'ls'
[4]+  Stopped                 watch 'ls'
me@pc ~/empty $
```

### screen - screen manager with VT100/ANSI terminal emulation
TODO

### nmap - network exploration tool and security / port scanner

single host
```
me@pc ~ $ nmap 11.1.1.26
 
Starting Nmap 6.40 ( http://nmap.org ) at 2018-10-19 14:18 CEST
Nmap scan report for pc46.avibit.com (11.1.1.26)
Host is up (0.00018s latency).
Not shown: 993 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
111/tcp  open  rpcbind
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
5901/tcp open  vnc-1
5902/tcp open  vnc-2
6002/tcp open  X11:2
 
Nmap done: 1 IP address (1 host up) scanned in 0.04 seconds
me@pc ~ $ nmap -O 11.1.1.26
```
ip-range
```
me@pc ~ $ nmap 11.1.1.1-10
 
Starting Nmap 6.40 ( http://nmap.org ) at 2018-10-19 14:16 CEST
Nmap scan report for wf.com (10.1.1.1)
Host is up (0.00028s latency).
Not shown: 997 filtered ports
PORT    STATE SERVICE
22/tcp  open  ssh
80/tcp  open  http
443/tcp open  https
 
Nmap scan report for padl.com (11.1.1.2)
Host is up (0.00028s latency).
Not shown: 996 closed ports
PORT    STATE SERVICE
22/tcp  open  ssh
53/tcp  open  domain
389/tcp open  ldap
636/tcp open  ldapssl
[...]
 
Nmap done: 10 IP addresses (7 hosts up) scanned in 57.80 seconds
me@pc ~ $ 
```
OS detection
```
me@pc ~ $ sudo nmap -O 11.1.1.26
[sudo] password for me:
 
Starting Nmap 6.40 ( http://nmap.org ) at 2018-10-19 14:18 CEST
Nmap scan report for pc.com (11.1.1.26)
Host is up (-560s latency).
Not shown: 993 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
111/tcp  open  rpcbind
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
5901/tcp open  vnc-1
5902/tcp open  vnc-2
6002/tcp open  X11:2
Device type: general purpose
Running: Linux 3.X
OS CPE: cpe:/o:linux:linux_kernel:3
OS details: Linux 3.7 - 3.9
Network Distance: 0 hops
 
OS detection performed. Please report any incorrect results at http://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 3.71 seconds
me@pc ~ $ 
```

aggressive & paranoid scan
```
me@pc ~ $  nmap -A -T4 scanme.nmap.org
 
Starting Nmap 6.40 ( http://nmap.org ) at 2018-10-19 14:10 CEST
Stats: 0:00:11 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan
Service scan Timing: About 75.00% done; ETC: 14:10 (0:00:02 remaining)
Nmap scan report for scanme.nmap.org (45.33.32.156)
Host is up (0.18s latency).
Not shown: 995 closed ports
PORT      STATE    SERVICE    VERSION
22/tcp    open     ssh        (protocol 2.0)
| ssh-hostkey: 1024 ac:00:a0:1a:82:ff:cc:55:99:dc:67:2b:34:97:6b:75 (DSA)
| 2048 20:3d:2d:44:62:2a:b0:5a:9d:b5:b3:05:14:c2:a6:b2 (RSA)
|_256 96:02:bb:5e:57:54:1c:4e:45:2f:56:4c:4a:24:b2:57 (ECDSA)
25/tcp    filtered smtp
80/tcp    open     http       Apache httpd 2.4.7 ((Ubuntu))
|_http-title: Go ahead and ScanMe!
9929/tcp  open     nping-echo Nping echo
31337/tcp open     tcpwrapped
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at http://www.insecure.org/cgi-bin/servicefp-submit.cgi :
SF-Port22-TCP:V=6.40%I=7%D=10/19%Time=5BC9C9AE%P=x86_64-redhat-linux-gnu%r
SF:(NULL,2C,"SSH-2\.0-OpenSSH_6\.6\.1p1\x20Ubuntu-2ubuntu2\.10\r\n");
 
Service detection performed. Please report any incorrect results at http://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 16.85 seconds
me@pc ~ $ 
```


### route - show / manipulate the IP routing table 
args
* `-n` ... show numerical addresses instead of trying to determine symbolic host names.

list
```
me@pc ~ $ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.1.1.1        0.0.0.0         UG    100    0        0 eno1
10.1.0.0        0.0.0.0         255.255.248.0   U     100    0        0 eno1
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 virbr0
me@pc ~ $
```

#### add default GW
Route all traffic via `192.168.1.254` gateway connected via `eth0` network interface:
```
route add default gw 192.168.1.254 eth0
```
#### add net

Route traffic for the net  12.34.0.0/16 via gateway 12.34.56.1.
```
route add -net 12.34.0.0 netmask 255.255.0.0 gw 12.34.56.1
```

#### del default gw
Delete the route for all traffic via 192.168.1.254 gateway connected via eth0 network interface:
```
route del default gw 192.168.1.254
```

### del net
Delete route the net  12.34.0.0/16.
```
route del -net 12.34.0.0 netmask 255.255.0.0
```

### ls{hw,usb,pci,blk,cpu}

#### lshw - list hardware
args
* verbose output ... `lshw`
* brief output ... `lshw -short`

brief
```
me@pc ~/ $ lshw -short
WARNING: you should run this program as super-user.
H/W path           Device       Class          Description
==========================================================
                                system         Computer
/0                              bus            Motherboard
/0/0                            memory         15GiB System memory
/0/1                            processor      Intel(R) Core(TM) i3-4330 CPU @ 3.50GHz
/0/100                          bridge         4th Gen Core Processor DRAM Controller
/0/100/1                        bridge         Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller
/0/100/1/0                      display        GF119 [NVS 310]
/0/100/1/0.1                    multimedia     GF119 HDMI Audio Controller
/0/100/2                        display        Xeon E3-1200 v3/4th Gen Core Processor Integrated Graphics Controller
/0/100/3                        multimedia     Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller
/0/100/14                       bus            8 Series/C220 Series Chipset Family USB xHCI
/0/100/16                       communication  8 Series/C220 Series Chipset Family MEI Controller #1
/0/100/16.3                     communication  8 Series/C220 Series Chipset Family KT Controller
/0/100/19          eno1         network        Ethernet Connection I217-LM
/0/100/1a                       bus            8 Series/C220 Series Chipset Family USB EHCI #2
/0/100/1b                       multimedia     8 Series/C220 Series Chipset High Definition Audio Controller
/0/100/1d                       bus            8 Series/C220 Series Chipset Family USB EHCI #1
/0/100/1f                       bridge         Q87 Express LPC Controller
/0/100/1f.2        scsi2        storage        8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode]
/0/100/1f.2/0.0.0  /dev/cdrom   disk           CDDVDW SN-208FB
/0/100/1f.3                     bus            8 Series/C220 Series Chipset Family SMBus Controller
/1                 vethb648f58  network        Ethernet interface
/2                 virbr0-nic   network        Ethernet interface
/3                 virbr0       network        Ethernet interface
/4                 docker0      network        Ethernet interface
WARNING: output may be incomplete or inaccurate, you should run this program as super-user.
me@pc ~ $
```

verbose
```
me@pc ~ $ # print last 7 lines only
me@pc ~ $ lshw | tail -n7
  *-network:3              
       description: Ethernet interface
       physical id: 5
       logical name: docker0
       serial: 02:42:b3:15:63:07
       capabilities: ethernet physical
       configuration: broadcast=yes driver=bridge driverversion=2.3 firmware=N/A ip=172.17.0.1 link=yes multicast=yes
me@pc ~ $
```

#### lsusb - list USB devices
args

    brief ... lsusb
    verbose ... lsusb -v

brief
```
me@pc ~ $ lsusb
Bus 002 Device 002: ID 8087:8000 Intel Corp.
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 8087:8008 Intel Corp.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID 03f0:354a Hewlett-Packard
Bus 003 Device 002: ID 03f0:134a Hewlett-Packard Optical Mouse
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
me@pc ~ $
```

verbose
```
me@pc ~ $ # print last 14 lines only
me@pc ~ $ lsusb -v | tail -n 14
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
me@pc ~ $ 
```

#### lspci - list all PCI devices
brief
```
me@pc ~ $ lspci
00:00.0 Host bridge: Intel Corporation 4th Gen Core Processor DRAM Controller (rev 06)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller (rev 06)
00:02.0 Display controller: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor Integrated Graphics Controller (rev 06)
00:03.0 Audio device: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller (rev 06)
00:14.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB xHCI (rev 04)
00:16.0 Communication controller: Intel Corporation 8 Series/C220 Series Chipset Family MEI Controller #1 (rev 04)
00:16.3 Serial controller: Intel Corporation 8 Series/C220 Series Chipset Family KT Controller (rev 04)
00:19.0 Ethernet controller: Intel Corporation Ethernet Connection I217-LM (rev 04)
00:1a.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #2 (rev 04)
00:1b.0 Audio device: Intel Corporation 8 Series/C220 Series Chipset High Definition Audio Controller (rev 04)
00:1d.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #1 (rev 04)
00:1f.0 ISA bridge: Intel Corporation Q87 Express LPC Controller (rev 04)
00:1f.2 SATA controller: Intel Corporation 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode] (rev 04)
00:1f.3 SMBus: Intel Corporation 8 Series/C220 Series Chipset Family SMBus Controller (rev 04)
01:00.0 VGA compatible controller: NVIDIA Corporation GF119 [NVS 310] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GF119 HDMI Audio Controller (rev a1)
me@pc ~ $
```

verbose
```
me@pc ~ $ # print last 14 lines only
me@pc ~ $ lspci -v | tail -n 14
        I/O ports at e000 [size=128]
        [virtual] Expansion ROM at f7000000 [disabled] [size=512K]
        Capabilities: <access denied>
        Kernel driver in use: nvidia
        Kernel modules: nouveau, nvidia_drm, nvidia
 
01:00.1 Audio device: NVIDIA Corporation GF119 HDMI Audio Controller (rev a1)
        Subsystem: Hewlett-Packard Company Device 094e
        Flags: bus master, fast devsel, latency 0, IRQ 17
        Memory at f7080000 (32-bit, non-prefetchable) [size=16K]
        Capabilities: <access denied>
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel
 
me@pc ~ $
```

#### lsblk - list block devices
args
* tree format ... `lsblk`
* list format ... `lsblk -l`

structured
```
me@pc ~ $ lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 238.5G  0 disk
├─sda1   8:1    0   7.8G  0 part [SWAP]
└─sda2   8:2    0 230.7G  0 part /
sdb      8:16   0 465.8G  0 disk
└─sdb1   8:17   0 465.8G  0 part /data
sr0     11:0    1  1024M  0 rom 
me@pc ~ $
```

list
```
me@pc6 ~ $ lsblk -l
NAME MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda    8:0    0 238.5G  0 disk
sda1   8:1    0   7.8G  0 part [SWAP]
sda2   8:2    0 230.7G  0 part /
sdb    8:16   0 465.8G  0 disk
sdb1   8:17   0 465.8G  0 part /data
sr0   11:0    1  1024M  0 rom 
me@pc ~ $
```

#### lscpu - display information about the CPU architecture
```
me@pc ~ $ lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    2
Core(s) per socket:    2
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 60
Model name:            Intel(R) Core(TM) i3-4330 CPU @ 3.50GHz
Stepping:              3
CPU MHz:               3500.410
BogoMIPS:              6984.21
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              4096K
NUMA node0 CPU(s):     0-3
me@pc ~ $
```


### Reminder for Other Useful Commands
* `ncdu` - NCurses Disk Usage
* `htop` - interactive process viewer
* `netstat` (-tupln) - Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships
* `export` - export environment variables
* `lsof` - list open files
* `mount` - mount a filesystem
* `date` - print or set the system date and time
* `uptime` - Tell how long the system has been running
* `whoami` - Print the user name associated with the current effective user ID
* `groups` - print the groups a user is in
* `$?` - the return value of last executed command, 0 on success != 0 otherwise
* `$0` - the name of current script/binary
* `$1` - the first argument to the current script/binary

#### Unix commands cheat sheet
TODO link to GLT
