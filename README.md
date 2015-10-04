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
```

Engines
-------

Spawning new engines is easy. To connect engines to our freshly started cluster, we need to mount the required connection files into the container. On each physical node, run

```sh
dir="/root/.ipython/profile_default/security"

# cd path containing id_rsa and ipcontroller-*.json
docker run -d \
       -v $PWD/id_rsa:/root/.ssh/id_rsa:ro \
       -v $PWD/ipcontroller-engine.json:$dir/ipcontroller-engine.json:ro \
       0x0l/scipy ipcluster engines
```

By default `ipcluster` launches as many engines as there are available CPU cores. To control the number of engines to be launched use the `-n` option.

Clients
-------

Running a notebook server is similar to running engines

```sh
# cd path containing id_rsa and ipcontroller-*.json
docker run -d -p 8888:8888 \
       -v $PWD/id_rsa:/root/.ssh/id_rsa:ro \
       -v $PWD/ipcontroller-client.json:$dir/ipcontroller-client.json:ro \
       0x0l/scipy
```

Alternatively,

```sh
docker run -it --rm \
       -v $PWD/id_rsa:/root/.ssh/id_rsa:ro \
       -v $PWD/ipcontroller-client.json:$dir/ipcontroller-client.json:ro \
       0x0l/scipy bash
```
