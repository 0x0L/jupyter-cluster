#!/bin/bash

CONTROLLER_HOST=$( echo $CLUSTER | cut -d : -f 1 )
CONTROLLER_PORT=$( echo $CLUSTER | cut -d : -f 2 )
KEY_FILE=$( echo $CLUSTER | cut -d : -f 3 )

docker run -d -p ${CONTROLLER_PORT}:2222 \
           -v ${KEY_FILE}:/id_rsa:ro \
           -v ${KEY_FILE}.pub:/id_rsa.pub:ro \
           0x0l/notebook controller
