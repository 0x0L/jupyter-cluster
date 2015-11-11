FROM 0x0l/jupyter:latest

# Install OpenBLAS from source
RUN apt-get update -qq \
 && apt-get install -yqq --no-install-recommends gfortran \
 && apt-get clean -yqq \
 && rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
 && wget -q https://github.com/xianyi/OpenBLAS/archive/develop.zip \
 && unzip -qq develop.zip \
 && ( cd /tmp/OpenBLAS-develop \
   && make DYNAMIC_ARCH=1 NUM_THREADS=16 > /dev/null 2>&1 \
   && make install ) \
 && rm -fr /tmp/*develop \
 && echo "/opt/OpenBLAS/lib" > /etc/ld.so.conf.d/openblas.conf \
 && ldconfig

# Numpy / Scipy
ENV OPENBLAS /opt/OpenBLAS/lib/libopenblas.so
RUN pip install -q \
      numpy \
      scipy
 && rm -fr /root/.cache /tmp/*
