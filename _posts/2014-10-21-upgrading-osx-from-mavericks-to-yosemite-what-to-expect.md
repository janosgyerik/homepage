---
layout: post
title: "Upgrading OSX from Mavericks to Yosemite, what to expect"
categories:
- software
- musings
tags: []
---
{% include JB/setup %}

Short answer: a world of pain.
Partly because the process was buggy,
and partly because I use a lot of dev tools and I underestimated all the potential changes that such a major upgrade might entail.

The buggy part?
Downloading the upgrade was *weird*.
After the roughly 5GB files was downloaded,
using **App Store** (I just followed the steps),
the **Download** button got greyed out and it was not clear how to proceed.
So I started poking around,
and since the only clickable thing I found was another **Download** button,
I clicked on it anyway even though it didn't make any sense.
Naturally, it started downloading again the 5GB file,
which looked stupid, but I didn't want to mess with it,
so I just let it do it's thing, and I went back to doing my thing.
Strangely though, the progress was far slower than earlier.
But I didn't care, I wasn't in a hurry.
It took a long time to climb to 30%,
but then in a couple of minutes it apparently completed.
Really strange stuff.
But it didn't matter, after this everything worked fine.

Well, except all my development tools, of course,
but that was entirely my fault.
A bunch of pointers for fellow software developers upgrading their OSX:

- Do you have a ton of stuff installed with MacPorts / Brew?
You'll have to reinstall everything. Enjoy all that fun.

- Are you a casual Ruby user? (For example, do you have a Jekyll blog hosted on GitHub?)
You might have to reinstall some gems.
I had to review my configuration to fix some deprecated settings that didn't want to work anymore.
If you're not a regular Ruby user,
you'd better keep good notes around about how you got stuff working in the first place!

- Do you use JetBrains software like IntelliJ, PyCharm, Android Studio?
They need Java 6 to continue working.

It's not a big deal,
but all these things were a major interruption in my regular activities.
It took me a few days to get everything working again the way I like it.

Am I happy with this latest and greatest from Apple?
Frankly, I don't really care.
I'm not your average Mac user.
I use this thing just for coding.
I most certainly don't know any of the wonderful features that promoters and fans might rave about.
As usual, I don't like new things,
so the visual "improvements" were annoying at first.
After a week or so, I'm starting to get used to them.
