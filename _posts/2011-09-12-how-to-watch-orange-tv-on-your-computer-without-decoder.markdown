---
layout: post
status: publish
published: true
title: How to watch Orange TV on your computer without decoder
date: 2011-09-12 03:09:47.000000000 +02:00
categories:
- Hacks
tags: []
---
Orange is my internet provider in France. It seems Free is cheaper, but for now I'm stuck with Orange. My package includes TV, but it's not officially documented nor straightforward to watch TV using a PC and without the decoder. I have a Livebox 2.

First of all, if you can read French you should check first this article:

<a href="http://www.porciello.com/inventel/tv_vlc.htm">http://www.porciello.com/inventel/tv_vlc.htm</a>

Probably because I cannot read French well, the article was only a little help, in my case this is how it worked.

1. If you have already used the Orange decoder and watched TV, you can skip this step. Otherwise, you need to connect the decoder at least once to activate your subscription. First of all, confirm on <a href="http://livebox/">http://livebox/</a> the ethernet ports that provide TV. With Livebox 2 the only configuration that worked for me is when port yellow (jaune) and green (vert) provide TV exclusively (no internet). You can set this up in Configuration / Services / TV numerique, Option multi-decoders must be checked. After this, connect your decoder to your screen (with HDMI), and go through the initial setup, where you have to enter your TV access codes. After this you won't need the decoder anymore.

2. Download the playlist file from:

<a href="http://download.porciello.com/orange/tv/BouquetTV_Orange_v2.4.m3u">http://download.porciello.com/orange/tv/BouquetTV_Orange_v2.4.m3u</a>

3. Connect your computer to port yellow or green with an ethernet cable. It does not work for me over wifi. In fact, I have to disconnect wifi first before I can watch TV. Then, while watching TV I reconnect wifi and browse internet, but cannot change TV channels. Probably this can be fixed by setting up network routes properly. If this is the first time you will watch TV, it's safer to disconnect wifi now.

4. Open the playlist file with a movie player, it works fine for me with VLC. Many channels might not work, but for example these should be ok: TF1, NRJ 12, Direct 8, TMC.

It would be great if I could use both TV and internet with wifi at the same time, I would be very interested to know how. Proper documentation of the channel list by Orange would also be great, since I'm sure the playlist is incomplete or out of date.
