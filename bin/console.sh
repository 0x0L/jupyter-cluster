#!/bin/bash

CONTROLLER_HOST=$( echo $CLUSTER | cut -d : -f 1 )
CONTROLLER_PORT=$( echo $CLUSTER | cut -d : -f 2 )
KEY_FILE=$( echo $CLUSTER | cut -d : -f 3 )

docker run -it --rm \
           -v ${KEY_FILE}:/id_rsa:ro \
           -v ${KEY_FILE}.pub:/id_rsa.pub:ro \
           -e CONTROLLER_HOST=${CONTROLLER_HOST} \
           -e CONTROLLER_PORT=${CONTROLLER_PORT} \
           0x0l/notebook console
