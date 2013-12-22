---
layout: post
status: publish
published: true
title: How can I decide which permissions to allow or disallow to an Android application?
date: 2012-05-15 07:22:39.000000000 +02:00
categories:
- Musings
- Software
tags: []
---
As far as I know, I cannot. When you install an Android application you get a list of "permissions" <strong>the app wants to use</strong>, but you have only two choices, all or nothing: allow all permissions and install the app, or don't install at all.

A few days ago I needed a random number generator, basically to simulate a dice. Sounds simple enough, I thought there must be an app for that. So I tried a couple, but they all require some permissions I really don't want to give, for example:
<ul>
	<li>Random Number Generator #1</li>
<ul>
	<li>Network communication - full internet access</li>
</ul>
	<li>Quick Random Number Generator</li>
<ul>
	<li>Network communication - full internet access</li>
	<li>System tools - prevent phone from sleeping</li>
</ul>
	<li>Random Number Generator #2</li>
<ul>
	<li>Network communication - full internet access</li>
	<li>Your location - coarse (network-based) location</li>
</ul>
	<li>Random Number Generator #3</li>
<ul>
	<li>Network communication - full internet access</li>
</ul>
	<li>Dice</li>
<ul>
	<li>Network communication - full internet access</li>
</ul>
	<li>Dice Me Online Free</li>
<ul>
	<li>Network communication - full internet access</li>
	<li>Phone calls - Read phone state and identity</li>
</ul>
	<li>Simple Dice (Free)</li>
<ul>
	<li>Network communication - full internet access</li>
	<li>Storage - modify/delete SD card contents</li>
	<li>Your location - coarse (network-based) location, fine (GPS) location</li>
	<li>Phone calls - read phone state and identity</li>
</ul>
</ul>
...

At this point I give up. It's too hard to find an app that just generates random numbers without requiring any permissions. I get it, many of the above apps are free, and probably it's because of the in-app advertisements that they require internet access.

Wouldn't it be great if instead of just getting a list of permissions an <strong>*app wants*</strong>, I could select with checkboxes the permissions <strong>*I'm willing to allow*</strong>? Apps could query if they have some permission and handle it gracefully if not. That would be great. Wonder why they didn't make it work like that in the first place. Advanced search where I can specify permissions I'm willing to allow would be nice too.
