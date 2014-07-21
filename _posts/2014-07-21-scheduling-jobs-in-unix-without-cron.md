---
layout: post
title: "Scheduling jobs in UNIX without cron"
categories:
- hacks
tags: []
---
{% include JB/setup %}

If you happen to be unfortunate enough to be in a system where you're not allowed to use `cron`,
you might be able to do something similar with `at` instead.
Here's a script that reschedules itself to run the next day at 8:45am:

```bash
#!/bin/bash
the_main_thing &>/dev/null
[[ $0 = /* ]] && script=$0 || script=$PWD/$0
at -f "$script" 0845 &>/dev/null
```

`the_main_thing` is the command or script you want to run periodically.

The purpose of `[[ $0 = /* ]] && script=$0 || script=$PWD/$0` is to get the absolute path of the current script itself.

In `at -f "$script" 0845 &>/dev/null`,
the `-f` is to specify the script to run:
the current script itself with absolute path,
otherwise it might not work.

To run something every 5 hours,
you can use relative times,
for example:

    at -f "$script" 'now + 5 hours' &>/dev/null

Similar to `cron`,
the output of scheduled `at` jobs is emailed to the UNIX account.
To prevent polluting the mailbox,
it's probably a good idea to redirect both with `&> /dev/null`,
and you might want to do the same for `the_main_thing` too.

To view your scheduled tasks, use `atq`.
To remove scheduled tasks, use `atrm`.
