---
layout: post
status: publish
published: true
title: Saving flash videos like youtube
date: 2011-03-27 01:14:45.000000000 +01:00
categories:
- Hacks
tags: []
---
When you watch a flash video like youtube in a browser, the video file is saved on your harddisk at a temporary location. And, if you watch a video and then another video in the same window, the first one will be deleted.

On Linux, the file is usually saved in /tmp/FlashXXXXX where the XXXXX is some random string.

On Mac, the file is somewhere under /private, you can find it with the command:

```
find /private/ 2&gt;/dev/null | grep /Flash
```

To save the video, simply copy the file. Make sure you wait until the video is fully downloaded in the browser.

Btw, sometimes you can make the volume louder when playing the file with a video player instead of youtube.
