# Shell Tools and Scripting

Shell scripts are the next step in complexity. Most shells have their own scripting language with variables, control flow and its own syntax. What makes shell scripting different from other scripting programming language is that it is optimized for performing shell-related tasks. Thus, creating command pipelines, saving results into files, and reading from standard input are primitives in shell scripting, which makes it easier to use than general purpose scripting languages. For this section we will focus on bash scripting since it is the most common.

Assign value example:
```sh
foo=bar
```
Access the value of the variable with `$foo`.

Strings delimited with `'` are literal strings and will not substitute variable values whereas `"` delimited strings will.

As with most programming languages, bash supports control flow techniques including `if`, `case`, `while` and `for`. Similarly, bash has functions that take arguments and can operate with them. Here is an example of a function that creates a directory and `cd`s into it.

```sh
mcd(){
    mkdir -p "$1"
    cd "$1"
}
```

Here `$1` is the first argument to the script/function. Unlike other scripting languages, bash uses a variety of special variables to refer to arguments, error codes, and other relevant variables. Below is a list of some of them.

- `$0` - Name of script.
- `$1`to`$9` - Arguments to script.
- `$@` - All the arguments.
- `$#` - NUmber of arguments.
- `$?` - Return code of the previous command.
- `$$` - Process identification number(PID) for the current script
- `!!` - Entire last command,including arguments.A common pattern is to execute a command only for it to fail due to missing permissions; you can quickly re-execute the command with suduo by doing `sudo !!`.
- `$_` - Last argument from the last command. If you are in an interactive shell,youcan also quickly get this value by typing  `Esc` followed by `.` or `Alt+.`

Commands will often return output using `STDOUT`, errors through `STDERR`, and a Return Code to report errors in a more script-friendly manner. The return code or exit status is the way scripts/commands have to communicate how execution went. A value of 0 usually means everything went OK; anything different from 0 means an error occurred.

Exit codes can be used to conditionally execute commands using `&&` (and operator) and `||` (or operator), both of which are short-circuiting operators. Commands can also be separated within the same line using a semicolon ;. The true program will always have a 0 return code and the false command will always have a 1 return code. Let’s see some examples.

```sh
false || echo "Oops fail"

true || echo "Will not be printed"

true && echo "Things went well"
# Things went well

false && echo "Will not be printed"
#

true ; echo "This will always run"
# This will always run

false ; echo "This will always run"
# This will always run
```

Another common pattern is wanting to get the output of a command as a variable. This can be done with command substitution. Whenever you place `$( CMD )` it will execute `CMD`, get the output of the command and substitute it in place. For example, if you do for file in `$(ls)`, the shell will first call ls and then iterate over those values. A lesser known similar feature is process substitution, `<( CMD )` will execute CMD and place the output in a temporary file and substitute the `<()` with that file’s name. This is useful when commands expect values to be passed by file instead of by STDIN. For example, diff `<(ls foo)` <`(ls bar)` will show differences between files in dirs foo and bar.


```sh
#!/bin/bash

echo "Starting program at $(date)" # Date will be substituted

echo "Running program $0 with $# arguments with pid $$"

for file in "$@"; do
    grep foobar "$file" > /dev/null 2> /dev/null
    # When pattern is not found, grep has exit status 1
    # We redirect STDOUT and STDERR to a null register since we do not care about them
    if [[ $? -ne 0 ]]; then
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> "$file"
    fi
done
```
When launching scripts, you will often want to provide arguments that are similar. Bash has ways of making this easier, expanding expressions by carrying out filename expansion. These techniques are often referred to as shell globbing.

- Wildcards  Whenever you want to perform some sort of wildcard matching, you can use ? and * to match one or any amount of characters respectively. For instance, given files foo, foo1, foo2, foo10 and bar, the command rm foo? will delete foo1 and foo2 whereas rm foo* will delete all but bar.

- Curly braces `{}` - Whenever you have a common substring in a series of commands, you can use curly braces for bash to expand this automatically. This comes in very handy when moving or converting files.

```sh
convert image.{png,jpg}
# Will expand to
convert image.png image.jpg

cp /path/to/project/{foo,bar,baz}.sh /newpath
# Will expand to
cp /path/to/project/foo.sh /path/to/project/bar.sh /path/to/project/baz.sh /newpath

# Globbing techniques can also be combined
mv *{.py,.sh} folder
# Will move all *.py and *.sh files


mkdir foo bar
# This creates files foo/a, foo/b, ... foo/h, bar/a, bar/b, ... bar/h
touch {foo,bar}/{a..h}
touch foo/x bar/y
# Show differences between files in foo and bar
diff <(ls foo) <(ls bar)
# Outputs
# < x
# ---
# > y
```

Writing bash scripts can be tricky and unintuitive. There are tools like shellcheck that will help you find errors in your sh/bash scripts.

## Shebang
Note that scripts need not necessarily be written in bash to be called from the terminal. For instance, here’s a simple Python script that outputs its arguments in reversed order:

```sh
#!/usr/local/bin/python
import sys
for arg in reversed(sys.argv[1:]):
    print(arg)
```

The kernel knows to execute this script with a python interpreter instead of a shell command because we included a shebang line at the top of the script. It is good practice to write shebang lines using the env command that will resolve to wherever the command lives in the system, increasing the portability of your scripts. To resolve the location, env will make use of the PATH environment variable we introduced in the first lecture. For this example the shebang line would look like `#!/usr/bin/env python`.

## Shell Tools
