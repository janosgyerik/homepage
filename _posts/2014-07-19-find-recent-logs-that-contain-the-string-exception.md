---
layout: post
title: "Find recent logs that contain the string 'Exception'"
categories:
- hacks
tags: []
---
{% include JB/setup %}

This simple [bash one-liner][1] will find recent logs that contain the string 'Exception' and print the count of matches:

    find . -name '*.log' -mtime -2 -exec grep -Hc Exception {} \; | grep -v :0$

The `find`:

- `-name '*.log'` -- match files ending with `.log`
- `-mtime -2` -- match files modified within the last 2 days
- `-exec CMD ARGS \;` -- for each file found, execute command, where `{}` in `ARGS` will be replaced with the file's path

The `grep`:

- `-c` is to print the count of the matches instead of the matches themselves
- `-H` is to print the name of the file, as `grep` normally won't print it when there is only one filename argument
- The output lines will be in the format `path:count`. Files that didn't match "Exception" will still be printed, with 0 as count
- The second `grep` filters the output of the first, excluding lines that end with `:0` (= the files that didn't contain matches)

Extra tips:

- Change "Exception" to the typical relevant failure indicator of your application
- Add `-i` for `grep` to make the search case insensitive
- To make the `find` match strictly only files, add `-type f`
- Schedule this as a periodic job, and email the output to yourself by piping to a mailer, for example `| mailx -s 'error counts' yourmail@example.com`

Limitations:

The `-H` flag of `grep` may not work in older operating systems, for example older Solaris. In that case use `ggrep` (GNU grep) instead, if it exists.

[1]: http://www.bashoneliners.com/oneliners/oneliner/198/
