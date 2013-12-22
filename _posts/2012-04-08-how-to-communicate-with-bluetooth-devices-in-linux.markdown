---
layout: post
status: publish
published: true
title: How to communicate with Bluetooth devices in Linux
date: 2012-04-08 14:06:40.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Find Bluetooth devices nearby, this assumes the devices have been configured to be discoverable:
<pre>hcitool scan --refresh</pre>
This will print the MAC addresses and names of the devices within range. For example:
<pre>00:07:80:93:54:1C      MAGIC_2311
00:23:D4:1E:32:f1      Androidx001</pre>
Connect to a Bluetooth device using the MAC address like this:
<pre>sudo rfcomm connect 0 00:07:80:93:54:1C 1</pre>
A screen should pop up asking you to enter the PIN for pairing. (With many devices the PIN is as simple is 1111 or 0000 or 1234). If pairing was successful, you should see a message like this in the terminal.
<pre>Connected /dev/rfcomm0 to 00:07:80:93:54:1C on channel 1
Press CTRL-C for hangup</pre>
You can use a graphical client such as `cutecom` to connect to `/dev/rfcomm0` and communicate with the Bluetooth device, see incoming data and save it to a log file.
