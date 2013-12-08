---
layout: post
status: publish
published: true
title: How to read properties files with Android
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 387
wordpress_url: http://titan2x.wordpress.com/?p=387
date: 2011-08-21 15:51:16.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Using ResourceBundles works fine on Android, but it might not be obvious where to put the properties files to get them into the application bundle (the APK file). The best way seems to be to put the file somewhere under the source code directory. For example, you can load the file src/path/to/file/props.properties like this:
<pre>ResourceBundle props = ResourceBundle.getBundle("path.to.file.props");</pre>
&nbsp;
