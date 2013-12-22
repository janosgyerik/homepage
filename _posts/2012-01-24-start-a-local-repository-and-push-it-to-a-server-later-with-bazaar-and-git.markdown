---
layout: post
status: publish
published: true
title: Start a local repository and push it to a server later with Bazaar and Git
date: 2012-01-24 22:52:35.000000000 +01:00
categories:
- Hacks
- Musings
- Software
tags: []
comments: []
---
Once you get comfortable with distributed version control, this probably becomes a habit: whenever you start hacking on something new you create a local repository right away, and only later on you push it to a server (for backup). With Bazaar you can even switch to a centralized workflow (the server becomes a master) at any time (and switch back).
<h3>With Bazaar</h3>
To push a local repository to a server, the bzr command must be installed and on the $PATH of the user.

```
cd /path/to/your/new/project
bzr init
bzr add
bzr commit -m 'first commit, added all files'
bzr push bzr+ssh://username@server/home/username/path/to/repos/bzr/project
```

Extra tips:
<ul>
	<li>If the parent directories don't exist on the  server, then use --create-prefix to create all parents</li>
	<li>To switch to a centralized workflow where your local commits will be automatically pushed to the server do "bzr bind", and to switch back do "bzr unbind"</li>
</ul>
<h3>With Git</h3>
To push a local repository to a server, the git command must be installed and on the $PATH of the user.

```
cd /path/to/your/new/project
git init
git add .
git commit -m 'first commit, added all files'
git clone --bare . project.git
rsync -a project.git username@server:path/to/repos/git/project.git
rm -fr project.git
git remote add origin username@server:path/to/repos/git/project.git
```

The step of pushing to the server is less intuitive in Git compared to Bazaar, but I am still new to Git so there might be a better more elegant way. (Please comment if you know!)
