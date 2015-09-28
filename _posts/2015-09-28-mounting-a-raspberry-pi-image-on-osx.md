---
layout: post
title: "Mounting a Raspberry PI image in OSX"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

The other day I needed to extract some configurations from a Raspberry PI.
I was in a rush, so to be safe I copied the entire image.
I figured later I can just mount the image and copy off what I need.
This turned out to be surprisingly easy.

First I mounted the image using `hdiutil`:

    $ hdiutil mount path/to/raspi.image
    /dev/disk2          	FDisk_partition_scheme
    /dev/disk2s1        	Windows_FAT_32                 	/Volumes/boot
    /dev/disk2s2        	Linux

This made the `/boot` partition available in **Finder**.
That's nice, but what I really needed was the Linux partition.
For that I picked up a few hints [here](http://apple.stackexchange.com/questions/29842/how-can-i-mount-an-ext4-file-system-on-os-x),
and installed `ext4fuse` of MacPorts:

    sudo port install ext4fuse

And mounted the partition on some directory:

    mkdir raspi
    ext4fuse /dev/disk2s2 raspi

To unmount everything:

    hdiutil unmount raspi
    hdiutil eject /dev/disk2
