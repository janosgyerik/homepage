---
layout: post
title: "Finding interesting GitHub repositories using Hacker News and Yahoo Pipes"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Here's a simple example to demonstrate [Yahoo! Pipes][1]:

- Assuming that links on [Hacker News][2] are interesting...
- ...GitHub repositories mentioned on Hacker News must be awesome ;-)

If we can agree on that, here's a pipe that does the job + an extra touch:

http://pipes.yahoo.com/janos/hackernews_github

Here's how it works:

1. Take the RSS feed of Hacker News (https://news.ycombinator.com/rss)
2. Apply a filter: keep only items whose link starts with `https://github.com/`
3. Extract the repository name component from the link and append it to the title to make it easier to see

The first 2 steps are admittedly nobrainers.
But the last step is a bit tricky,
and it takes two operations:

![Extract repository name component and append to title]({{ site_url }}/assets/screenshots/github-repos-from-hn-yahoo-pipes.png)

First, the **Rename** operator is to make a copy of `item.link` in `item.repo`.
Notice that in the new name field (after **Copy As**) you must NOT write the `item.` prefix, but simply the name "repo".

Next, the **Regex** operator has two steps:

1. In `item.repo`, replace the pattern `https://(github.com/[^/]+/[^/]+).*` with `$1`, where `$1` is a back reference to whatever was matched in `(...)` in the pattern.
   So for example if the original value is `https://github.com/dotcloud/docker/blob/master/CHANGELOG.md#0110-2014-05-07`,
   it will be replaced with `github.com/dotcloud/docker`

2. In `item.title`, replace `$` with ` (${repo})`, where `${repo}` is the value of `item.repo`, which the previous step created.
   And replacing `$` effectively means appending to the input string,
   in this case `item.title`.


[1]: http://pipes.yahoo.com/pipes/
[2]: https://news.ycombinator.com/
