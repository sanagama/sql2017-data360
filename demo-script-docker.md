# Platform of your choice: Freedom to choose Windows, Linux or Docker Containers for SQL Server

## What's here?
This page has the ***demo scripts*** and ***talking points*** for the ***SQL 2017 in Docker*** demos presented at the Data & AI Summit, Sept 2017.

Jump to:
- [Main README.md](https://github.com/sanagama/sql2017-data360)
- [Demo Setup](https://github.com/sanagama/sql2017-data360/demo-setup.md)
- [Demo Script - SQL on Linux](https://github.com/sanagama/sql2017-data360/demo-script-sql-linux.md)

## Demo Script - SQL 2017 in Docker
There are 4 demos below. I recommend you perform these demos in sequence if possible.

Jump to:
1. [SQL in Docker Intro](#sql-in-docker-intro)
1. [Create a container](#1-create-a-container)
1. [Create pre-production environment](#2-create-pre-production-environment)
1. [Create dev environment](#3-create-dev-environment)
1. [Share container](#4-share-container)

#### SQL in Docker Intro

Switch to the MacBook. 

(**Talking Points**)
- Let me talk a bit about running SQL in Docker.
- Why would you do this?
- Ultimately, this is about empowering you to deliver continuous value to your customers in an agile manner
- Developers working with Continuous Integration/Continuous Deployment (CI/CD) pipelines can now include SQL Server 2017 containers as a component of their apps for an integrated build, test, and deploy experience.
- You can use this for local development and CI/CD automation with containers.

This gives you 3 big things:
1. dramatically simplifies development, testing, and deployment of applications (you can package app + deps including SQL Server into a portable environment)
1. greatly reduces variability and increases the speed of every iteration in the CI/CD pipeline
1. enforces a consistent dev/test environment for your team, since they can share the same state of an application in their container

- In addition, you can also automate large-scale testing of containerized apps + SQL Server with high-intensity container deployments with managed container services.
- e.g. Kubernetes, Docker Swarm, or other orchestration systems.
- spin up on demand, execute tests, spin down when finished.
- SQL Server runs in all these environments

Let's start

#### 1. Create a container

Go to <https://hub.docker.com/r/microsoft/mssql-server-linux/> and talk to the image in Docker Hub. Point out we have 2M+ pulls now.

Launch a ```Terminal``` window and type the following:
```
cd ~/sql2017-data360/sql-in-docker
ls -al
cat ./1-pull-image-sql.sh
./1-pull-image-sql.sh
```

(**Talking Points**)
- This pulls down the SQL Server image from Docker Hub
- Now let's run the image

Type the following in the ```Terminal``` window:
```
ls -al
cat ./2-run-image-sql.sh
./2-run-image-sql.sh
```

(**Talking Points**)
- We now have the SQL command line tools (sqlcmd and bcp) available on macOS
- Let's run sqlcmd and connect to SQL in Docker
- Note that sqlcmd and bcp are also included in the Docker image, so you can run them from there too

Type the following in the ```Terminal``` window:
```
ls -al
cat ./2-run-sqlcmd.sh
./3-run-sqlcmd.sh
```

(**Talking Points**)
- That was a basic demo of SQL Server 2017 in Docker

#### 2. Create pre-production environment

(**Talking Points**)
- Let's do something more interesting
- Assume that SQL running in my Ubuntu VM is my production server.
- The production server is running the production database (Adventureworks in this demo).
- Imagine that I'm an app dev and I'm told to create a simple web app to edit data in the ```Customer``` table.
- I ask my DBA for a backup of my production database to write my app.
- The security folks in my team don't want me see sensitive production data
- Also, I don't need the full data - I only the data in the ```Customer``` table to write my app.

(**Talking Points**)
- How can I make this happen?
- Well, here's how we can create a pre-production environment using SQL Server in Docker.

Type the following in the ```Terminal``` window:
```
ls -al
cat ./4-create-image-preprod.sh
```

(**Talking Points**)
- I'm creating another Docker image here called ```sqldocker-preprod```
- This time, I'm doing something special: I'm mounting a volume on my MacBook to a directory inside Docker
- This let's me do things like restore a backup into SQL running in Docker

Type the following in the ```Terminal``` window:
```
./4-create-image-preprod.sh
```

(**Talking Points**)
- Let's fire up VS Code and connect to SQL in Docker

Launch VS Code.
Connect to ```sqldocker-preprod```
Open file ```~/sql2017-data360/sql-in-docker/sql/create-db-preprod.sql```

Talk to each statement as you execute it.

(**Talking Points**)
- Great, we've now have a pre-production environment where we've masked sensitive data
- Next problem: this is the full production database. The dev only needs the data in the ```Customer``` table.
- Let's see how we can address that

#### 3. Create dev environment

(**Talking Points**)
- My ```sqldocker-preprod``` Docker image is still running
- Let's create a new image for the developer called ```sqldocker-dev```

Type the following in the ```Terminal``` window:
```
ls -al
cat ./5-create-image-dev.sh
./5-create-image-dev.sh
```

(**Talking Points**)
- We've released a new Python-based open source command line tool called ```mssql-scripter```
- We can use it to generate scripts to create database schema - think of this as a multi-OS CLI equivalent of the *Generate Scripts Wizard* in SSMS.
- Let's use it to connect to ```sqldocker-preprod``` and generate a DDL script for my production database.

Type the following in the ```Terminal``` window:
```
ls -al
cat ./6-create-script-dev-db.sh
./6-create-script-dev-db.sh
```

(**Talking Points**)
- The script has been generated in file ```createdb.sql```
- Let's run it against ```sqldocker-dev``` to create the database schema.

Type the following in the ```Terminal``` window:
```
ls -al
cat ./7-run-script-dev-db.sh
./7-run-script-dev-db.sh
```

(**Talking Points**)
- Cool, now we have the database schema in ```sqldocker-dev```
- But we still don't have any data
- Recall that we've already masked sensitive data in the ```sqldocker-preprod``` image
- Also recall that the the dev only needs the data from the ```Customer``` table
- Now the dev adds a new requirement: she only needs about 10 rows from the ```Customer``` table
- Let's go get the data from the ```Customer``` table with the good old ```bcp``` command line utility
- And keep only 10 rows

Type the following in the ```Terminal``` window:
```
ls -al
cat ./8-run-bcp-out-in.sh
./8-run-bcp-out-in.sh
```

(**Talking Points**)
- Cool, all done
- Let's take a look at the dev image

Switch to VS Code.
Connect to ```sqldocker-dev```
Open a new query window and type ```SELECT * FROM [SalesLT].[Customer]```

(**Talking Points**)
- Our dev environment is ready!
- Now, how can we share these environments with the rest of the team?

#### 4. Share container

(**Talking Points**)
- We can easily push these images to Docker hub for others to use
- This way, the image can be pulled into a testing/QA  environment to test with a larger, more representative dataset - and the image includes SQL Server + the database

(**Talking Points**)
- That was a quick example of using SQL in Docker for dev/test scenarios
- I showed you how to get SQL in Docker up & running, restore a backup in a pre-prod, mask data and then create a dev environment with a subset of the data.
- Next, I showed you how to share these Docker images via docker hub
- You can easily integrate these steps with CI/CD pipelines and augment with automated database unit testing processes.
