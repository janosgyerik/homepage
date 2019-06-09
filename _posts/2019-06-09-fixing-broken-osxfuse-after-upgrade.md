---
layout: post
title: "Fixing broken encfs + osxfuse after upgrade using MacPorts"
categories:
- hacks
tags: []
---
{% include JB/setup %}

After a `sudo port selfupdate` and `sudo port upgrade outdated`,
trying to mount an encrypted filesystem with `encfs` stopped working,
with the error message:

>     mount_osxfuse: the loaded OSXFUSE kernel extension has a mismatched version
>     fuse failed.  Common problems:
>      - fuse kernel module not installed (modprobe fuse)
>      - invalid options -- see usage message

The upgrade of `osxfuse` had the following notes:

>     osxfuse has the following notes:
>       When upgrading, unmount all FUSE filesystems and then unload the kernel extension.
>       Unloading can be done via: sudo kextunload -b com.github.osxfuse.filesystems.osxfuse
>       Alternatively (or if this fails), just reboot your computer now.

I ran `sudo kextunload -b com.github.osxfuse.filesystems.osxfuse` but still got the same error when trying to mount with `encfs`. According to `kextstat | grep osxfuse` the kernel extension appeared unloaded. I rebooted, but no change.

I thought of reinstalling `osxfuse` and `encfs`.
Running `sudo port uninstall osxfuse` gave me this:

>     The following versions of osxfuse are currently installed:
>      1) osxfuse @3.8.2_0
>      2) osxfuse @3.9.0_0 (active)
>     Enter option(s) [1-2/all]: 

I uninstalled both, and `encfs`, then reinstalled `encfs`, still the same error.
In retrospect, probably I could have activated `osxfuse @3.8.2_0` with `sudo port activate osxfuse @3.8.2_0`.
I'll try that next time.

I thought of installing `osxfuse @3.8.2_0`.
In the [docs](https://trac.macports.org/wiki/howto/InstallingOlderPort),
I couldn't find a simple command to do that,
but instructions to clone `https://github.com/macports/macports-ports`,
find an appropriate commit and build from that.
That looked kind of complicated, so instead of that,
following a hunch, I tried installing from `tbz2` files in http://packages.macports.org/osxfuse/

There I found multiple versions for 3.8.2 (13, 14, ..., 18).
I tried 13, and got build errors I couldn't make sense of.
I tried 18, and that went through, that is:

    sudo port install http://packages.macports.org/osxfuse/osxfuse-3.8.2_0.darwin_18.x86_64.tbz2

After this, and making sure the previous version is not loaded,
`encfs` is back to working again.
