FROM ubuntu:latest

RUN apt-get update -qq \
 && locale-gen en_US.UTF-8 \
 && update-locale LANG=en_US.UTF-8

ENV SHELL /bin/bash
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PYTHONIOENCODING UTF-8

RUN apt-get install -yqq \
      curl \
      ffmpeg \
      g++ \
      gcc \
      gfortran \
      git \
      less \
      libblosc-dev \
      libblosc-dev \
      libedit-dev \
      libfreetype6-dev \
      libgmp-dev \
      libhdf5-dev \
      libjpeg-dev \
      libopenblas-dev \
      libpng3-dev \
      libssl-dev \
      libxml2-dev \
      libxslt-dev \
      libzmq3-dev \
      llvm-3.7-dev \
      pandoc \
      pkg-config \
      python3 \
      python3-dev \
      vim \
      zip

RUN curl https://bootstrap.pypa.io/get-pip.py > get-pip.py \
 && python3 get-pip.py \
 && rm get-pip.py

RUN pip install -q \
      Cython \
      numpy

RUN LLVM_CONFIG=llvm-config-3.7 pip install -q \
      beautifulsoup4 \
      blosc \
      boto \
      bottleneck \
      cvxpy \
      gmpy \
      h5py \
      html5lib \
      ipyparallel \
      jupyter \
      keras \
      llvmlite \
      lxml \
      matplotlib \
      networkx \
      nose \
      numba \
      numexpr \
      nltk \
      pandas \
      pandas-datareader \
      Pillow \
      https://github.com/quantopian/pyfolio/archive/master.zip \
      pykalman \
      https://github.com/pymc-devs/pymc3/archive/master.zip \
      quandl \
      requests[security] \
      seaborn \
      scikit-image \
      scikit-learn \
      scipy \
      sqlalchemy \
      statsmodels \
      sympy \
      tables \
      Theano \
      xarray \
      xlrd \
      xlwt \
      https://github.com/quantopian/zipline/archive/master.zip

ENV THEANORC /etc/theanorc:~/.theanorc
COPY theanorc /etc/theanorc

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]
