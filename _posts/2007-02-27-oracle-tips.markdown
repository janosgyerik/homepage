---
layout: post
status: publish
published: true
title: Oracle Tips
date: 2007-02-27 05:27:00.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
<h3>Environmental variables</h3>

<ul>
    <li>Essential
      <ul>
          <li>`ORACLE_HOME`</li>
          <li>`ORACLE_SID`</li>
      </ul>
    </li>
    <li>How to set them?
      <ul>
          <li>If you don't know what these are supposed to be, take a look at `/etc/oratab`. A line like this: `orcl:/opt/oracle/product/10.2.0/db_1:N` means
            <ul>
                <li>`ORACLE_SID=orcl`</li>
                <li>`ORACLE_HOME=/opt/oracle/product/10.2.0/db_1`</li>
            </ul>
          </li>
          <li>Alternatively, if you know ORACLE_SID, you can set ORACLE_HOME by this command: `. oraenv`</li>
      </ul>
    </li>
    <li>Other variables<ul>
          <li>`NLS_LANG=JAPANESE_JAPAN.JA16EUC`</li>
          <li>`NLS_LANG=JAPANESE_JAPAN.UTF8`</li>
          <li>`NLS_LANG=AMERICAN_AMERICA.UTF8`</li>
    </ul></li>
    <li>My custom tips<ul>
          <li>Create a file `~/ORACLE.env` like this:
          <pre>
#!/bin/sh

#export NLS_LANG=JAPANESE_JAPAN.JA16EUC
#export NLS_LANG=JAPANESE_JAPAN.UTF8
#export NLS_LANG=AMERICAN_AMERICA.UTF8
export ORACLE_SID=orcl
export ORACLE_HOME=/opt/oracle/product/10.2.0/db_1

PATH=$PATH:$ORACLE_HOME/bin
</pre>
          </li>
     </ul></li>
</ul>

<h3>Starting the database (with the oracle user)</h3>
<ol>
   <li>`lsnrctl start` If you do this multiple times, not a problem, it just gives you an error.</li>
   <li>`dbstart` If this does not work, you can try this alternative method:
<pre>
      $ sqlplus

      SQL*Plus: Release 10.2.0.1.0 - Production on Sun Nov 27 15:39:27 2005

      Copyright (c) 1982, 2005, Oracle.  All rights reserved.

      Enter user-name: / as sysdba
      Connected to an idle instance.

      SQL&gt; startup
      ORACLE instance started.

      Total System Global Area  285212672 bytes
      Fixed Size                  1218968 bytes
      Variable Size              96470632 bytes
      Database Buffers          180355072 bytes
      Redo Buffers                7168000 bytes
      Database mounted.
      Database opened.

      SQL&gt; exit
</pre></li>
   <li>optional: `isqlplusctl start` This can take a bit long. When finished, you can check if the port 5560 used by iSQL*Plus was successfully opened using the command `netstat -ntl | grep :5560` 
If successful, you can start using the following URLs: iSQL*Plus: `http://localhost:5560/isqlplus` (even normal users can login here) iSQL*Plus DBA: `http://localhost:5560/isqlplus/dba` TODO: how to login here?</li>

   <li>optional: `emctl start dbconsole` This can take a bit long. When finished, you can check if the port 1158 used by the Enterprise Management Console was successfully opened using the command `netstat -ntl | grep :1158` If successful, you can start using the following URL: `http://localhost:1158/em` Don't know the precise rules, but users with dba granted can login here connecting as "normal". The user sys can login connecting as "sysdba" or "sysoper". </li>
</ol>

<h3>Stopping the database (with the oracle user)</h3>
<ol>
<li>`dbshut` If the above does not work, you can try to shutdown manually:
<pre>
      $ sqlplus

      SQL*Plus: Release 10.2.0.1.0 - Production on Sun Nov 27 15:40:29 2005

      Copyright (c) 1982, 2005, Oracle.  All rights reserved.

      Enter user-name: / as sysdba

      Connected to:
      Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
      With the Partitioning, OLAP and Data Mining options

      SQL&gt; shutdown immediate
      Database closed.
      Database dismounted.
      ORACLE instance shut down.

      SQL&gt; exit
</pre>
<li>`isqlplusctl stop`</li>
<li>`emctl stop dbconsole`</li>
<li>`lsnrctl stop`</li>
</ol>

<h3>Quickies</h3>
<ul>
<li>`connect / as sysdba`</li>
<li>`connect sys/password as sysdba`</li>
<li>How to create new password file:<ul>
  <li>stop database</li>
  <li>`orapwd file=$ORACLE_HOME/dbs/orapw$ORACLE_SID password=mypasswd`</li>
  <li>start database </li>
  <li><pre>
      ALTER USER scott ACCOUNT LOCK    -- lock a user account
      ALTER USER scott ACCOUNT UNLOCK; -- unlocks a locked users account
      ALTER USER scott PASSWORD EXPIRE;  -- Force user to choose a new password
  </pre></li>
  <li>`ALTER USER scott IDENTIFIED BY newtiger;`</li>
  <li><pre>
      CREATE USER scott
      IDENTIFIED BY tiger  -- Assign password
      DEFAULT TABLESACE  tools -- Assign space for table and index segments
      TEMPORARY TABLESPACE temp; -- Assign sort space

      DROP USER scott CASCADE;  -- Remove user
</pre>
      After creating a new user, assign the required privileges:
<pre>
      GRANT CONNECT, RESOURCE TO scott;
      GRANT DBA TO scott;   -- Make user a DB Administrator
</pre>
      Remember to give the user some space quota on its tablespaces:
<pre>
      ALTER USER scott QUOTA UNLIMITED ON tools;
</pre>
    </li>
    <li>Accounts locked by default: scott/tiger, hr/hr, oe/oe, sh/sh, system/manager (as sysdba!) </li>
  </ul>
</li>
<li>Logical backup and recovery<ul>
  <li>`exp file=/tmp/exp.dmp log=/tmp/exp.log`</li>
  <li>`imp file=/tmp/exp.dmp log=/tmp/imp.log`</li>
  </ul>
</li>
</ul>
