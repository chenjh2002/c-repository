# shell

## Using the shell
This is the main textual interface to the shell. It tells you that you are on the machine missing and that your `current working directory`, or where you currently are, is `~` (short for "home"). The $ tells you that you are not the root user (more on that later).

base command
```sh
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster$ date
Fri May  5 21:59:25 CST 2023
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster$ echo hello
hello
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster$ which echo
/usr/bin/echo
```

The `echo` program simply prints out its arguments.The shell parses the command by spliting it by whitespace,and then runs the program indeicated by the first word,supplying each subsequent word as an argument that the program canaccess.

Shell is a programming envirnment,just like Python or Ruby,and so it has variables,conditionals,loops and functions(next lecture!).When you run commands in your shell,youare really writting a small bit of code that your shell interprets.If the shell is asked to execute a command that doesn't match one of its programming keywords,it consults an `environment variable` called `$PATH` that lists which directories the shell should search for programs when it is given a command:
```sh
missing:~$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
missing:~$ which echo
/bin/echo
missing:~$ /bin/echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

## Navigating in the shell
A path on the shell is delimited list of directories;separated by `/` on Linux.A path that starts with `/` is called an `absolute` path.Any other path is `relative` path.Relative paths are relative to current working directory,which we can see with the `pwd` command anf change with the `cd`command.In a path,`.` refers to the current directory,and `..` to its parent directory:

```sh
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster/shell$ pwd
/home/chenjh2002/软件实践/missing_semster/shell
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster/shell$ cd /home
chenjh2002@LAPTOP-SUUQN6NE:/home$ cd ..
chenjh2002@LAPTOP-SUUQN6NE:/$ cd ./home/
```

To see what lives in a given directory,we use the `ls` command:
```sh
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster/shell$ ls
shell.md  test.sh
```

Unless a directory is given as its first argument,`ls` will print the contents of the current directory.Most commands accept flags and options(flags with values)that start with `-` to modify their behavior.Usually,running a program with the `-h` or `--help` flag will print some help text that tells you what flags anf options are available.e.g,`ls --help` tells us:
```sh
-l      use a long listing format
```

list of options about `ls`:
```sh
  -a, --all                  do not ignore entries starting with .
  -A, --almost-all           do not list implied . and ..
      --author               with -l, print the author of each file
  -b, --escape               print C-style escapes for nongraphic characters
      --block-size=SIZE      with -l, scale sizes by SIZE when printing them;
                               e.g., '--block-size=M'; see SIZE format below
  -B, --ignore-backups       do not list implied entries ending with ~
  -c                         with -lt: sort by, and show, ctime (time of last
                               modification of file status information);
                               with -l: show ctime and sort by name;
                               otherwise: sort by ctime, newest first
  -C                         list entries by columns
      --color[=WHEN]         colorize the output; WHEN can be 'always' (default
                               if omitted), 'auto', or 'never'; more info below
  -d, --directory            list directories themselves, not their contents
  -D, --dired                generate output designed for Emacs' dired mode
  -f                         do not sort, enable -aU, disable -ls --color
  -F, --classify             append indicator (one of */=>@|) to entries
      --file-type            likewise, except do not append '*'
      --format=WORD          across -x, commas -m, horizontal -x, long -l,
                               single-column -1, verbose -l, vertical -C
      --full-time            like -l --time-style=full-iso
  -g                         like -l, but do not list owner
      --group-directories-first
                             group directories before files;
                               can be augmented with a --sort option, but any
                               use of --sort=none (-U) disables grouping
  -G, --no-group             in a long listing, don't print group names
  -h, --human-readable       with -l and -s, print sizes like 1K 234M 2G etc.
      --si                   likewise, but use powers of 1000 not 1024
  -H, --dereference-command-line
                             follow symbolic links listed on the command line
      --dereference-command-line-symlink-to-dir
                             follow each command line symbolic link
                               that points to a directory
      --hide=PATTERN         do not list implied entries matching shell PATTERN
                               (overridden by -a or -A)
      --hyperlink[=WHEN]     hyperlink file names; WHEN can be 'always'
                               (default if omitted), 'auto', or 'never'
      --indicator-style=WORD  append indicator with style WORD to entry names:
                               none (default), slash (-p),
                               file-type (--file-type), classify (-F)
  -i, --inode                print the index number of each file
  -I, --ignore=PATTERN       do not list implied entries matching shell PATTERN
  -k, --kibibytes            default to 1024-byte blocks for disk usage;
                               used only with -s and per directory totals
  -l                         use a long listing format
  -L, --dereference          when showing file information for a symbolic
                               link, show information for the file the link
                               references rather than for the link itself
  -m                         fill width with a comma separated list of entries
  -n, --numeric-uid-gid      like -l, but list numeric user and group IDs
  -N, --literal              print entry names without quoting
  -o                         like -l, but do not list group information
  -p, --indicator-style=slash
                             append / indicator to directories
  -q, --hide-control-chars   print ? instead of nongraphic characters
      --show-control-chars   show nongraphic characters as-is (the default,
                               unless program is 'ls' and output is a terminal)
  -Q, --quote-name           enclose entry names in double quotes
      --quoting-style=WORD   use quoting style WORD for entry names:
                               literal, locale, shell, shell-always,
                               shell-escape, shell-escape-always, c, escape
                               (overrides QUOTING_STYLE environment variable)
  -r, --reverse              reverse order while sorting
  -R, --recursive            list subdirectories recursively
  -s, --size                 print the allocated size of each file, in blocks
  -S                         sort by file size, largest first
      --sort=WORD            sort by WORD instead of name: none (-U), size (-S),
                               time (-t), version (-v), extension (-X)
      --time=WORD            with -l, show time as WORD instead of default
                               modification time: atime or access or use (-u);
                               ctime or status (-c); also use specified time
                               as sort key if --sort=time (newest first)
      --time-style=TIME_STYLE  time/date format with -l; see TIME_STYLE below
  -t                         sort by modification time, newest first
  -T, --tabsize=COLS         assume tab stops at each COLS instead of 8
  -u                         with -lt: sort by, and show, access time;
                               with -l: show access time and sort by name;
                               otherwise: sort by access time, newest first
  -U                         do not sort; list entries in directory order
  -v                         natural sort of (version) numbers within text
  -w, --width=COLS           set output width to COLS.  0 means no limit
  -x                         list entries by lines instead of by columns
  -X                         sort alphabetically by entry extension
  -Z, --context              print any security context of each file
  -1                         list one file per line.  Avoid '\n' with -q or -b
      --help     display this help and exit
      --version  output version information and exit
