FROM 0x0l/scipy:latest

# More packages
RUN apt-get update -qq \
 && apt-get install -yqq \
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
