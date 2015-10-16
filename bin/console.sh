#!/bin/bash

CONTROLLER=${1:-192.168.99.100:50000}
PRIVATE_KEY_FILE=${2:-$HOME/.ssh/id_rsa}

docker run -e CONTROLLER=${CONTROLLER} \
           -v ${PRIVATE_KEY_FILE}:/id_rsa:ro \
           -it --rm 0x0l/notebook console
