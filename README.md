jupyter-cluster
===============

Dockerized Python3 Jupyter/ipyparallel cluster.

This project is hosted on [Github](https://github.com/0x0L/jupyter-cluster) and automated builds are generated at [Docker Hub](https://hub.docker.com/r/0x0l).

Quick usage
-----------

Add to your `.bashrc` and customize
```sh
export PATH=$HOME/projects/jupyter-cluster/bin:$PATH

# Visible location and ssh port of the controller
export JUPYTER_CONTROLLER="192.168.99.100:9000"

# (optional) Custom docker run arguments
# Hook to map additional folders and ports, e.g.
# export JUPYTER_DOCKER_ARGS="-v $HOME/data:/mnt/data:ro"

# (optional) Number of engines per node
# default: number of available cpu cores
# export JUPYTER_ENGINES_N="16"

# (optional) User mapping
# default: "1000:1000"
# export JUPYTER_ID="1000:1000"

# (optional) Image to run for the clients and engines containers
# default: "0x0l/jupyter"
export JUPYTER_IMAGE="0x0l/scipy"

# A key pair for connecting to the controller
export JUPYTER_KEY_PUB="$HOME/.ssh/id_rsa.pub"
export JUPYTER_KEY_PRV="$HOME/.ssh/id_rsa"

# (optional) Notebook password hash
# generated with IPython.lib.passwd, e.g. for "password"
export JUPYTER_NOTEBOOK_PASSWORD="sha1:2353ceb79862:2c18df074d8ebdff589dc37aa4d871c7b29a5caf"

# (optional) Notebook https port
# default: 8888
export JUPYTER_NOTEBOOK_PORT="8888"

# (optional) Grant user sudo rights
# export JUPYTER_SUDO=1
```

Use the `jupyter-docker` command to spawn containers.
