#!/bin/bash

dir="/root/.ipython/profile_default/security"

docker run -it --rm \
           -v $PWD/cluster_key:/root/.ssh/id_rsa:ro \
           -v $PWD/ipcontroller-client.json:$dir/ipcontroller-client.json:ro \
           0x0l/scipy bash
