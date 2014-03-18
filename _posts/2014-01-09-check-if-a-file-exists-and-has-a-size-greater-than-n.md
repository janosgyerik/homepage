---
layout: post
title: "Check if a file exists and has a size greater than N"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

You can do this using the `find` command and the `[[` builtin,
wrapped in a one-liner like this:

    [[ $(find /path/to/file -type f -size +51200c 2>/dev/null) ]] && echo true || echo false

- The `find` takes care of two things at once: checks if file exists and size is greater than 51200 bytes.
- We redirect stderr to `/dev/null` to hide the error message when the file doesn't exist.
- The output of `find` will be non-blank if the file matched both conditions, otherwise it will be blank.
- The `[[ ... ]]` evaluates to true or false if the output of `find` is non-blank or blank, respectively.

You can use this in `if` conditions, for example:

    if [[ $(find /path/to/file -type f -size +51200c 2>/dev/null) ]]; do
        # somecmd
    fi

<div class="text-muted">
Inspired by <a href="http://stackoverflow.com/a/21005094/641955">this question</a> on #stackoverflow. 
</div>
