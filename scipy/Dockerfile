FROM 0x0l/notebook:latest

# Install OpenBLAS
RUN apt-get install -y -q gfortran \
 && git clone -q --branch=master git://github.com/xianyi/OpenBLAS.git /tmp/OpenBLAS \
 && ( cd /tmp/OpenBLAS \
   && make DYNAMIC_ARCH=1 NO_AFFINITY=1 NUM_THREADS=32 \
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
RUN apt-get install -y -q \
      libfreetype6-dev \
      libhdf5-dev \
      libpng-dev \
      libxml2-dev \
      libxslt-dev

RUN pip3 install -q \
      beautifulsoup4 \
      blosc \
      bottleneck \
      cython \
      h5py \
      lasagne \
      lxml \
      matplotlib \
      numexpr \
      pandas \
      patsy \
      pillow \
      pykalman \
      quandl \
      scikit-learn \
      sqlalchemy \
      statsmodels \
      sympy \
      tables \
      theano \
      xlrd \
      xlsxwriter \
 && rm -fr /root/.cache \
 && rm -fr /tmp/*