```


```sh
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster/shell$ ls -l /home
total 4
drwxr-xr-x 39 chenjh2002 chenjh2002 4096 May  5 22:30 chenjh2002
```

First,the `d` at the beginning of the line tells us that `chenjh2002` is a directory. Then follow three groups of three characters(`rwx`)。These indeicate what permissions the owner of the file(`chenjh2002`),the owning group(`chenjh2002`),and everyone else  respectively have onthe relevant item.A `-` indeicates that the given principal does not have the given permission.Above,only the owner is allowed to modify(`w`) the `chenjh2002` directory.To enter a directory, a user must have `search`(represented by "execute": `x`) permissions on that directory (and its parents). To list its contents, a user must have read (`r`) permissions on that directory. For files, the permissions are as you would expect. Notice that nearly all the files in `/bin` have the x permission set for the last group, `everyone else`, so that anyone can execute those programs.

Some other handy programs to know about at this point are mv (to rename/move a file), cp (to copy a file), and mkdir (to make a new directory).

If you ever want more information about a program’s arguments, inputs, outputs, or how it works in general, give the man program a try. It takes as an argument the name of a program, and shows you its manual page. Press q to exit.

## Connecting programs
In the shell, programs have two primary “streams” associated with them: their input stream and their output stream. When the program tries to read input, it reads from the input stream, and when it prints something, it prints to its output stream. Normally, a program’s input and output are both your terminal. That is, your keyboard as input and your screen as output. However, we can also rewire those streams!

The simplest form of redirection is `< file` and `> file`. These let you rewire the input and output streams of a program to a file respectively:

```sh
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster/shell$ echo hello > hello.txt
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster/shell$ cat hello.txt
hello
chenjh2002@LAPTOP-SUUQN6NE:~/软件实践/missing_semster/shell$ cat<hello.txt >hello2.txt
```

Demonstrated in the example above, `cat` is a program that concatenates files. When given file names as arguments, it prints the contents of each of the files in sequence to its output stream. But when `cat` is not given any arguments, it prints contents from its input stream to its output stream (like in the third example above).

You can also use `>>` to append to a file. Where this kind of input/output redirection really shines is in the use of pipes. The `|` operator lets you “chain” programs such that the output of one is the input of another:


```sh
missing:~$ ls -l / | tail -n1
drwxr-xr-x 1 root  root  4096 Jun 20  2019 var
missing:~$ curl --head --silent google.com | grep --ignore-case content-length | cut --delimiter=' ' -f2
219
```

