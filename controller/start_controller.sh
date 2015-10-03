#!/bin/sh

# Generate a new private key we will distribute to the engines
ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa

# Authorize logins with this key
cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

# Run the controller
ipcontroller --enginessh=root@$CONTROLLER_HOST:$CONTROLLER_PORT \
             --ssh=root@$CONTROLLER_HOST:$CONTROLLER_PORT \
             --no-secure
