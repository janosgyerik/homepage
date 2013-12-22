---
layout: post
status: publish
published: true
title: Etch -> Dapper
date: 2006-06-24 16:03:00.000000000 +02:00
categories:
- Hacks
tags: []
---
At last I decided it was time to migrate my thinkpad x31 from Breezy Badger to Crazy Crapper, err, Dapper Drake. Rather than doing a simple `apt-get dist-upgrade`, I chose a somewhat more difficult way. Since I don't have a cdrom, and since ubuntu stopped including a netboot folder in Dapper's installer, I opted for an Etch/debian netinstall and from there a `apt-get dist-upgrade` to Dapper. Here's how it went.

It was nice to see Etch. Haven't kept up with debian lately, I was an ubuntu user since hoary. The installation went without a hitch. I selected no packages at all to have a completely bare system.

After the installer finished and I was back in the fresh new base system and a vast space of nothingness, I grabbed the usual sources.list file from another Dapper system. The first surprise came when doing `apt-get update`. Some GPG errors, "The following signatures couldn't be verified because the public key is not available: ...". Nice. A little googling yielded the much desired solution

```
gpg --keyserver subkeys.pgp.net --recv THEKEY
gpg --export --armor THEKEY | apt-key add -
```

This was a pleasant surprise. But then `apt-get dist-upgrade` was not.

Couldn't upgrade locales because of tzdata. This could be fixed by dpkg --force-all -i /var/cache/apt/archives/locales_...... .

Next, when trying to install pretty much anything, perl presented a dependency problem. Etch had a newer perl-base than Dapper. Quite a situation: perl-base cannot be simply upgraded to Dapper's, breaking the dependencies of a couple zillion packages. On the other hand, perl-base is an essential package, so it cannot be easily removed. (You get the "yes, I really want to do that, now!" prompt.) But I removed it anyway. It was actually ok.

There were also other issues, similar to perl's... The solution usually involved removing Etch's original packages and installing Dappers. It's just that... This wasn't exactly my idea of a clean install.... So in the end, I said fuck it. Went with a Breezy netinstall instead...

Weekend well-spent!

