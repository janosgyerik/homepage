---
layout: post
title: "Writing to NTFS in OS X"
categories:
- hacks
tags: []
---
{% include JB/setup %}

Editing files on an NTFS partition 
(like an external hard disk formatted in Windows)
is not only a hidden feature in OS X,
it's also pretty weird.

To enable editing files on an NTFS partition,
edit `/etc/fstab` and add a line like this:

    LABEL=LabelOfYourDisk none ntfs rw,auto,nobrowse

Save the file, exit, eject and reinsert the disk.

The weird part is the `nobrowse` option.
Thanks to that setting,
the disk will be hidden in **Finder**.
To open it, run `open /Volumes` in a terminal,
the disk should be visible there.

So why not just remove the `nobrowse` option?
If you remove it then writing to the partition won't work.
Go figure.

If you intend to use the external disk regularly,
then drag it to the sidebar so you don't have to run `open /Volumes` every time.
