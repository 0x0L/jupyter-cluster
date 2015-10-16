#!/bin/bash

CONTROLLER_PORT=${1:-50000}
PUBLIC_KEY_FILE=${2:-$HOME/.ssh/id_rsa.pub}

docker run -v ${PUBLIC_KEY_FILE}:/id_rsa.pub:ro \
           -p ${CONTROLLER_PORT}:2222 \
           -d 0x0l/notebook controller
