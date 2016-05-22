#!/bin/bash
set -e

USER=$(echo $USER_ID | cut -d: -f1)
_UID=$(echo $USER_ID | cut -d: -f2)
_GID=$(echo $USER_ID | cut -d: -f3)

groupadd -o -g $_GID $USER
useradd --create-home -s /bin/bash -u $_UID -g $_GID $USER

# Dispatch docker command
gosu $USER $*
