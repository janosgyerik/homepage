---
layout: post
status: publish
published: true
title: How to install Bazaar in a shared hosting environment
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 665
wordpress_url: http://www.janosgyerik.com/?p=665
date: 2012-06-10 13:26:55.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
<h3 id="firstHeading">Install pip with easy_install</h3>

<pre>easy_install --user pip</pre>
<h3>Update PATH</h3>
Unless you have already done it, add <code>~/.local/bin</code> to <code>PATH</code>, because <code>pip</code> will install binaries there.
<pre>PATH=~/.local/bin:$PATH</pre>
<h3>Install Bazaar and recommended python modules using pip</h3>
<a href="http://wiki.bazaar.canonical.com/InstallationFaq" rel="nofollow">http://wiki.bazaar.canonical.com/InstallationFaq</a>
<pre>pip install --user pyrex  # optional
pip install --user paramiko  # optional
pip install --user bzr==2.5  # or whatever is the latest stable version</pre>
<h3>Additional plugins</h3>
You might want to install some additional plugins too:
<pre>pip install --user bzr-svn
pip install --user bzr-git 
pip install --user bzr-rebase
pip install --user bzr-fastimport</pre>
Or find more interesting plugins:
<pre>pip search bzr</pre>

