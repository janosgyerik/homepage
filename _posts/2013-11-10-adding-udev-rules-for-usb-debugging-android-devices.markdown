---
layout: post
status: publish
published: true
title: Adding udev rules for USB debugging Android devices
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 1134
wordpress_url: http://www.janosgyerik.com/?p=1134
date: 2013-11-10 18:15:15.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
USB debugging of my Google Nexus 4 phone used to work just fine from my Debian desktop. Until someday it just stopped working. The symptoms looked like this:
<pre>$ adb logcat
- waiting for device -
^C
$ adb devices
List of devices attached 
???????????? no permissions</pre>
That is, <code>adb logcat</code> was just waiting forever even though my phone was connected, and <code>adb devices</code> was giving permission errors. There was no easy answer on stackoverflow, but lots of clumsy ones, suggesting to make the <code>adb</code> binary setuid, or adding udev rules with <code>0666</code> permissions. I really had to get to the bottom of this myself.

These are the steps to properly debug, understand and resolve the issue.

1. Find the bus and device id assigned by the kernel:
<pre>$ lsusb 
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 004 Device 002: ID 045e:0053 Microsoft Corp. Optical Mouse
Bus 004 Device 003: ID 0566:3002 Monterey International Corp. 
Bus 001 Device 008: ID 18d1:d002 Google Inc.</pre>
I bought my device from Google, so it's probably the last one.

2. Check the permissions of the device file
<pre>$ ls -l /dev/bus/usb/001/008
crw-rw-r-T 1 root root 189, 8 Nov 10 18:34 /dev/bus/usb/001/008</pre>
The path comes from the output of <code>lsusb</code>: <code>001</code> is the <em>Bus</em>, and <code>008</code> is the <em>Device</em>.

The problem is clear: the file is owned by user root and group root, which I am neither. The elegant solution is to add a udev rule so that the device will belong to a reasonable group, like <code>plugdev</code>, of which I'm a member.

3. Create a udev rules file, let's say: <code>/etc/udev/rules.d/51-android.rules</code>
<pre>SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="d002", MODE="0660", 
GROUP="plugdev", SYMLINK+="android%n"</pre>
Here, <code>idVendor</code> and <code>idProduct</code> come from the output of <code>lsusb</code>: <code>18d1:d002</code>. Do similarly for your own device. The rule specifies that a matching USB device should be created with permissions <code>0660</code>, with group <code>plugdev</code>, and a symlink conveniently pointing to it.

Now that everything is ready, simply plug the device out and back in to confirm the result:
<pre>$ lsusb | grep oogle
Bus 001 Device 010: ID 18d1:d002 Google Inc. 
$ ls -l /dev/bus/usb/001/010
crw-rw-r-T 1 root plugdev 189, 9 Nov 10 18:37 /dev/bus/usb/001/010
$ ls -l /dev/android7
lrwxrwxrwx 1 root root 15 Nov 10 18:37 /dev/android7 -&gt; bus/usb/001/010
$ adb devices
List of devices attached 
01d1e2510d9c6d28 device</pre>
PS: no need to restart udev, the changed rule should be picked up automatically.