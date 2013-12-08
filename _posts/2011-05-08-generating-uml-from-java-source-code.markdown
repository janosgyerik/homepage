---
layout: post
status: publish
published: true
title: How to generate UML diagrams from java source code
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 296
wordpress_url: http://titan2x.wordpress.com/?p=296
date: 2011-05-08 00:58:35.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
I want to create good documentation of the classes and their relationships in my Java project but without drawing it all by myself. And if there are changes in the future it would be great if it can be automated. After a brief search and trying different products, eUML2 Eclipse plugin seems quite nice for this purpose.

<a href="http://www.soyatec.com/euml2/installation/">http://www.soyatec.com/euml2/installation/</a>

The installation did not work according to the docs, I also needed to install GMF SDK. In the "Install New Software" dialog simply type "gmf", and the download site should show up in the list, like this:

GMF Update Site - http://download.eclipse.org/modeling/gmf/updates/releases/

After installing GMF SDK the eUML2 install worked fine. Here's a tutorial to get started:

<a href="http://www.soyatec.com/euml2/documentation/com.soyatec.euml2.doc/gettingstartedwithclassdiagram/firstDiagram/creating-1/index.html">http://www.soyatec.com/euml2/documentation/com.soyatec.euml2.doc/gettingstartedwithclassdiagram/firstDiagram/creating-1/index.html</a>
