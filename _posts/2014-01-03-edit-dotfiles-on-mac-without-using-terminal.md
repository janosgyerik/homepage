---
layout: post
title: "How to edit dotfiles on Mac OS X without using a terminal"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

It seems there is no way to run shell commands in Mac OS X without using a Terminal application.
I realized this while trying to answer
[this question on unix.stackexchange.com](http://unix.stackexchange.com/questions/107096/how-to-edit-delete-a-dot-file-on-mac-without-using-terminal/107104#107104):
the poster messed up his `.bash_profile`,
making his Terminal app unusable.
He needed to rename,
edit or delete `.bash_profile` to get his Terminal back.

However,
files starting with a `.` are hidden by default,
so normally you can't see them in Finder.
You can make hidden files visible using this command:

    defaults write com.apple.finder AppleShowAllFiles -bool true

But, how can you run *any* commands if you don't have a usable Terminal?

In Linux you could switch to a virtual terminal,
login as `root` and fix things.
Probably all desktop / window managers have a shortcut to run shell commands without a terminal.
Ironic that there is no similar way in Mac OS X,
a system derived from UNIX.

Luckily,
there is a way to open hidden files,
even if normally they are not shown in Finder:

1. Open a plain text editor, for example TextEdit
2. Select **File \| Open...** or press <kbd>Cmd</kbd> + <kbd>O</kbd>
3. Navigate to the directory where you want to edit hidden files
4. Press <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>&gt;</kbd> to show hidden files (press again to hide)
5. Select the file you need to edit
