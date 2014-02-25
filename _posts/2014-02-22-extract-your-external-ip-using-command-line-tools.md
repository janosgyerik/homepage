---
layout: post
title: "Extract your external IP using command line tools"
categories:
- hacks
tags: []
---
{% include JB/setup %}

To say the conclusion first,
the most elegant and fastest way is this:

    dig +short myip.opendns.com @resolver1.opendns.com

This asks the IP address of `myip.opendns.com` from the name server `resolver1.opendns.com` (something you trust),
which will return your external IP address.

If you don't have `dig`,
you can use these alternatives:

    curl ipecho.net/plain
    curl icanhazip.com

These work over HTTP,
and therefore less efficient than the direct DNS query with `dig`.

When using any of these solutions,
keep in mind that you are relying on external services.
They might be unavailable temporarily or even permanently at some point.
So none of these is perfect.

This article is actually about something else.
It's about the challenge of extracting the relevant bits from a short text.
Recently I needed to extract my external IP address from http://monip.org/ using command line tools.
This article is about explaining the thought process,
in case you ever need something similar.

Let's see what we get with a simple `curl`:

```
$ curl monip.org
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>MonIP.org v1.0</title>
<META http-equiv="Content-type" content="text/html; charset=ISO-8859-1">
</head>
<P ALIGN="center"><FONT size=8><BR>IP : 67.205.36.164<br></font><font size=3><i>genovese.dreamhost.com</i><br></font><font size=1><br><br>Pas de proxy d�tect� - No Proxy detected</font></html>
```

One way to extract the IP address from this is using `sed`:

    $ curl -s monip.org | sed -n 's/.*IP : \([0-9.]*\).*/\1/p'
    67.205.36.164�tect� - No Proxy detected</font></html>

Ugh. It almost works, but just almost:
there's some garbage left behind at the end.
I don't really know why the `.*` at the end didn't wipe out everything after the IP address.
It seems `sed` has problems with some non-ascii characters.
Looking at the original output,
it looks like the site uses ISO-8859-1 encoding,
so if we stick an `iconv` in the pipeline it might fix the problem:

    $ curl -s monip.org | iconv -f iso-8859-1 | sed -n 's/.*IP : \([0-9.]*\).*/\1/p'
    67.205.36.164

Much better! Let's go over how this `sed` works:

- By default `sed` echoes the lines it processes.
  The `-n` flag turns that off:
  it will only print anything with explicit printing commands.

- One technique for *extracting* a pattern from some body of text is using the idiom: `s/.*\(pattern\).*/\1/`.
  The `\1` in the replacement is a back reference to the pattern that was matched within the first `\(...\)` expression.
  The `.*` before and after the pattern of interest are to make the search pattern match the entire line,
  so that the result of the replacement will be the entire line replaced with the pattern of interest.

- We used `.*IP : \([0-9.]*\).*` as the pattern.
  This is an inaccurate, lazy approach,
  and we could have been much more accurate, for example:
  `.*IP : \([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)\>.*`.
  It's up to you and the given task where you draw the line.

- The `p` flag in the `s///p` idiom makes `sed` print the line only if there was a substitution.
  This is perfect for our purpose:
  this way only the line with the IP address will be printed,
  after the substitution,
  so the output will be simply the IP address itself.

By the way,
when I first so the encoding issue with `sed` my first reaction was using `perl` instead:

    curl -s monip.org | perl -ne '/IP : ([0-9.]+)/ && print $1'

This uses the equivalent extraction logic as in the earlier `sed`,
with some differences due to the nature of these tools:

- The `-e` flag is to execute a Perl expression given on the command line,
  as opposed to a specified file.

- The `-n` flag wraps the expression inside a `while (<>) { ... }` block,
  making it suitable for processing standard input line by line.

- The pattern matching is slighly simpler compared to `sed`,
  because `sed` uses basic regular expressions (BRE),
  and Perl uses PCRE, which is far more advanced.

- In Perl, you can use back references to patterns captured within `(...)` expressions using the variables `$1`, `$2`, and so on.

- The idiom `/(pattern)/ && print $1` means,
  if the pattern was matched,
  then print the content of the first group.
