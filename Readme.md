## Docker in Docker with docker-compose

Based on the image docker:stable-dind
with docker-compose  and git installed.
For running an isolated docker.

## Usage

Go to your docker-compose map
and

```bash
docker run -d --privileged --name dind \
 -v $(pwd):/docker-compose danielguerra/dind-compose
```

Then to start your projects run

```bash
docker exec -ti dind docker-compose up -d
```

## Autostart Services

This project uses supervisor to start services,
the folder for the config is /etc/supervisor.d

docker-compose example


```bash

docker exec -ti dind vi /etc/supervisor.d/myproject.conf
```

Copy/Paste this content

```
[program:myproject]
command=docker-compose up
user=root
autorestart=true
```

Esc:wq to get out off vi

Then reconfigure the supervisor with supervisorctl

```bash
docker exec -ti dind supervisorctl update
```

Check the new service

```bash
docker exec -ti dind supervisorctl status
```

There is also a map for shell scripts to run at entrypoint
/etc/entrypoint.d
