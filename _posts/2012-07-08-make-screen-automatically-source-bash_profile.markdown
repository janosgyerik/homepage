---
layout: post
status: publish
published: true
title: Make screen automatically source .bash_profile
date: 2012-07-08 08:49:19.000000000 +02:00
categories:
- Hacks
- Software
tags: []
---
By default `screen` does not start as a login shell, and therefore `.bash_profile` is not sourced. (Wonder what is the rationale behind this decision, considering that 99% of the time I use it as login shell...)

A simple remedy is to create a custom script that will be used as `screen`'s shell, and edit `.screenrc` to tell `screen` to use the custom script. The custom script: (I put in `~/.screen.shell`)


```
`bash --login
`
```


Note: remember to make the script file executable.

The line in `.screenrc`:


```
`shell $HOME/.screen.shell
`
```

