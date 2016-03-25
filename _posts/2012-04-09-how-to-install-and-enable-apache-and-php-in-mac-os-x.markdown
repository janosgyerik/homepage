---
layout: post
status: publish
published: true
title: How to install and enable Apache and PHP in Mac OS X
date: 2012-04-09 20:15:35.000000000 +02:00
categories:
- hacks
- software
tags: []
---
Mac OS X 10.5 (Leopard) comes preinstalled with Apache 2 and PHP 5, you just have to enable them.

To enable Apache, open System Preferences, go to Sharing and put a check in Web Sharing.

To enable PHP:

1. Edit `/private/etc/apache2/httpd.conf`, uncomment the line `LoadModule php5_module`
1. Copy `/private/etc/php.ini.default` to `/private/etc/php.ini`
1. Restart Apache (uncheck and check again the **Web Sharing** box in **System Preferences / Sharing**)

