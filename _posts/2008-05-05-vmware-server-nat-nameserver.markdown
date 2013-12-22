---
layout: post
status: publish
published: true
title: VMware Server NAT nameserver
date: 2008-05-05 02:11:00.000000000 +02:00
categories:
- Hacks
tags: []
---
Occasionally VMs configured with NAT interface in VMware server lose connectivity to the name server. The fix is to restart the "VMware NAT Service", after that DNS requests are forwarded correctly to the nameserver.
