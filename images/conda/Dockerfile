FROM continuumio/anaconda3:latest


RUN apt-get update \
 && apt-get upgrade -y \
 && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
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
      unzip \
      vim \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN conda uninstall -y anaconda \
 && conda update -y --all \
 && conda install -y \
      cvxopt \
      distributed \
      ipyparallel \
      netcdf4 \
      seaborn \
      theano \
      tensorflow \
      xarray \
 && conda install -y -c conda-forge \
      deap \
      ffmpeg \
      keras \
      pykalman \
 && conda clean -y --all \
 && rm -fr /opt/conda/etc/jupyter/* \
 && jupyter nbextension enable --py --sys-prefix widgetsnbextension \
 && find /opt/conda -not -perm -o=r | xargs chmod o+r


RUN pip install \
      arch \
      graphviz \
      https://github.com/pymc-devs/pymc3/archive/master.zip
