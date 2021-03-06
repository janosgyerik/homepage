---
layout: post
status: publish
published: true
title: Learning history expansion tricks in bash
date: 2013-07-02 21:41:00.000000000 +02:00
categories:
- hacks
- software
tags: []
---
Have you ever read the full `man bash`? Me: nah-uh... It's way too much! Deep deep deep stuff.

In any tool, I tend to focus on a small set of tricks with very high practical value. For example these bash features:

- Backward search command history with `C-r`
- Delete words backwards with `C-w` or forward with `ESC-d` and paste them later with `C-y`
- Jump around on the command line with `C-a`, `C-e`, `ESC-b`, `ESC-f`, or actually use `C-w` as a form of jumping back fast, or `C-c` to cancel and re-type

And so on. I use these in literally every single minute I spend in the shell, so they were really well worth memorizing! (See my slides on these and similar time-saving tricks on [SpeakerDeck](https://speakerdeck.com/janosgyerik/time-saving-tricks-on-the-command-line).)

I rarely memorize new tricks. There's a sweet spot on the effort-benefit curve, beyond which the benefits are not that great. But from time to time I discover something new that might be worth learning and adding to my arsenal. Right now some history expansion tricks look pretty damn handy.

### The event designator `!!`

`!!` is a type of so-called event designator: it refers to the previous command. I use this to save complex commands for later use, for example this operation on an Apache log file (get the number of requests per user agent):

```
cat access.log | cut -d\" -f6 | sort | uniq -c | sort -n
echo "!!" &gt;&gt; later.sh
```

This is not a perfect solution in this case, because the backslash there will disappear in the output, and in general it won't work if there are unescaped double quotes in the command. However, there are many use cases when it can simplify my typing.

### The word designators `!$` and `!^`

As the man page says: Word designators are used to select desired words from the event. These two are expanded to the last argument and the first argument, respectively. They are relatively easy to remember if you consider the meaning of `$` and `^` in regular expressions.

A typical example situation:

```
less /path/to/some/file
rm /path/to/some/file
```

Doing this and similar actions involves a bit too many key strokes: `up` + `C-a` + `ESC-d` + [type "rm"]. Easier to do like this:

```
less /path/to/some/file
rm !$
```

A similar feature is `ESC-.` which pastes the last argument while editing, so you can make changes before running the next command.

You can read more about these and similar tricks in `man bash`, under **HISTORY EXPANSION**.
