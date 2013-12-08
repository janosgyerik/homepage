---
layout: post
status: publish
published: true
title: VMware Server NAT nameserver
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 30
wordpress_url: http://titan2x.wordpress.com/2008/05/05/vmware-server-nat-nameserver/
date: 2008-05-05 02:11:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
Occasionally VMs configured with NAT interface in VMware server lose connectivity to the name server. The fix is to restart the "VMware NAT Service", after that DNS requests are forwarded correctly to the nameserver.
