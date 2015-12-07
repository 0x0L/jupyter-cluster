FROM 0x0l/jupyter:latest

# Numpy / Scipy
RUN apt-get update -qq \
 && apt-get install -yqq gfortran libopenblas-dev

RUN pip install -q numpy scipy

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

 # bokeh \
 # lasagne \
 # palettable \
 # scikit-image \
 # theano \
 # tables \
RUN pip install -q \
      beautifulsoup4 \
      blosc \
      bottleneck \
      cython \
      h5py \
      lxml \
      matplotlib \
      networkx \
      nltk \
      numexpr \
      pandas \
      pandas-datareader \
      patsy \
      pillow \
      pygraphviz \
      pykalman \
      pyyaml \
      quandl \
      scikit-learn \
      seaborn \
      sqlalchemy \
      statsmodels \
      sympy \
      textblob \
      xlrd \
      xlsxwriter \
 && rm -fr /root/.cache /tmp/*

 # https://github.com/lasagne/lasagne/archive/master.zip \
RUN pip install -q --upgrade \
      https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl \
      https://github.com/Theano/Theano/archive/master.zip \
      https://github.com/fchollet/keras/archive/master.zip \
      https://github.com/pymc-devs/pymc3/archive/master.zip \
 && rm -fr /root/.cache /tmp/*

# tmp
RUN pip install https://github.com/0x0L/PyTables/archive/develop.zip

# RUN pip install bokeh picklable-itertools progressbar2 pyyaml six toolz \
#  && pip install https://github.com/mila-udem/fuel/archive/master.zip \
#  && pip install https://github.com/mila-udem/blocks/archive/master.zip \
#  && pip install https://github.com/mila-udem/blocks-extras/archive/master.zip \
#  && rm -fr /root/.cache /tmp/*
#
# RUN wget https://github.com/mila-udem/blocks-examples/archive/master.zip \
#  && mv /master.zip /blocks-examples.zip
