---
layout: post
status: publish
published: true
title: Replacing the hard drive of a G4 iBook and recovering user data
date: 2006-10-16 17:01:00.000000000 +02:00
categories:
- Hacks
tags: []
---
It was my friend Joe's iBook. He kept it running all the time. But one day it just froze. (Btw, this happened shortly after he upgraded to iTunes7... Coincidence?) After restarting, the system wouldn't come up. So he took it to Mac. They said the hard drive is busted. They can replace it for $500. You would think it's natural that they either recover your data or return your busted hard drive, right? Well at least i thought so. But no, they said they won't recover the data and won't give back the broken hard drive.

When i heard this from Joe, i told him to call the manager. Get himself back his own damn hard drive. But it all seemed too much of a trouble. So Joe looked for other ways instead and found this website:

<a href="http://www.sterpin.net/uk/ddibookg4uk.htm">Replacing the hard drive of a G4 iBook</a>

...and asked me if i thought it was possible that we replace the hard drive ourselves. I said: absolutely.

We asked Mac to return the iBook. That cost $30.
Next we bought an external hard drive case for $10.
And a new hard drive, bigger and better, $135.

Before doing anything else, i popped in an Ubuntu live CD to check out if i can see the hard drive and its contents. But had no luck there, the partition table appeared to be empty and i couldn't mount the disk. For all Ubuntu cared, the hard drive was blank. So i tried the live CD with another friend's iBook, but got the same result. I still don't know how come the partition table appeared to be blank when it wasn't actually blank. The size of the hard disk was correct. I used cfdisk btw. This was a bit of a disappointment about Ubuntu.

Next, we followed the instructions of the excellent website. The steps were not exactly the same, but we managed. There was nothing scary about the many screws and bolts and the funny tools we needed. But unclipping the clips was a bitch.
After replacing the hard drive, everything worked and the reinstallation of the OS went smoothly. After the system was back up, we connected the external hard drive to try to see the old data. Unfortunately, iBook didn't recognize the drive... Then i connected it to my Ubuntu system, and guess what, it worked just fine...

I tried to copy all his user files. Copying got stuck in Joe's Firefox profile. Apparently that's where the hard drive got busted. So i skipped those files and copied everything else. Documents. Photos. Music. Movies. Later he simply dragged those folders over his new system, and everything fell into place. Mails too. From his Firefox profile i could salvage a backup of his bookmarks that was a month old, more than good enough for him.

He was very happy. Instead of paying $500 and losing all his data, he paid roughly $175 and got back all his data and a more or less still usable hard drive. I pat myself on the shoulder ;-)
