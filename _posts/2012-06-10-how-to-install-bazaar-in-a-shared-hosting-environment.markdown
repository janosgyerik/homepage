---
layout: post
status: publish
published: true
title: How to install Bazaar in a shared hosting environment
date: 2012-06-10 13:26:55.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
<h3 id="firstHeading">Install pip with easy_install</h3>


```
easy_install --user pip
```

<h3>Update PATH</h3>
Unless you have already done it, add `~/.local/bin` to `PATH`, because `pip` will install binaries there.

```
PATH=~/.local/bin:$PATH
```

<h3>Install Bazaar and recommended python modules using pip</h3>
<a href="http://wiki.bazaar.canonical.com/InstallationFaq" rel="nofollow">http://wiki.bazaar.canonical.com/InstallationFaq</a>

```
pip install --user pyrex  # optional
pip install --user paramiko  # optional
pip install --user bzr==2.5  # or whatever is the latest stable version```

<h3>Additional plugins</h3>
You might want to install some additional plugins too:

```
pip install --user bzr-svn
pip install --user bzr-git 
pip install --user bzr-rebase
pip install --user bzr-fastimport
```

Or find more interesting plugins:

```
pip search bzr
```


