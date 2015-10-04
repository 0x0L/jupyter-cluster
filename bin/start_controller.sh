#!/bin/bash

port=${1:-50000}

# You might need to specify the host manually
host=$(docker-machine ip default)

echo Starting controller listening on $host:$port
container_id=$( \
  docker run -e CONTROLLER_HOST=$host -e CONTROLLER_PORT=$port \
             -d -p $port:22 0x0l/controller \
)
echo $container_id
echo

# Wait a bit for the controller to launch
echo Waiting 3 sec for the controller to be running...
sleep 3
echo

echo Copying connection files in the current directory
dir="$container_id:/root/.ipython/profile_default/security"
docker cp $dir/ipcontroller-engine.json ipcontroller-engine.json
docker cp $dir/ipcontroller-client.json ipcontroller-client.json
docker cp $container_id:/root/.ssh/id_rsa cluster_key

unset host
unset port
unset dir
