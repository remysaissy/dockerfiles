#!/bin/bash

dockerId=$(docker ps -aq -f name=remysaissy/env)

if [ "$dockerId" == "" ]; then
  docker run \
    -e "user=$(whoami)" \
    -e "uid=$(id -u)" \
    -e "gid=$(id -g)" \
    $(grep nameserver /etc/resolv.conf | awk '{ print "--dns", $2 }' | tr '\n' ' ' ) \
    --volume ~/docker-home:/home/$(whoami) \
    --volume ~/Projects:/home/$(whoami)/Projects \
    --volume ~/Downloads:/home/$(whoami)/Downloads \
    --volume ~/notebooks:/home/$(whoami)/notebooks \
    -it remysaissy/env
else
  # Docker container does exist
  docker start $dockerId > /dev/null
  docker exec -it $dockerId /bin/bash
fi
