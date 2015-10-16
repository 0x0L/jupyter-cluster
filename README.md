jupyter-cluster
===============

Dockerized Python3 Jupyter/ipyparallel cluster.

This project is hosted on [Github](https://github.com/0x0L/jupyter-cluster) and automated builds are generated at [Docker Hub](https://hub.docker.com/r/0x0l/notebook/).

Quick usage
-----------

```sh
# Start the controller first
# 50000 is a random chosen port unique to this cluster
bin/controller.sh 50000

# On each worker node run
bin/engines.sh 192.168.99.100:50000
# 192.168.99.100 is the visible ip of the docker host running the controller

# Connect a notebook to the cluster
bin/notebook.sh 192.168.99.100:50000
```

```python
from ipyparallel import Client
rc = Client()
...
# this actually shutdowns the docker containers
rc.shutdown()
```
