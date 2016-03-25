---
layout: post
status: publish
published: true
title: How to open Control Panel as Administrator with runas
date: 2010-12-27 17:34:14.000000000 +01:00
categories:
- hacks
tags: []
---

1. Open a cmd window as Administrator 

    ```
    runas /u:administrator cmd
    ```

2. Keep a cmd window running as your non-Administrator user too
3. Open task manager (Ctrl-Esc or with taskmgr command) and kill explorer.exe
4. Run the command "control" in the Administrator cmd window
5. Close task manager you opened previously, and run taskmgr in the Administrator cmd window (to open it as Administrator user)
6. Kill explorer.exe (because it is still running as Administrator)
7. Run explorer in the non-Administrator cmd window

