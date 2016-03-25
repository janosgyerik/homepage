---
layout: post
status: publish
published: true
title: A quite painful MySQL server migration with Japanese characters and utf-8
date: 2011-11-18 05:27:04.000000000 +01:00
categories:
- hacks
- software
tags: []
---
What was supposed to be a walk in the park, turned out to be quite painful and weirdo experience with mysql and Japanese text entries. The database in question is a mantis (bug tracker) database with a mix of English and Japanese entries. The database and all tables had utf8 character set, both at the source and destination sites. No matter what method I tried to dump and load, the Japanese characters became garbled.

I tried these for dumping:

```
mysqldump bugtracker &gt; bugtracker.dump
mysqldump bugtracker -r bugtracker.dump
mysqldump bugtracker --default-character-set=utf8 -r bugtracker.dump
```

And these for loading:

```
mysql &lt; bugtracker.dump
mysql --default-character-set=utf8 &lt; bugtracker.dump
set names utf8; source bugtracker.dump
```

Any combination of the above dumping and loading methods resulted in garbled characters after loading.

At this point, I wanted to pinpoint whether the data gets broken during the dump or during the load. To confirm the correctness of the dump, I created an entry with both English and Japanese text in it, so that I can grep with en English pattern and see some Japanese text that should not be garbled. However, modern versions of mysql dump data as so-called *extended inserts*, which results in extremely long lines (spanning multiple screens), making the grep output unreadable. Luckily this behavior can be changed with a flag, so that entries are dumped as a single insert command per entry:

```
mysqldump bugtracker --skip-extended-insert --default-character-set=latin1 | grep mantis_bug_text.*English
```

This way I found the right way to dump, and to my surprise I had to use latin1 character set. But my troubles were not over yet. Although the dump was supposed to be correct, I still could not load it without breaking the Japanese. By chance, I spotted a suspicious looking snippet in the dump file:

```
SET NAMES latin1
```

Changing latin1 to utf8 and then loading it with any of the above methods finally did the trick.

In conclusion, not only I had to force latin1 character set when dumping, I also had to hand-edit the dump file to make it loadable. Sounds pretty crazy to me. I don't understand the logic behind all this, but this is what worked.
