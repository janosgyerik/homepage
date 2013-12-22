---
layout: post
status: publish
published: true
title: bzr-xmloutput install problems
date: 2008-08-28 08:00:00.000000000 +02:00
categories:
- Hacks
tags: []
---
I needed a newer version of the xmloutput plugin for the Eclipse Bazaar plugin. I installed Bazaar 1.6 with the standalone installer, which has a bug and the bzr.exe in it doesn't include some required files. There are two workarounds.

1. Re-install Bazaar with the python installer, that is, download the source, untar, and `python setup.py install`

2. Copy `[python]/lib/SimpleXMLRPCServer.py` to the `xmloutput` plugin's directory
