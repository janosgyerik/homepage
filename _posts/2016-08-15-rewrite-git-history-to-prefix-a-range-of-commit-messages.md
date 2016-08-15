---
layout: post
title: "Rewrite Git history to prefix a range of commit messages"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Imagine that you cloned an open source project to contribute something.
You implemented a bugfix through a series of atomic commits on a private branch.
Just when you're about to create a Pull Request to submit your changes,
you discover in the contributor's guide that you're supposed to prefix each commit with the bug tracking number.

Rewriting the commit message of the last commit is easy:

    git commit --amend

Rewriting a range of commits is easy too, once you know how.
That's a job for the `filter-branch` command, like this:

    git filter-branch --msg-filter 'printf "THE_PREFIX " && cat' master..

The `--msg-filter` flag is to rewrite the commit messages.
The argument within the `'...'` is the shell commands to execute to manipulate the message, received from `stdin`.
In this example we use the `printf` command to print the prefix and a space character,
and then the `cat` command to print the rest of the commit message.
(Note that `printf` is like the less portable `echo -n`.)

The last argument is the range of commits,
`master..` is equivalent to `master..HEAD`.
This is short and sweet and perfect in this use case of working on a feature branch that started from `master`.
