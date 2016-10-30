---
layout: post
title: "Getting comfortable in Ubuntu for software development"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Getting comfortable in Ubuntu 14 LTS is not exactly trivial.

### Privacy first

Disable the annoying and horrible online search in Dash:

1. Open **System Settings**
2. Go to **Security & Privacy**
3. Go to **Search** tab
4. Switch off online search

### The keyboard

The Caps Lock key is perfectly useless.
The Control key is extremely useful.
In previous versions there used to be an easy way to make Caps Lock an additional Control.
That seems to be gone now.
This command will do it:

    setxkbmap -option caps:ctrl_modifier

To make it permanent,
add it to `~/.xsessionrc`.
(No need to make it executable.)

In case the GUI freezes (sadly it does happen),
it's good to be able to shoot down the X server easily with control alt backspace,
like it used to be the default in the good old days:

    setxkbmap -option terminate:ctrl_alt_bksp

Making Caps Lock an additional Control in virtual terminals is a bit harder.

Dump the current keymap and make a backup:

    dumpkeys > keys.kmap
    cp keys.kmap backup.kmap

Edit the keymap file, replace `CtrlL_Lock` with `Control` on this line:

    keycode  58 = CtrlL_Lock

Compress it and copy to the default location:

    gzip -9 keys.kmap
    sudo cp keys.kmap.gz /etc/console-setup/cached.kmap.gz

I pieced this together from this more detailed article:
http://superuser.com/questions/290115/how-to-change-console-keymap-in-linux

### Sound

The startup sound can be annoying.
An easy way to disable that is to rename the sound files:

    sudo mv /usr/share/sounds/ubuntu/stereo/desktop-login.ogg{,bak}
    sudo mv /usr/share/sounds/ubuntu/stereo/system-ready.ogg{,bak}

### Install "essential software"

    apt-get install git vim-gnome jq screen pwgen

### Configure "essential software"

    ssh-keygen -t rsa -C user@host

    mkdir -p dev/git/github
    cd dev/git/github

    git clone https://github.com/janosgyerik/dotfiles
    #./dotfiles/install.sh  # TODO ;-)

    git clone https://github.com/janosgyerik/shellscripts
    ./shellscripts/install.sh

### Firefox

Install the [Greasemonkey](https://addons.mozilla.org/en-us/firefox/addon/greasemonkey/) and [JSONView](https://addons.mozilla.org/en-us/firefox/addon/jsonview/) extensions.
