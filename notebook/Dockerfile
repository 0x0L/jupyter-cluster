FROM debian:jessie

ENV SHELL /bin/bash

# Localize en_US.UTF-8
RUN apt-get update -q \
 && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && apt-get install -y -q locales \
 && update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# A few packages
RUN apt-get install -y -q \
      ack-grep \
      build-essential \
      bzip2 \
      curl \
      git \
      less \
      libsm6 \
      pandoc \
      pkg-config \
      python3 \
      python3-dev \
      python3-pip \
      tmux \
      tree \
      unzip \
      vim \
      wget \
      xsel \
      zip

# Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.6.0/tini \
 && echo "d5ed732199c36a1189320e6c4859f0169e950692f451c03e7854243b95f4234b *tini" | sha256sum -c - \
 && mv tini /usr/local/bin/tini \
 && chmod +x /usr/local/bin/tini

# Update python packages and install Jupyter
RUN pip3 list --outdated | cut -d " " -f 1 | xargs pip3 install -q --upgrade \
 && pip3 install -q \
      jupyter \
      notebook \
      ipyparallel \
      nose \
      dill

# Base configuration
RUN mkdir -p /root/.ssh \
 && mkdir -p /root/.jupyter \
 && ipython profile create --parallel \
 && echo "c.NotebookApp.server_extensions.append('ipyparallel.nbextension')" \
      > /root/.jupyter/jupyter_notebook_config.py \
 && sed -i 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/' \
      /etc/ssh/ssh_config

# The VOLUME instruction should be used to expose any database storage area,
# configuration storage, or files/folders created by your docker container
VOLUME /data
VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888
ENTRYPOINT ["tini", "--"]
CMD ["jupyter", "notebook", "--ip=*"]
