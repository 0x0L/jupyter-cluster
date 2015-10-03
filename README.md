jupyter-cluster
===============

Dockerized Python3 Jupyter/ipyparallel cluster.

Stand-alone
-----------

To launch a stand-alone notebook server running on port `8888`

```sh
docker run -d -p 8888:8888 0x0l/scipy
```

Alternatively, to spawn a command line console, use

```sh
docker run -it --rm 0x0l/scipy bash
```

The `scipy` image merely adds a freshly compiled OpenBLAS and a few python scientific packages on top of the base `notebook` image. One can replace `0x0l/scipy` by `0x0l/notebook` for lighter images with no scientific packages.

Controller
----------

The controller container does not need any external resource: it runs `sshd` and a `ipcontroller` listening on the loopback interface. However, on launch, you need to specify the visible IP address and choose a connection port.

The client and engines nodes are expected to connect through SSH tunnels using a private SSH key and the `ipyparallel` connection files generated on the controller node. To retrieve these files, we can use `docker cp`.

```sh
# You might need to specify the host manually
host=$(docker-machine ip default)
port=50000

# Get back the controller id for later access
container_id=$( \
  docker run -e CONTROLLER_HOST=$host -e CONTROLLER_PORT=$port \
             -d -p $port:22 0x0l/controller \
)

# Wait a bit for the controller to launch
sleep 3

# In practice, one would copy the files to a volume shared
# across the (physical) nodes or distribute them with scp
dir="$container_id:/root/.ipython/profile_default/security"
docker cp $dir/ipcontroller-engine.json ipcontroller-engine.json
docker cp $dir/ipcontroller-client.json ipcontroller-client.json
docker cp $container_id:/root/.ssh/id_rsa id_rsa

unset dir
unset container_id
unset host
unset port
```

Engines
-------

Spawning new engines is easy. To connect engines to our freshly started cluster, we just need to mount the required files into the `/cluster` directory (in read-only mode). On each physical node, run

```sh
# cd path containing id_rsa and ipcontroller-*.json
docker run -d -v $PWD:/cluster:ro 0x0l/scipy ipcluster engines --profile=ssh
```

By default `ipcluster` launches as many engines as there are available CPU cores. One can manually set the number of engines to be launched using the `-N=` option.

Clients
-------

Running a notebook server is similar to running engines

```sh
# cd path containing id_rsa and ipcontroller-*.json
docker run -d -v $PWD:/cluster:ro -p 8888:8888 0x0l/scipy
```

Alternatively,

```sh
docker run -it --rm -v $PWD:/cluster:ro 0x0l/scipy bash
```

One needs to specify the connection file and SSH key when instantiating a `Client`

```python
from ipyparallel import Client
rc = Client(sshkey='/cluster/id_rsa', url_file='/cluster/ipcontroller-client.json')
```
