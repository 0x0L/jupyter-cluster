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
      openssh-server \
      pandoc \
      pkg-config \
      python3 \
      python3-dev \
      python3-pip \
      sudo \
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
      dill \
      ipyparallel \
      jupyter \
      nose \
      notebook \
 && ipython profile create --parallel

RUN sed -i 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/' \
      /etc/ssh/ssh_config

# User mapping
ENV NB_UID=1000
ENV NB_GID=1000
ENV CONTROLLER="192.168.99.100:50000"

EXPOSE 8888
EXPOSE 2222
ENTRYPOINT ["tini", "start"]
CMD ["notebook"]

RUN mkdir /docker-scripts
COPY start /usr/sbin/start
COPY console connect controller engines notebook /docker-scripts/
RUN chmod u+x /usr/sbin/start \
 && chmod +x /docker-scripts/*
