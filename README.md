jupyter-cluster
===============

Dockerized Python3 Jupyter/ipyparallel cluster.

This project is hosted on [Github](https://github.com/0x0L/jupyter-cluster) and automated builds are generated at [Docker Hub](https://hub.docker.com/r/0x0l).

Quick usage
-----------

Add to `.bashrc`
```sh
# Visible location and ssh port of the controller
export JUPYTER_CONTROLLER="192.168.99.100:50000"

# A key pair for connections to the controller
export JUPYTER_KEY="$HOME/.ssh/id_rsa"
export JUPYTER_KEY_PUB="$HOME/.ssh/id_rsa.pub"

# User mapping
export JUPYTER_ID="2000:2008"

# Image to run for the clients and engines containers
export JUPYTER_IMAGE="0x0l/scipy"

# Notebook http port
export JUPYTER_NOTEBOOK_PORT="8888"

export PATH=$HOME/projects/jupyter-cluster/bin:$PATH
```

Use the `jupyter-docker` script to spawn containers.
