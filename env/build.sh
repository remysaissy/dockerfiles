#!/bin/bash

docker rm -f remysaissy/env &> /dev/null
if [ $? -eq 0 ]; then
  echo "env container has been killed."
fi

docker build --no-cache -t remysaissy/env .
