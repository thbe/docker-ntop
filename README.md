# ntop on Docker

[![Build Status](https://img.shields.io/docker/automated/thbe/ntop.svg)](https://hub.docker.com/r/thbe/ntop/builds/) [![GitHub Stars](https://img.shields.io/github/stars/thbe/docker-ntop.svg)](https://github.com/thbe/docker-ntop/stargazers) [![Docker Stars](https://img.shields.io/docker/stars/thbe/ntop.svg)](https://hub.docker.com/r/thbe/ntop) [![Docker Pulls](https://img.shields.io/docker/pulls/thbe/ntop.svg)](https://hub.docker.com/r/thbe/ntop)

This is a Docker image to run a NTOP instance.

This Docker image is based on the offical [Alpine](https://hub.docker.com/r/_/alpine/) image.

#### Table of Contents

- [Install Docker](https://github.com/thbe/docker-ntop#install-docker)
- [Download](https://github.com/thbe/docker-ntop#download)
- [How to use this image](https://github.com/thbe/docker-ntop#how-to-use-this-image)
- [Next steps](https://github.com/thbe/docker-ntop#next-steps)
- [Important notes](https://github.com/thbe/docker-ntop#important-notes)
- [Update Docker image](https://github.com/thbe/docker-ntop#update-docker-image)
- [Advanced usage](https://github.com/thbe/docker-ntop#advanced-usage)
- [Technical details](https://github.com/thbe/docker-ntop#technical-details)
- [Development](https://github.com/thbe/docker-ntop#development)

## Install Docker

To use this image you have to [install Docker](https://docs.docker.com/engine/installation/) first.

## Download

You can get the trusted build from the [Docker Hub registry](https://hub.docker.com/r/thbe/ntop/):

```
docker pull thbe/ntop
```

Alternatively, you may build the Docker image from the
[source code](https://github.com/thbe/docker-ntop#build-from-source-code) on GitHub.

## How to use this image

### Environment variables

You can use two environment variables that will be recognized by the start script.

#### `ARG0`

The first argument indicates that the NTOPNG should monitor the FRITZ box.

#### `ARG1`

The second argument indicates what interface at the FRITZ box should be monitored.

#### `ARG2`

The third argument is the password for the FRITZ box.

#### `NTOP_DEBUG`

If this environment variable is set, the scripts inside the container will run in debug mode.

### Start the NTOP instance

The instance can be started by the [start script](https://raw.githubusercontent.com/thbe/docker-ntop/master/start_ntop.sh)
from GitHub:

```
wget https://raw.githubusercontent.com/thbe/docker-ntop/master/start_ntop.sh
chmod 755 start_ntop.sh
./start_ntop.sh
```

If you want to monitor your FRITZ box you have to add the following paramter to the start script:

```
wget https://raw.githubusercontent.com/thbe/docker-ntop/master/start_ntop.sh
chmod 755 start_ntop.sh
./start_ntop.sh "true" "lan" "secret"
```

### Check server status

You can use the standard Docker commands to examine the status of the NTOPNG instance:

```
docker logs --tail 1000 --follow --timestamps ntop
```

## Next steps

The next release of this Docker image should have a persistent NTOPNG configuration.

## Important notes

The username for the web server is `root`/`password` unless you don't change the password with the environment
variable as described in the [Environment variables](https://github.com/thbe/docker-ntop#how-to-use-this-image)
section.

## Update Docker image

Simply download the trusted build from the [Docker Hub registry](https://hub.docker.com/r/thbe/ntop/):

```
docker pull thbe/ntop
```

## Advanced usage

### Build from source code

You can build the image also from source. To do this you have to clone the
[docker-ntop](https://github.com/thbe/docker-ntop) repository from GitHub:

```
git clone https://github.com/thbe/docker-ntop.git
cd docker-ntop
docker build --rm --no-cache -t thbe/ntop .
```

### Bash shell inside container

If you need a shell inside the container you can run the following command:

```
docker exec -ti ntop /bin/sh
```

## Technical details

- Alpine base image
- ntop binary from official Alpine package repository

## Development

If you like to add functions or improve this Docker image, feel free to fork the repository and send me a merge request with the modification.
