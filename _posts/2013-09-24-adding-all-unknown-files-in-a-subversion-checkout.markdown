---
layout: post
status: publish
published: true
title: Adding all unknown files in a Subversion checkout
date: 2013-09-24 06:08:16.000000000 +02:00
categories:
- hacks
- software
tags: []
---
Adding all unknown files from the working tree to version control is usually very simple in other systems, for example:


```
# in Git
git add .
# in Bazaar
bzr add
```

Not so simple in Subversion:

```
$ svn add .
svn: warning: '.' is already under version control
```

But if you add the `--force` flag, that will do!

Keep in mind that this is *NOT* the same as this:

```
svn add * --force
```

That would add not only unknown files, but ignored files too,
which is probably not what you want.
Make sure to specify directories explicitly,
avoid using `*` with this command.
