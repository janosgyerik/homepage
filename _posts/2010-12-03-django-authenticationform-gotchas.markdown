---
layout: post
status: publish
published: true
title: Django AuthenticationForm gotchas
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 237
wordpress_url: http://titan2x.wordpress.com/?p=237
date: 2010-12-03 20:17:44.000000000 +01:00
categories:
- Hacks
- Musings
- Software
tags: []
comments:
- id: 11
  author: glfafn
  author_email: asdasdasd@google.com
  author_url: ''
  date: '2011-12-11 07:37:21 +0100'
  date_gmt: '2011-12-10 22:37:21 +0100'
  content: you have no idea how many hours i spend trying to figure out why the form
    wouldn't validate, thanks for mentioning the gotchas
---
If you initialize as `AuthentictionForm(request.POST)` like probably many of your forms, no validation will take place at all.

In my case I needed to initialize as `AuthenticationForm(None, request.POST)`

The gotcha here is that the first argument must be a request object if you want to validate cookie support in the browser (that is, check if the user has cookies enabled in the browser). I didn't want cookie validation, but I did want field and user account validation.

Another gotcha was handling the 'invalid username-password error'. Field validation errors are linked to a field, so a missing username error is stored in form.username.errors. But the invalid username-password error is not specific to one field. You can find these errors in form.non_field_errors, but this is hard to find in the documentation. Also, the error messages are already formatted. I don't know why they did it that way. Instead of a list of error messages, they made this one a &lt;ul&gt; formatted html.
