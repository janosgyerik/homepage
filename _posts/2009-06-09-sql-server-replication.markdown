---
layout: post
status: publish
published: true
title: How to setup Microsoft SQL Server replication
date: 2009-06-09 16:50:22.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
Boy, is this complicated? Yeah, but hey, replication is a serious business...

<a title="Configuring and Maintaining Replication" href="http://msdn.microsoft.com/en-us/library/ms151247(SQL.90).aspx">http://msdn.microsoft.com/en-us/library/ms151247(SQL.90).aspx</a>

Anyway, I just managed to set it up, and the one thing that wasted most of my time was broken stored procedures. The lesson here is, before publishing a stored procedure for replication, recreate it at the source first! (Right click, Modify, F5)

Actually replication might be overkill. Instead of that, daily full restore from daily full dumps might be a viable alternative.

Dump database T-SQL hint:
<blockquote>BACKUP DATABASE [SameName]
TO  DISK = N'D:the long long pathSameName_backup_200906091739.bak'
WITH NOFORMAT, NOINIT,
NAME = N'SameName_backup_20090609173911',
SKIP, REWIND, NOUNLOAD,  STATS = 10
GO</blockquote>
Restore database T-SQL hint:
<blockquote>RESTORE DATABASE [SameName_Restore]
FROM  DISK = N'D:the long long path200906091105.bak'
WITH  FILE = 1,
MOVE N'Dev'
TO N'D:the long long pathSameName_Restore.mdf',
MOVE N'Dev_log'
TO N'D:the long long pathSameName_Restore_1.ldf',
NOUNLOAD,  STATS = 10
GO</blockquote>
