# Platform of your choice : Freedom to choose Windows, Linux or Docker Containers for SQL Server

## What's here?
This repo has the demo scripts, decks and videos that were presented at the Data & AI Summit, Sept 2017.

Jump to:
- [Demo Prerequisites](#demo-prerequisites)
- [One-time Demo Setup](#one-time-demo-setup)
- [Demo Walkthrough](#demo-walkthrough)

## Demo Prerequisites

This demo was done on a MacBook running Docker and 2 VMs, all running locally on the MacBook. I used Parallels, but you can also use VirtualBox to create & run the VMs. Modify accordingly you're using Linux or Windows to run the demo.

These are the prerequisites to run this demo:
- A MacBook (or other computer)
- Visual Studio Code
- A virtual machine running Windows 10
- A virtual machine running Ubuntu 17.04
- Docker

## One-time Demo Setup
Perform these steps ***once*** on your computer:

Jump to:
- [Setup MacBook](#setup-macbook)
- [Setup Ubuntu VM](#setup-ubuntu-vm)
- [Setup Windows VM](#setup-windows-vm)
- [Setup Docker](#setup-docker)

### Setup MacBook
1. Install *Python* and *pip* on your MacBook. Here's a great guide for macOS: <https://hackercodex.com/guide/python-development-environment-on-mac-osx>
1. Download and install Visual Studio Code from here: <https://code.visualstudio.com/download>
1. Install the *mssql extension for VS Code* as described here: <https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-develop-use-vscode>
1. Install *mssql-scripter* as described here: <https://github.com/Microsoft/sql-xplat-cli/blob/dev/doc/installation_guide.md>
1. Install *mssql-tools* for macOS as described here: <https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools#macos>
1. Browse to <https://github.com/sanagama/sql2017-data360>
1. Click ```Clone or Download``` then click ```Download ZIP```
1. Save the ZIP file to your ```HOME``` directory as ```~/sql2017-data360.zip``` in the VM.
1. Extract the zip file to your ```HOME``` directory ```~/sql2017-data360``` in the VM.
1. At this point, you should have all the demo files in the directory ```~/sql2017-data360``` in your MacBook.

### Setup Ubuntu VM
1. Create an Ubuntu 17.04 VM (2 cores + 4 GB RAM + 16 Gb HDD)
1. Name the Ubuntu VM ```pbox-ubuntu```
1. Start the VM and follow the steps below in the VM. 
1. Browse to <https://github.com/sanagama/sql2017-data360>
1. Click ```Clone or Download``` then click ```Download ZIP```
1. Save the ZIP file to your ```HOME``` directory as ```~/sql2017-data360.zip``` in the VM.
1. Extract the zip file to your ```HOME``` directory ```~/sql2017-data360``` in the VM.
1. At this point, you should have all the demo files in the directory ```~/sql2017-data360``` in the VM.

### Setup Windows VM
1. Create a Windows 10 VM (2 cores + 8 GB RAM + 32 GB HDD).
1. Name the Windows VM ```pbox-win10```
1. Start the VM and follow the steps below in the VM. 
1. Download & install [SQL Server 2017 Developer Edition](https://www.microsoft.com/en-us/sql-server/sql-server-2017) (RC2 as of this writing) in the VM.
1. Download & install the [latest version of SSMS](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms) (17.2 as of this writing) in the VM.
1. Download & install WinSCP: <https://winscp.net/eng/download.php> in the VM.
1. Browse to <https://github.com/sanagama/sql2017-data360>
1. Click ```Clone or Download``` then click ```Download ZIP```
1. Save the ZIP file as ```c:\sql2017-data360.zip``` in the VM.
1. Extract the zip file to folder ```c:\sql2017-data360``` in the VM.
1. At this point, you should have all the demo files in the directory ```c:\sql2017-data360``` in the VM.
1. Launch SSMS and restore database backup ```c:\sql2017-data360\backup-files\BollywoodDB.bak``` to the local SQL instance.
1. Run WinSCP and connect to the Ubuntu VM to make sure the Windows VM can *see* the Ubuntu VM.

### Setup Docker
Download Docker for your operating system and complete the installation:
- [Docker for Mac](https://www.docker.com/docker-mac)
- [Docker for Windows](https://www.docker.com/docker-windows)

Increase Docker memory to 4 GB as documented here:
<https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker#requirements>

> **TIP:** Make sure the MacBook, the Windows VM and the Ubuntu VM can all ping each other. Add entries to ```/etc/hosts``` on the MacBook if you need to.

## Demo Walkthrough
This section walks through the demos shown in the presentation with talking points.

Jump to:
1. [SQL 2017 on Ubuntu](#1-sql-2017-on-ubuntu)
1. [SQL Server on Linux Backup Restore](#2-sql-server-on-linux-backup-restore)
1. [Use VS Code with SQL on Linux](#3-use-vs-code-with-sql-on-linux)
1. [SQL 2017 in Docker](#4-sql-2017-in-docker)
1. [Graph Support in SQL 2017](#5-graph-support-in-sql-2017)
1. [Use SQL 2017 in Docker for dev/test](#6-use-sql-in-docker-for-dev-test)

### 1. SQL 2017 on Ubuntu

(**Talking Points**)
- I have 2 VMs running on my MacBook: one is a Windows VM with SQL 2017 installed and another is a fresh Ubuntu VM.
- Let me go over to my Ubuntu VM.

Switch over to the Ubuntu VM.

(**Talking Points**)
- Let’s install SQL Server on Ubuntu.
- One of our key goals with SQL Server on Linux is to meet developers where they are.
- We wanted to make sure that we had an easy & platform-appropriate install experience for customers. I’ll use ```apt``` on Ubuntu.
- For this demo, I have ```Bash``` scripts to save me some typing.  I’ll show you what each Bash script does before I run it.

Launch ```Terminal``` and type the following:
```
cd ~/sql2017-data360/sql-on-ubuntu
ls -al
cat ./1-install-sql2017.sh
```

(**Talking Points**)
- As you would expect, we have a standard ```apt``` experience for Ubuntu.
- We also support Redhat (yum) and SUSE (zypper) and we also have a Docker image that you can use on Linux/macOS/Windows, and we have a VM template in the Azure gallery.
- Let me run the Bash script

Type the following in the ```Terminal``` window:
```
sudo ./1-install-sql2017.sh
```

(**Talking Points**)
- Let me follow the prompts here…. And install done!
- SQL is installed and it tells me to run ```sudo /opt/mssql/bin/mssql-conf setup```
- Let me do that now.

Type the following in the ```Terminal``` window:
```
sudo /opt/mssql/bin/mssql-conf setup
```

(**Talking Points**)
- I’ll accept the EULA and specify my SA password ```Yukon900```
- Done. SQL is configured and is running
- Now let me check if SQL is running - I have a simple ```Bash``` script to do that

Type the following in the ```Terminal``` window:
```
cat ./2-check-status.sh
./2-check-status.sh
```

(**Talking Points**)
- Yep, all good.
- We’ve ported the standard SQL command line tools (sqlcmd and bcp) to Linux & macOS and packaged them up in a separate package called mssql-tools that you can install separately from SQL Server.
- Let me install mssql-tools - you guessed it, I have a ```Bash``` script to do that too.

Type the following in the ```Terminal``` window:
```
cat ./3-install-mssql-tools.sh
sudo ./3-install-mssql-tools.sh
```

As you would expect, another standard ```apt``` experience.

(**Talking Points**)
- Tools are installed, so I’ll run sqlcmd to connect to SQL running locally and run a simple query

Type the following in the ```Terminal``` window:
```
sqlcmd -S . -U sa
```

Type in the password (```Yukon900```) when prompted.
At the ```sqlcmd``` prompt, type:
```
sqlcmd -S . -U sa
select @@version
GO
```

(**Talking Points**)
- Proof that SQL Server is indeed running on Ubuntu ;-)
- You’re familiar with SSMS, right? Cool, let’s connect to SQL on Linux with SSMS running on Windows.

Switch to the Windows VM and launch SSMS
Connect to ```pbox-ubuntu``` with SQL Server authentication (User: ```sa``` Password: ```Yukon900```)

Right-click the ```server``` node and click ```Properties```. Show the ```platform``` and ```version``` information.

(**Talking Points**)
- The tools you use today work nicely with SQL Server on Linux.

### 2. SQL Server on Linux Backup Restore

(**Talking Points**)
- Let’s do something more fun.
- I have a database called ```BollywoodDB``` on my SQL Server on Windows

Expand *tables* and do a *select top 1000* from the *Actors* table.

(**Talking Points**)
- Let’s try and migrate this database over to SQL on Ubuntu.
- I have a backup of this database here ```c:\sql2017-data360\backup-files\BollywoodDB.bak``` that I’d like to migrate to SQL on Ubuntu.
- Migrating a database from SQL on Windows to SQL on Linux is easy: simply restore a backup
- The first step is to copy the ```.bak``` file from Windows to Ubuntu
- There are several ways you can do this (ssh, scp, etc.)
- For this demo, I’ll just use WinSCP to copy the ```.bak``` file from my Windows VM to my Ubuntu VM.

Switch to the Windows VM and run WinSCP in the copy the file ```c:\sql2017-data360\backup-files\BollywoodDB.bak``` to the ```HOME``` folder in the Ubuntu VM.

(**Talking Points**)
- Now, I'll restore this backup to SQL Server on Linux via T-SQL.

Switch to Ubuntu VM and launch ```Terminal``` and type the following:
```
cd ~
ls -al *.bak
```

(**Talking Points**)
- I have my ```.bak``` file in my ```HOME``` directory
- I’ll move the ```.bak``` file to ```/var/opt/mssql/backup/```
- I have a simple ```Bash``` script to help me do that
- This is what the script looks like:

Type the following in the ```Terminal``` window:
```
cd ~/sql2017-data360/sql-on-ubuntu
cat ./5-move-bak-file.sh
sudo ./5-move-bak-file.sh
```

(**Talking Points**)
- Done.
- Now, I'll restore it with ```sqlcmd```. I have a simple ```Bash``` script to do that too. This is what it looks like:

Type the following in the ```Terminal``` window:
```
cat ./6-restore-BollywoodDB.sh
cat ./restore_BollywoodDB.sql
```

(**Talking Points**)
- Nothing fancy here.
- The script simply runs ```sqlcmd``` and passes it a ```.sql``` file that does the restore.
- Let's run the script

Type the following in the ```Terminal``` window:
```
./6-restore-BollywoodDB.sh
```
Type in the password (```Yukon900```) when prompted

(**Talking Points**)
- Done.
- Now let’s use SSMS to see if the restore worked.

Switch back to the Windows VM.
Refresh the *databases* node with SSMS connected to ```pbox-ubuntu```.

(**Talking Points**)
- We can see that the database ```BollywoodDB``` has been restored on SQL Server on Linux.

Expand the *tables* node and do a ```select top 1000``` from the *Actors* table.

(**Talking Points**)
- That was my first demo.
- Let’s recap what I showed you: I installed SQL on Ubuntu, installed the Linux-native command line tools, ran a simple query, connected from SSMS and restored a database backup from Windows to Linux.

### 3. Use VS Code with SQL on Linux

Shutdown the Windows VM. Leave the Ubuntu VM running.

Switch to the MacBook. 

(**Talking Points**)
- SQL is running in my Ubuntu VM.
- I'm on my MacBook and I can't use SSMS.
- What can I use to edit and run T-SQL queries interactively?
- Well, we can use Visual Studio Code and the nifty mssql extension.

Launch VS Code.

Click on the ```extensions``` button and show that the ```mssql extension``` is installed.

Create a new file and change the file type to ```SQL```

Type the following command in the editor:
```
SELECT @@VERSION
```

Click ```Execute Query```

(**Talking Points**)
- VS Code prompts me for the connection
- I'll connect to SQL running in my Ubuntu VM

Enter the following values in the connection prompt:
Property | Value
--------------- | ------
Server Name | ***pbox-ubuntu***
Authentication | ***SQL Authentication***
Username | ***sa***
Password | ***Yukon900***
Save Password | ***Yes***

(**Talking Points**)
- Show the results grid
- Let me switch to the database that I restored earlier

Click on ```master``` in the status bar and select ```BollywoodDB```

Type the following command in the editor:
```
SELECT * from dbo.Actors
```

(**Talking Points**)
- Talk to export results as CSV, JSON, Excel

(**Talking Points**)
- Let's try something a bit more interesting
- You know that SQL Server supports a feature called Dynamic Data Masking which allows you to mask sensitive information
- Let's see it in action

Open the file ```~/sql2017-data360/demos/sql_security_demo.sql``` in VS Code.

Walk each through line in the file and execute it.

(**Talking Points**)
- As you can see, we have a pretty good experience to edit and run T-SQL queries in VS Code and use it from my MacBook.
- The mssql extension for VS Code is open source under MIT and is available on the VS Code marketplace for free.
- We invite you to try VS Code on Linux, macOS and Windows with SQL Server and tell us what you think.

### 4. SQL 2017 in Docker

Switch to the MacBook. 

(**Talking Points**)
- Let me switch context and talk about running SQL in Docker.

Install experience

Run sqlcmd included in the container

Run sqlcmd from outside the container

### 5. Graph Support in SQL 2017

(**Talking Points**)
- SQL in Docker is plain old SQL Server.
- I can use all the new features in SQL 2017 as usual.
- As an example, let's take a look at the new Graph support in SQL 2017.

Switch to VS Code on the MacBook.

Open the file ```~/sql2017-data360/demos/graph_demo.sql``` in VS Code.

Walk each through line in the file and execute it.

(**Talking Points**)
- That was a quick demo of the new Graph support in SQL 2017.

### 6. Use SQL in Docker for dev/test

Ensure the Ubuntu VM is still running. After the previous demo, the data in the *Actors* table in the ```BollywoodDB``` database is masked.

(**Talking Points**)
- Let me switch context and talk about using SQL in Docker for dev/test scenarios.
- SQL is still running in my Ubuntu VM.
- Recall that we used Dynamic Data Masking to mask data in some sensitive columns.
- Now, imagine that SQL running in my Ubuntu VM is my production server.
- I'm an app dev and I'm told to create a simple web app to edit data about those Bollywood actors.
- I need to get a copy of the production data to develop my app
- I don't need to see the sensitive data while creating or testing my app.

Show extraction (from Ubuntu VM - already data masked)
Run mssql-scripter on macOS to extract from SQL on Windows

Show sanitization & deployment
Run mssql-scripter + sqlcmd on macOS to deploy script to SQL in Docker

Talk to how this can be integrated with a CI/CD pipeline.

(**Talking Points**)
- That was a quick example of using SQL in Docker for dev/test scenarios
- You can use existing command line tools to seed data in Docker and sanitize or get a subset of data along the way
- You can also integrate these steps with your existing CI/CD pipelines and automated testing processes.
