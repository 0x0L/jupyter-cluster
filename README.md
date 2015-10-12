jupyter-cluster
===============

Dockerized Python3 Jupyter/ipyparallel cluster.

This project is hosted on [Github](https://github.com/0x0L/jupyter-cluster) and automated builds are generated at [Docker Hub](https://hub.docker.com/r/0x0l/notebook/).

Quick usage
-----------

```sh
# Create a key for cluster access
ssh-keygen -q -t rsa -N '' -f test_cluster_key

# Controller connection information
# 192.168.99.100 is the visible ip of the docker host running the controller
# 50000 is a random chosen port unique to this cluster
export CLUSTER="192.168.99.100:50000:${PWD}/test_cluster_key"
bin/controller.sh
bin/engines.sh
bin/notebook.sh
```
