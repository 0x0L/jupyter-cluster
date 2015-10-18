FROM 0x0l/jupyter:latest

# Install OpenBLAS
RUN apt-get update -q \
 && apt-get install -yq --no-install-recommends gfortran \
 && git clone -q --branch=master git://github.com/xianyi/OpenBLAS.git /tmp/OpenBLAS \
 && ( cd /tmp/OpenBLAS \
   && make NO_LAPACKE=1 DYNAMIC_ARCH=1 NO_AFFINITY=1 NO_WARMUP=1 NUM_THREADS=64 > /dev/null \
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
RUN apt-get install -yq \
      libfreetype6-dev \
      libhdf5-dev \
      libpng-dev \
      libxml2-dev \
      libxslt-dev \
 && apt-get clean \
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
      nltk \
      numexpr \
      palettable \
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
      textblob \
      theano \
      xlrd \
      xlsxwriter \
 && rm -fr /root/.cache /tmp/*

RUN pip3 install -q --upgrade \
      https://github.com/matplotlib/matplotlib/archive/master.zip \
      https://github.com/Theano/Theano/archive/master.zip \
      https://github.com/fchollet/keras/archive/master.zip \
      https://github.com/lasagne/lasagne/archive/master.zip \
      https://github.com/pymc-devs/pymc3/archive/master.zip \
 && rm -fr /root/.cache /tmp/*
