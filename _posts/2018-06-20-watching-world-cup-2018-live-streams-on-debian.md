---
layout: post
title: "Watching World Cup 2018 live streams on Debian"
categories:
- hacks
tags: []
---
{% include JB/setup %}

Use acestream! Install with `snap`:

    sudo apt install snapd
    sudo snap install acestreamplayer

Run the player:

    snap run acestreamplayer

Find a stream id to play:

- Go to https://www.reddit.com/r/soccerstreams/
- Find a highly voted post with the name of the teams playing, for example ["Iran vs Spain"](https://www.reddit.com/r/soccerstreams/comments/8sjghu/1800_gmt_iran_vs_spain/)
- Look at the list of streams, pick the highest resolution, for example: `[TSN] [1080p] acestream://274da2a27fa2e8f68306be7f25be1f1632c434f2`

In `acestreamplayer`, in **File** menu select **Open URL**, enter the ID from the reddit, in this example 274da2a27fa2e8f68306be7f25be1f1632c434f2, and enjoy!
