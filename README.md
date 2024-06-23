# Toolbox container

arm64 toolbox containers meant for dev work.

## INFO 

```
USER=data
HOME=/home/data
```

## Usage tips

You can mount SSH credentials in containers with read-only bind-mounts:

```
docker run -ti --rm -v ${HOME}/.ssh:/home/data:ro zeddee/toolbox:latest
```

