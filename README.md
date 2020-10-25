# Spigot In Docker

This repo contains Dockerfile and all necessary files to build a [Spigot](https://www.spigotmc.org/) server image.

## Requirements

Docker 19.03+

## Building an image

1. Clone this repo.
2. Run `docker build` command. For example:

```
docker build . -t spigot:latest
```

## Running a container

Once image is ready one can run a spigot server container using `docker run` command. For example:

```
docker run -d -p 192.168.1.1:25565:25565 --name my-server spigot:latest
```

