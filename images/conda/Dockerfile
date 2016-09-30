FROM continuumio/anaconda3:latest


RUN apt-get update \
 && apt-get upgrade -y


RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && apt-get install -y locales \
 && update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8


ENV SHELL /bin/bash

RUN apt-get install -y \
      g++ \
      gcc \
      graphviz \
      nano \
      tmux \
      vim


RUN conda uninstall -y anaconda \
 && conda update -y --all


RUN conda install -y \
      cvxopt \
      distributed \
      ipyparallel \
      netcdf4 \
      seaborn \
      tensorflow \
      xarray


RUN conda install -y -c conda-forge \
      deap \
      ffmpeg \
      keras \
      pykalman \
      theano


RUN pip install \
      graphviz \
      https://github.com/pymc-devs/pymc3/archive/master.zip


RUN rm -fr /opt/conda/etc/jupyter/* \
 && jupyter nbextension enable --py --sys-prefix widgetsnbextension \
 && find /opt/conda -not -perm -o=r | xargs chmod o+r
