FROM debian:jessie

ENV SHELL /bin/bash

# Localize en_US.UTF-8
RUN apt-get update -qq \
 && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && apt-get install -yqq locales \
 && update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PYTHONIOENCODING UTF-8

# A few packages
RUN apt-get install -yqq \
      ack-grep \
      build-essential \
      bzip2 \
      ca-certificates \
      curl \
      git \
      less \
      libcurl4-openssl-dev \
      libffi-dev \
      libsqlite3-dev \
      libssl-dev \
      libzmq3-dev \
      openssh-server \
      pandoc \
      pkg-config \
      python \
      python-dev \
      python-pip \
      sqlite3 \
      sudo \
      tmux \
      tree \
      unzip \
      vim \
      wget \
      xsel \
      zip \
      zlib1g-dev \
 && apt-get clean -yqq \
 && rm -rf /var/lib/apt/lists/*

# Add Tini
ENV TINI_VERSION v0.8.4
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# Update python packages and install Jupyter
RUN pip list --outdated | cut -d " " -f 1 | xargs pip install -q --upgrade \
 && pip install -q --upgrade \
      cloudpickle \
      dill \
      ipyparallel \
      jupyter \
      nose \
      notebook \
      requests[security] \
 && ipython profile create --parallel --log-level=CRITICAL \
 && rm -fr /root/.cache /tmp/*

EXPOSE 2222 8888
ENTRYPOINT ["/tini", "run"]

ENV JUPYTER_ID="1000:1000"
ENV JUPYTER_ENGINES_N=""
ENV JUPYTER_CONTROLLER=""
CMD ["console"]

COPY run /usr/sbin/run
COPY commands /docker-commands
RUN chmod u+x /usr/sbin/run \
 && chmod +x /docker-commands/*
