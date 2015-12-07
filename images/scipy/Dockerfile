FROM 0x0l/jupyter:latest

# Install OpenBLAS
RUN apt-get update -qq \
 && apt-get install -yqq --no-install-recommends gfortran \
 && git clone -q --branch=master git://github.com/xianyi/OpenBLAS.git /tmp/OpenBLAS \
 && ( cd /tmp/OpenBLAS \
   && make NO_LAPACKE=1 DYNAMIC_ARCH=1 NO_AFFINITY=1 NO_WARMUP=1 NUM_THREADS=64 > /dev/null 2>&1 \
   && make install ) \
 && rm -fr /tmp/OpenBLAS \
 && echo "/opt/OpenBLAS/lib" > /etc/ld.so.conf.d/openblas.conf \
 && ldconfig

# Numpy / Scipy
ENV OPENBLAS /opt/OpenBLAS/lib/libopenblas.so
RUN pip3 install -q \
      numpy \
      scipy

# More packages
RUN apt-get install -yqq \
      graphviz \
      hdf5-tools \
      libfreetype6-dev \
      libgraphviz-dev \
      libhdf5-dev \
      liblzo2-dev \
      libpng-dev \
      libxml2-dev \
      libxslt-dev \
      libzip2 \
 && apt-get clean -yqq \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install -q \
      beautifulsoup4 \
      blosc \
      bokeh \
      bottleneck \
      cython \
      h5py \
      lasagne \
      lxml \
      matplotlib \
      networkx \
      nltk \
      numexpr \
      palettable \
      pandas \
      pandas-datareader \
      patsy \
      pillow \
      pygraphviz \
      pykalman \
      pyyaml \
      quandl \
      scikit-image \
      scikit-learn \
      seaborn \
      sqlalchemy \
      statsmodels \
      sympy \
      tables \
      textblob \
      theano \
      xlrd \
      xlsxwriter \
 && rm -fr /root/.cache /tmp/*

RUN pip3 install -q --upgrade \
      https://github.com/Theano/Theano/archive/master.zip \
      https://github.com/fchollet/keras/archive/master.zip \
      https://github.com/lasagne/lasagne/archive/master.zip \
      https://github.com/pymc-devs/pymc3/archive/master.zip \
 && rm -fr /root/.cache /tmp/*

# tmp
RUN pip3 uninstall -y tables \
 && pip3 install https://github.com/0x0L/PyTables/archive/develop.zip

RUN pip3 install bokeh picklable-itertools progressbar2 pyyaml six toolz \
 && pip3 install https://github.com/mila-udem/fuel/archive/master.zip \
 && pip3 install https://github.com/mila-udem/blocks/archive/master.zip \
 && pip3 install https://github.com/mila-udem/blocks-extras/archive/master.zip \
 && rm -fr /root/.cache /tmp/*

RUN wget https://github.com/mila-udem/blocks-examples/archive/master.zip \
 && mv /master.zip /blocks-examples.zip
