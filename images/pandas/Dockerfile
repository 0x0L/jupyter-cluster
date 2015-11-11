FROM 0x0l/scipy:latest

# Pandas stack
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

RUN pip install -q \
      beautifulsoup4 \
      blosc \
      bottleneck \
      cython \
      h5py \
      lxml \
      matplotlib \
      networkx \
      numexpr \
      pandas \
      pandas-datareader \
      patsy \
      pillow \
      pygraphviz \
      pyyaml \
      quandl \
      seaborn \
      sqlalchemy \
      statsmodels \
      sympy \
      xlrd \
      xlsxwriter \
 && rm -fr /root/.cache /tmp/*

 # tmp
RUN pip uninstall -y tables \
 && pip install https://github.com/0x0L/PyTables/archive/develop.zip
