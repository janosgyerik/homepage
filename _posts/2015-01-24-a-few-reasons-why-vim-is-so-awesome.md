---
layout: post
title: "A few reasons why Vim is so awesome"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Originally I wanted to title this post *"Things only Vim can do"*,
but since I obviously haven't tried all past/present/future editors,
I'll settle for this more humble name and show off some of the awesomeness of Vim.

### Vim at your service everywhere

You can count on Vim even under the most spartan conditions.
Logged in to a server with `ssh` in an Xterm or PuTTY?
Not a problem.
Vim fires up in a second,
and you can syntax highlighting,
function folding,
tabs, and of course buffers.

### Delete lines matching pattern

A common situation is reading a log file,
filled with a lot of noise.
Let's say you want to remove all lines with the text "ERROR" in it:

    :g/ERROR/d

The `:g` means execute an *Ex command*,
the regular expression between "ERROR" is a pattern to match,
the `d` at the end is the delete Ex command.
Whoosh, all lines with "ERROR" are gone.

Most editors can replace regular expressions.
But can they remove lines? Good luck with that!

### Delete lines NOT matching pattern

Same situation as earlier,
log file filled with a lot of noise,
but this time you only want to see the lines with the text "ERROR" in it,
to see only the things that went wrong:

    :g!/ERROR/d

You guessed it,
the `!` inverts the meaning,
so unlike in the previous point,
this time the lines not matching the pattern will be removed,
leaving only the lines matching "ERROR".

### Sort buffer

What if you have a list of names in your editing buffer,
but not sorted alphabetically.
You don't need to drop out to a shell to run `sort` and recreate the file,
you can sort the entire buffer with:

    :%sort

Want to sort only between line 10 and 50?

    :10,50sort

Want to sort only between current line and the end of the file?

    :.,$sort

Want to sort only selected lines and you don't know their line numbers?
Go to visual mode with `Control V`,
move the cursor around to highlight text
(use `$` to jump to end of lines),
and when ready, press `:` and type `sort`.

###  Filter buffer through command

This is similar to the previous point,
sometimes built-in commands don't cut it,
and you know an external program that does.

Let's say you have a list of names,
but there are some duplicates,
and you want to remove them.
The `sort` command in UNIX can do this with the `-u` option,
you can invoke it on the entire buffer like this:

    :%!sort -u

Notice the difference from the previous point is the `!` there after the `%`.
As earlier, instead of `%`, you could use a range of lines,
or select text in visual mode.

### Delete from the current line until the end of the file

What if you needed to open a very large file (~500 MB),
inspect the first few hundred lines and delete the junk at the end.
To delete those lines,
in most editors you'd need to select text from cursor position until the end.
If your editor doesn't have a shortcut to jump to the end,
you're screwed at this point.
If your editor does have a shortcut,
then hopefully the jump to the end will be fast,
but sometimes it's not,
due to some inexplicable magic the editor might want to do with the selected text.

In Vim, deleting from the current line until the end takes precisely two keystrokes:

    dG

That's it! `d` is the delete Ex command, `G` means the end of the file.

### Increase or decrease numeric values

What if you have the number 5 on a line and you want to make it 6?
Normally you'd delete 5 and type 6,
or press the Insert key and overwrite 5 with 6.
If it's not number 5 but 999 then you'll need to type a bit more.

In Vim you can press `Control a` to increment the next numeric value on the current line by 1. `Control x` is the opposite, it decrements by 1.
You can keep the key pressed to apply the operation repeatedly.

---

A compact cheat sheet of these and more features is in this Gist:

https://gist.github.com/janosgyerik/8556496

In a next article I'll explain some more.

Till then,
if you agree that Vim is wickedly awesome,
please support the proposal to create a [dedicated Q&A site for Vim on the Stack Exchange network][1].

[1]: http://area51.stackexchange.com/proposals/80441/vi-and-vim
