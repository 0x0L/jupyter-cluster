FROM 0x0l/jupyter:latest

# Install OpenBLAS
RUN apt-get update -qq \
 && apt-get install -yqq --no-install-recommends gfortran \
 && apt-get clean -yqq \
 && rm -rf /var/lib/apt/lists/*

RUN git clone -q --branch=master git://github.com/xianyi/OpenBLAS.git /tmp/OpenBLAS \
 && ( cd /tmp/OpenBLAS \
   && make NO_LAPACKE=1 DYNAMIC_ARCH=1 NO_AFFINITY=1 NUM_THREADS=64 > /dev/null 2>&1 \
   && make install ) \
 && rm -fr /tmp/OpenBLAS \
 && echo "/opt/OpenBLAS/lib" > /etc/ld.so.conf.d/openblas.conf \
 && ldconfig

# Numpy / Scipy
ENV OPENBLAS /opt/OpenBLAS/lib/libopenblas.so
RUN pip3 install -q \
      numpy \
      scipy
