---
layout: post
status: publish
published: true
title: Installing Plone in hardy
date: 2008-10-11 23:33:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
I've installed Plone in Ubuntu dozens of times. Ever since hoary (possibly even from warty), this was a matter of `apt-get install plone-site`. Something is broken in hardy because this step doesn't create a Zope instance (the container instance for Plone) but it should. That is, the directories `/var/lib/zope2.9/instance/` and `/var/lib/zope2.10/instance/` were both empty, so when starting zope, it would complain about no instances, and obviously Zope cannot work without files. I could fix this and get going with the following steps.

<blockquote>dzhandle -z2.9  make-instance plone-site -m manual<br />
dzhandle -z2.9 add-product plone-site CMFPlone<br />
/etc/init.d/zope2.9 restart</blockquote>

The above steps will generate a brand new Zope instance in `/var/lib/zope2.9/instance/plone-site`. The configuration file for the instance will be in `/etc/zope2.9/plone-site/zope.conf`, you might want to change `HTTPPORT` from 9673 to 8081 (the Ubuntu default).
