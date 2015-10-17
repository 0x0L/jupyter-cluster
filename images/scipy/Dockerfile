FROM 0x0l/jupyter:latest

# Install OpenBLAS
RUN apt-get update -q \
 && apt-get install -yq --no-install-recommends gfortran \
 && git clone -q --branch=master git://github.com/xianyi/OpenBLAS.git /tmp/OpenBLAS \
 && ( cd /tmp/OpenBLAS \
   && make NO_LAPACKE=1 DYNAMIC_ARCH=1 NO_AFFINITY=1 NO_WARMUP=1 NUM_THREADS=64 \
   && make install ) \
 && rm -fr /tmp/OpenBLAS \
 && echo "/opt/OpenBLAS/lib" > /etc/ld.so.conf.d/openblas.conf \
 && ldconfig \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Numpy / Scipy
ENV OPENBLAS /opt/OpenBLAS/lib/libopenblas.so
RUN pip3 install -q \
      numpy \
      scipy

# More packages
RUN apt-get install -y -q \
      libfreetype6-dev \
      libhdf5-dev \
      libpng-dev \
      libxml2-dev \
      libxslt-dev

RUN pip3 install -q \
      beautifulsoup4 \
      bokeh \
      blosc \
      bottleneck \
      cython \
      h5py \
      lxml \
      matplotlib \
      numexpr \
      pandas \
      pandas-datareader \
      patsy \
      pillow \
      pykalman \
      quandl \
      scikit-image \
      scikit-learn \
      seaborn \
      sqlalchemy \
      statsmodels \
      sympy \
      tables \
      xlrd \
      xlsxwriter \
 && pip3 install -q git+https://github.com/Theano/Theano.git \
 && pip3 install -q git+https://github.com/lasagne/lasagne.git \
 && pip3 install -q git+https://github.com/pymc-devs/pymc3.git \
 && rm -fr /root/.cache \
 && rm -fr /tmp/*
