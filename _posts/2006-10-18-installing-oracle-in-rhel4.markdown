---
layout: post
status: publish
published: true
title: Installing Oracle in RHEL4
date: 2006-10-18 15:27:00.000000000 +02:00
categories:
- Hacks
tags: []
---
If you get stuck at any point, see bottom for troubleshooting tips!

### Install requirements

```
up2date xorg-x11-deprecated-libs
up2date gcc gcc-c++ libaio libstdc++-devel compat-libstdc++-33 sysstat
```

### Create the oracle groups and user account

```
groupadd oinstall
groupadd dba
useradd -m -g oinstall -G dba oracle
mkdir /opt/oracle
chown oracle.oinstall /opt/oracle
chmod 775 /opt/oracle
```

### Set shell limits for the oracle user

1. In `/etc/security/limits.conf` add these lines:

    ```
    oracle soft nproc 2047
    oracle hard nproc 16384
    oracle soft nofile 1024
    oracle hard nofile 63536
    ```

2. In `/etc/pam.d/login` add this line: `session required /lib/security/pam_limits.so`

  Note: In RHEL4 with SELinux enabled, a comment says that `pam_selinux.so open` should be the last session rule. So i added the line right before that. 

3. Add to `/etc/profile` these lines:

    ```
    if [ $USER = oracle ]; then
        ulimit -u 16384 -n 63536
        umask 0022
    fi
    ```

### Start the installer

```
su - oracle
unzip 10201_database_linux32.zip
cd database
./runInstaller
```

It's probably a good idea to make notes of the relevant screens that appear. I simply take screenshots with Alt + PrintScreen, twice per screen: first with the original values, then again after i made my changes. 

In the first screen, set Oracle Home Location to `/opt/oracle/product/10.2.0/db_1` and fill in the password fields. The location can be anywhere else too, but this seems to be a common practice.

In the next screen you can accept the default settings, the `oraInventory` directory will only be needed during the installation. (You may still want to keep it afterwards, for the log messages during installation.)

Next, Oracle will complain about all kinds of things, missing packages, insufficient kernel parameters, etc. Make sure you eliminate all these problems. (Or as many as possible. See my notes at the end of this section.)

In my case the kernel parameter insufficiencies were something like:

```
Checking for semopm=100; found semopm=32.       Failed &lt;&lt;&lt;&lt;
Checking for semmni=128; found semmni=128.      Passed
Checking for shmmax=536870912; found shmmax=33554432.   Failed &lt;&lt;&lt;&lt;
Checking for shmmni=4096; found shmmni=4096.    Passed
Checking for shmall=2097152; found shmall=2097152.      Passed
Checking for file-max=65536; found file-max=25025.      Failed &lt;&lt;&lt;&lt;
Checking for VERSION=2.6.9; found VERSION=2.6.9-42.EL.  Passed
Checking for ip_local_port_range=1024 - 65000; found ip_local_port_range=32768 - 61000. Failed &lt;&lt;&lt;&lt;
Checking for rmem_default=262144; found rmem_default=110592.    Failed &lt;&lt;&lt;&lt;
Checking for rmem_max=262144; found rmem_max=110592.    Failed &lt;&lt;&lt;&lt;
Checking for wmem_default=262144; found wmem_default=110592.    Failed &lt;&lt;&lt;&lt;
Checking for wmem_max=262144; found wmem_max=110592.    Failed &lt;&lt;&lt;&lt;
```

...which i fixed by adding these lines to `/etc/sysctl.conf`
(The commented lines indicate the orginal values. These definitions were not originally in the file, i added them myself for future reference.)

```
# semmsl, semmns, semopm, semmni
#kernel.sem = 250       32000   32      128
kernel.sem = 250        32000   100     128
#kernel.shmmax = 33554432
kernel.shmmax = 536870912
#fs.file-max = 25025
fs.file-max = 65536
#net.ipv4.ip_local_port_range = 32768   61000
net.ipv4.ip_local_port_range = 1024     65000
#net.core.rmem_default = 110592
net.core.rmem_default = 262144
#net.core.rmem_max = 110592
net.core.rmem_max = 262144
#net.core.wmem_default = 110592
net.core.wmem_default = 262144
#net.core.wmem_max = 110592
net.core.wmem_max = 262144
```

Note that to add the right definitions, you need to know the fully qualified sysctl variable names, but Oracle's error message isn't detailed enough. For example, Oracle says `wmem_max` is not enough, but the fully qualified name of the variable is `net.core.wmem_max`. You can figure out the proper names by grep-ing through the output of `sysctl -a`, like `sysctl -a | grep wmem`.

To make these changes take effect do `sysctl -p`. This will reload the default sysctl config file and apply the settings. If you want you can confirm the changed values like `sysctl -a | grep wmem`.

Another thing Oracle complained about was insufficient swap space. The installer is simply a little paranoid, I guess. I figured it should be enough and I had no problems. If you are paranoid you can create a swap file. (Actually i would have created one gladly, but was already very tight on disk space, in the vmware virtual machine with 8GB.) To create a swap file refer to `man mkswap`. This file is only needed during the installation, you can delete it later.

These were all the errors i encountered. They may be different in your system. If you are at all serious, i suggest you leave NOTHING behind. 

Oracle's installation logs are in `/home/oracle/oraInventorylogs/installActions*`

In the following steps the installer went on to create the database. Finally a screen requested me to execute with root the following commands:
`/home/oracle/oraInventory/orainstRoot.sh`
`/opt/oracle/product/10.2.0/db_2/root.sh`

..which went without a glitch, and the installer finished normally.

In the end you will get a screen with urls to Oracle Enterprise Manager (port 1158) and isqlplus (port 5560). I suggest you take a screenshot of this screen too.

### Troubleshooting

**How to install without X windows on target machine**

From X windows on remote machine, ssh to target machine with -X flag on (`ForwardX11` ssh config option or `-X` on command line). For this to work you also need to install `xorg-x11-xauth` package.

**Installation in CentOS**

1. Start the installer with `./runInstaller -ignoreSysPrereqs`
2. There is no `xorg-x11-deprecated-libs` in CentOS, instead the following packages are required: `libXp`, `libXtst`

**Installer of Oracle Net Configuration fails with JVM crash, when getting DNS domain name.**

Checked the output of `hostname` and `domainname`, since there was no domain name set I set it to something, and also added the hostname and hostname.domainname to the `127.0.0.1` line in `/etc/hosts`.

### Sources

- [Installing Oracle Database 10g Release 2 on Linux x86](http://www.oracle.com/technology/pub/articles/smiley_10gdb_install.html)
- [Optimizing Oracle 10g on Linux: Non-RAC ASM vs. LVM](http://www.linuxjournal.com/article/8539)

