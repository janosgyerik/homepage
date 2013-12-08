---
layout: post
status: publish
published: true
title: Saving flash videos like youtube
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 284
wordpress_url: http://titan2x.wordpress.com/?p=284
date: 2011-03-27 01:14:45.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
When you watch a flash video like youtube in a browser, the video file is saved on your harddisk at a temporary location. And, if you watch a video and then another video in the same window, the first one will be deleted.

On Linux, the file is usually saved in /tmp/FlashXXXXX where the XXXXX is some random string.

On Mac, the file is somewhere under /private, you can find it with the command:
<pre>find /private/ 2&gt;/dev/null | grep /Flash</pre>
To save the video, simply copy the file. Make sure you wait until the video is fully downloaded in the browser.

Btw, sometimes you can make the volume louder when playing the file with a video player instead of youtube.
