---
layout: post
title: "Upgrading OSX"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

There are a couple of things I forget every time I upgrade OSX.
Hopefully I'll remember next time that I've written this.

Things to prepare before upgrading:

- Make an unencrypted copy of content in `encfs`. After the upgrade, `port` (of MacPorts) might not be usable.
- Save the list of installed ports: `port -qv installed > myports.txt`
- Login to Apple developer center, just to make sure you know your username and password. You may need it during or after installation
- Time:
  + The new version of the OS itself is around 4GB, so downloading will take some time.
  + The upgrade will take at least 30 minutes, and on first boot there may be additional initialization taking another 30 minutes.
  + Reinstalling MacPorts may take a long time, including downloading packages, building, and troubleshooting

Reinstalling Python with MacPorts:

- Remember to install with `readline` enabled:
  + `sudo port install python35 +readline`
  + `sudo port install python27 +readline`
  + If you already installed without, it's ok, you can repeat the install command
- Remember to configure the active version, for example `sudo port select --set python python35`
- Remember to install `py35-pip` and `py35-virtualenv`, and configure their active version like Python. The output of the install command tells how.

For some reason `mvim` also stopped working. I reinstalled [MacVim](http://macvim-dev.github.io/macvim/), and copied `mvim` from the `dmg` file to `/usr/local/bin`.
