---
layout: post
status: publish
published: true
title: How to wget in a different language
date: 2008-05-21 02:27:00.000000000 +02:00
categories:
- hacks
tags: []
---
Some websites are smart and depending on your location they make assumption on the interface language. For example I'm in Japan and so when I go to google for the first time the page will be in Japanese.

The same thing happens with this command:

    wget http://www.timeanddate.com/calendar/index.html?year=2008&country=26 -O calendar.html

The output will be in Japanese, which is really wonderful and all, but...

To tell the website that I want the English interface:

    wget --header='Accept-Language: en-us' http://www.timeanddate.com/calendar/index.html?year=2008&country=26 -O calendar.html
