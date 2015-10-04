#!/bin/bash

dir="/root/.ipython/profile_default/security"

docker run -d \
           -v $PWD/cluster_key:/root/.ssh/id_rsa:ro \
           -v $PWD/ipcontroller-engine.json:$dir/ipcontroller-engine.json:ro \
           0x0l/scipy ipcluster engines
