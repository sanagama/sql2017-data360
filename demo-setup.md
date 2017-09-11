# Platform of your choice: Freedom to choose Windows, Linux or Docker Containers for SQL Server

## What's here?
This page has the ***demo setup instructions*** for the demos presented at the Data & AI Summit, Sept 2017.

Jump to:
- [Main README.md](https://github.com/sanagama/sql2017-data360)
- [Demo Setup](https://github.com/sanagama/sql2017-data360/blob/master/demo-setup.md)
- [Demo Script - SQL on Linux](https://github.com/sanagama/sql2017-data360/blob/master/demo-script-sql-linux.md)
- [Demo Script - SQL in Docker](https://github.com/sanagama/sql2017-data360/blob/master/demo-script-docker.md)

## Prerequisites
This demo was done on a MacBook running Docker and 2 VMs, all running locally on the MacBook. I used Parallels, but you can also use VirtualBox to create & run the VMs. Modify accordingly you're using Linux or Windows to run the demo.

These are the prerequisites to run this demo:
- A MacBook (or other computer)
- Visual Studio Code
- A virtual machine running Windows 10
- A virtual machine running Ubuntu 17.04
- Docker

## Demo Setup
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
1. Launch SSMS and restore database backup ```c:\sql2017-data360\backups\BollywoodDB.bak``` to the local SQL instance.
1. Launch SSMS and restore database backup ```c:\sql2017-data360\backups\AdventureWorksLT.bak``` to the local SQL instance.
1. Run WinSCP and connect to the Ubuntu VM to make sure the Windows VM can *see* the Ubuntu VM.

### Setup Docker
Download Docker for your operating system and complete the installation:
- [Docker for Mac](https://www.docker.com/docker-mac)
- [Docker for Windows](https://www.docker.com/docker-windows)

Increase Docker memory to 4 GB as documented here:
<https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker#requirements>

> **TIP:** Make sure the MacBook, the Windows VM and the Ubuntu VM can all ping each other. Add entries to ```/etc/hosts``` on the MacBook if you need to.
