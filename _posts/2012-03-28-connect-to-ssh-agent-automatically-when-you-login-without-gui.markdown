---
layout: post
status: publish
published: true
title: Connect to ssh-agent automatically when you login without GUI
date: 2012-03-28 06:55:20.000000000 +02:00
categories:
- Hacks
tags: []
---
For many years now it is a commonly known good practice to use ssh public key authentication to login to remote servers, and that ssh-agent can store your passphrase so that you don't have to enter it every time you login with your keys.

However, ssh-agent is not exactly convenient to use:
<ol>
	<li>You have to start ssh-agent and add your keys in it at some point (ideally the first time you login)</li>
	<li>If there is an existing ssh-agent process running you want to reuse it rather than running yet another one</li>
</ol>
If you are using a Linux desktop (with a GUI), then the above is probably easy to do, hopefully even hassle-free and automatic with a keychain tool that takes care of starting ssh-agent when you login and storing all your passphrases.

However, if you are not using a Linux desktop then your best option is to concoct some home-brew hack that you add to your ~/.bash_profile to make it automatic every time you log in. Here's my own concoction that has evolved over the years into something readable, kept up to date on my wiki:

[http://wiki.titan2x.com/index.php?title=Setup_ssh_agent_automatically_on_login](http://wiki.titan2x.com/index.php?title=Setup_ssh_agent_automatically_on_login)
