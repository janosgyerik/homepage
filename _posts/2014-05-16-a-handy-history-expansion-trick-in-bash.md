---
layout: post
title: "A handy history expansion trick in Bash"
categories:
- hacks
tags: []
---
{% include JB/setup %}

Bash is packed with countless tricks that look really clever at first,
but then turn out to be not so practical or ergonomic.
I've been experimenting with some,
trying to force myself to use new things,
even if they don't come easily at first.

Among the many tricks I tried to memorize,
one that survived very well is history expension with `!$` and <kbd>ESC .</kbd>

If you type `!$` on the command line,
it will get replaced with the last argument of the previous command.
For example I find myself very often in this kind of situation:

    svn status /long/path/somewhere/else
    svn revert -R /long/path/somewhere/else
    svn update /long/path/somewhere/else
    svn log -l3 /long/path/somewhere/else

I do this kind of thing several times per day,
not necessarily with Subversion commands.
Even though tab completion helps for entering paths quickly,
very often it takes several tab stops to do so,
which still makes it a pain to reenter a long path.

`!$` simplifies this a lot:

    svn status /long/path/somewhere/else
    svn revert -R !$
    svn update !$
    svn log -l3 !$

I was reluctant to learn this because I had a workaround that I was very used to:

1. <kbd>Up</kbd> arrow to bring back to previous command
2. <kbd>Control w</kbd> to copy the path argument
3. <kbd>Control c</kbd> to cancel the command
4. Type the new command, for example `svn revert -R ` like above
5. <kbd>Control y</kbd> to paste the path argument

I admit that looks pretty awful now in retrospect.

`!$` is relatively easy to remember, because `!` is the common key for history related commands, and `$` means "the end" in regular expressions.
Similarly, `!^` would be replaced with the first argument in the previous command, and `^` means "the beginning" in regular expressions.
Somehow I don't need `!^` that much in practice.
There's also `!*`, which gets replaced with all arguments in the previous command, but not the command itself.
For the entire previous command line you can use `!!`.

A drawback of `!$` is that you won't see its value until you execute the command.
So if you want to edit it, you cannot, which can be annoying.
In that case you can use <kbd>ESC .</kbd> instead.
This will paste the last argument immediately,
so you can see it and edit it.
I like the idea of this better than `!$`,
but pressing the <kbd>ESC</kbd> key is somehow less ergonomic for me.
Maybe I just need to get used to it.
