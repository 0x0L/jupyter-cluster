jupyter-cluster
===============

Dockerized Python3 Jupyter/ipyparallel cluster.

This project is hosted on [Github](https://github.com/0x0L/jupyter-cluster) and automated builds are generated at [Docker Hub](https://hub.docker.com/r/0x0l/notebook/).

Quick usage
-----------

Add to `.bashrc`
```sh
# Visible location and port of the host running the controller
export JUPYTER_CONTROLLER="192.168.99.100:50000"

# Image to run for the clients and engines containers
export JUPYTER_IMAGE="0x0l/scipy"

# Notebook http port
export JUPYTER_NOTEBOOK_PORT="8888"

# A key pair for the controller
export JUPYTER_PRIVATE_KEY="${HOME}/.ssh/id_rsa"
export JUPYTER_PUBLIC_KEY="${HOME}/.ssh/id_rsa.pub"
```

Use `bin/jupyter-docker` to spawn images

Tip
---

Shutdown all engines/controller containers
```python
>>> from ipyparallel import Client
>>> rc = Client()
>>> len(rc)
160
...
>>> rc.shutdown(hub=True)
```
