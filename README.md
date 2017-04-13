# Configuration for TeamCity + DotNet Core + React/Node

This project accompanies a future blog post which describes
how to set up Continuous Deployment with a DotNet Core WebAPI /
React / MSSQL web site using Azure and TeamCity.

## Build

This assumes you are on a Linux machine that is running Docker.

1) Edit each of these files with your Azure configuration (or do it
later):

```
agent/lftp-api.sync
agent/lftp-front.sync
agent/swap.sh
```

2) Create a directory on your Docker host to hold the working data for all
three containers.

```sh
$ mkdir $HOME/data
```

Then build & run the whole thing:

```sh
$ docker-compose up
```

And navigate to the teamcity URL at [http://localhost:8111](http://localhost:8111).

## Notes

This uses the official TeamCity docker images for [teamcity-server](https://hub.docker.com/r/jetbrains/teamcity-server/) and [teamcity-agent](https://hub.docker.com/r/jetbrains/teamcity-agent/), as well as the official [Microsoft MSSQL server on Linux](https://hub.docker.com/r/microsoft/mssql-server-linux/)

_I can't believe I just typed that._

I didn't tie these images to any particular image version.  When a new version
comes out, you can pull the new image and rebuild the instance, e.g.

```sh
$ docker-compose down
$ docker pull jetbrains/teamcity-server
$ docker-compose build
$ docker-compose up
```

Since all the working data is in your `$HOME/data` directory, you can destroy and recreate the containers without losing any build information.

The docker teamcity agent is fairly heavy.  I added several things on top of the default image including: 

- [dotnet](https://www.microsoft.com/net/core#linuxubuntu) to compile the C# code and test it
- [npm](https://www.npmjs.com/) and [node](https://nodejs.org/en/) to compile the JavaScript code and test it
- [lftp](https://lftp.yar.ru/) to deploy via SFTP to Azure
- The [azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) tools to help deploy the site
- [mssql-tools](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools) to access SQL Server.



