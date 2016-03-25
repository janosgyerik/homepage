---
layout: post
status: publish
published: true
title: How to reset mediawiki password in mysql
date: 2008-10-12 01:29:00.000000000 +02:00
categories:
- hacks
tags: []
---
<blockquote>

```
update user set user_password = md5(concat(user_id, '-', md5('kiew7eiT'))) where user_name = 'WikiSysop';
```

</blockquote>
