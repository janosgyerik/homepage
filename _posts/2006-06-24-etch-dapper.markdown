---
layout: post
status: publish
published: true
title: etch -> dapper
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 7
wordpress_url: http://titan2x.wordpress.com/2006/06/24/etch-dapper/
date: 2006-06-24 16:03:00.000000000 +02:00
categories:
- Hacks
tags: []
comments:
- id: 2
  author: bob
  author_email: ''
  author_url: ''
  date: '2006-06-25 01:07:00 +0200'
  date_gmt: '2006-06-25 01:07:00 +0200'
  content: Oh, crapper! <br/>Though dapper's "Desktop CD" doesn't include the <i>netboot</i>
    directory, the "Server CD" does... Yup, that's a reinstall then.
---
At last i decided it was time to migrate my <span style="font-style:italic;">thinkpad x31</span> from <span style="font-style:italic;">breezy badger</span> to <span style="font-style:italic;">crazy crapper</span>, err, <span style="font-style:italic;">dapper drake</span>. Rather than doing a simple <span style="font-weight:bold;">apt-get dist-upgrade</span>, i chose a <span style="font-style:italic;">somewhat</span> more difficult way. Since i don't have a cdrom, and since ubuntu stopped including a <span style="font-style:italic;">netboot</span> folder in dapper's installer, i opted for an <span style="font-style:italic;">etch/debian</span> netinstall and from there a apt-get dist-upgrade to dapper. Here's how it went.

It was nice to see etch. Haven't kept up with debian lately, i was an ubuntu user since hoary. The installation went without a hitch. I selected no packages at all to have a completely bare system.

After the installer finished and i was back in the fresh new base system and a vast space of nothingness, i grabbed the usual <span style="font-style:italic;">sources.list</span> file from another dapper system. The first surprise came when doing <span style="font-weight:bold;">apt-get update</span>. Some GPG errors, <span style="font-style:italic;">"The following signatures couldn't be verified because the public key is not available: ..."</span>. Nice. A little googling yielded the much desired solution

<blockquote>gpg --keyserver subkeys.pgp.net --recv THEKEY
gpg --export --armor THEKEY | apt-key add -
</blockquote>
This was a pleasant surprise. But then <span style="font-weight:bold;">apt-get dist-upgrade</span> was not.

Couldn't upgrade <span style="font-style:italic;">locales</span> because of <span style="font-style:italic;">tzdata</span>. This could be fixed by <span style="font-weight:bold;">dpkg --force-all -i /var/cache/apt/archives/locales_......</span> .

Next, when trying to install pretty much anything, <span style="font-style:italic;">perl</span> presented a dependency problem. Etch had a newer perl-base than dapper. Quite a situation: perl-base cannot be simply upgraded to dapper's, breaking the dependencies of a couple zillion packages. On the other hand, perl-base is an essential package, so it cannot be easily removed. (You get the "yes, i really want to do that, now!" prompt.) But i removed it anyway. It was actually ok.

There were also other issues, similar to perl's... The solution usually involved removing etch's original packages and installing dappers. It's just that... This wasn't exactly my idea of a clean install.... So in the end, i said fuck it. Went with a <span style="font-style:italic;">breezy</span> netinstall instead...

Weekend well-spent!
<span style="font-family:monospace;"></span>
