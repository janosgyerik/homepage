---
layout: post
status: publish
published: true
title: How to run putty as Local System user
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 229
wordpress_url: http://titan2x.wordpress.com/?p=229
date: 2010-11-10 09:59:53.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
<div>
<div id="code1637046788_1">

Scenario: you want to run a periodic job, a batch script that will use putty to run something on a remote server. You have created public/private keys so that the script can login to the remote server without having to enter a password and you have tested well that it works.

At this point it's easy to forget that even with the proper public/private key setup, there will still be a prompt the first time the script runs with some user X. The first time you run the script with user X, putty will ask if you accept the certificate of the remote server. When you accept the certificate, Windows stores that decision in the registry, and from the next time there should be no prompt or popup windows, the setup becomes truly automated.

Typically it is not a good idea to run periodic scripts as regular users, because those only run when the user is logged in. The user Local System can be suitable choice. To ensure the script will work correctly, we need to get the answer to the certificate question into the Windows registry. How to do that?

In the example below we export the relevant registry record of the current user that we tested and confirmed, and insert a step into the batch script to import it right before calling putty, so that this way we circumvent the prompt with the remote server server certificate.
<ol>
	<li>Run regedit</li>
	<li>Go to <code>HKEY_CURRENT_USERSoftwareSimonTathamPuTTY</code></li>
	<li>Right click on the entry of  the remote server, it should look something like <code>rsa2@22:the_hostname</code></li>
	<li>Export it to a file (cert_hostname.reg)</li>
	<li>In your script, import the registry file before calling putty <code>regedit /S cert_hostname.reg</code></li>
</ol>
<div>

Note: there may be another alternative, using a putty build that reads such registry settings from files instead of Windows registry.

</div>
</div>
</div>
