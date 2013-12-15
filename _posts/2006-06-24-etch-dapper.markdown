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
At last i decided it was time to migrate my thinkpad x31 from breezy badger to crazy crapper, err, dapper drake. Rather than doing a simple apt-get dist-upgrade, i chose a somewhat more difficult way. Since i don't have a cdrom, and since ubuntu stopped including a netboot folder in dapper's installer, i opted for an etch/debian netinstall and from there a apt-get dist-upgrade to dapper. Here's how it went.

It was nice to see etch. Haven't kept up with debian lately, i was an ubuntu user since hoary. The installation went without a hitch. I selected no packages at all to have a completely bare system.

After the installer finished and i was back in the fresh new base system and a vast space of nothingness, i grabbed the usual sources.list file from another dapper system. The first surprise came when doing apt-get update. Some GPG errors, "The following signatures couldn't be verified because the public key is not available: ...". Nice. A little googling yielded the much desired solution

<blockquote>gpg --keyserver subkeys.pgp.net --recv THEKEY
gpg --export --armor THEKEY | apt-key add -
</blockquote>
This was a pleasant surprise. But then apt-get dist-upgrade was not.

Couldn't upgrade locales because of tzdata. This could be fixed by dpkg --force-all -i /var/cache/apt/archives/locales_...... .

Next, when trying to install pretty much anything, perl presented a dependency problem. Etch had a newer perl-base than dapper. Quite a situation: perl-base cannot be simply upgraded to dapper's, breaking the dependencies of a couple zillion packages. On the other hand, perl-base is an essential package, so it cannot be easily removed. (You get the "yes, i really want to do that, now!" prompt.) But i removed it anyway. It was actually ok.

There were also other issues, similar to perl's... The solution usually involved removing etch's original packages and installing dappers. It's just that... This wasn't exactly my idea of a clean install.... So in the end, i said fuck it. Went with a breezy netinstall instead...

Weekend well-spent!

