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

# Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.6.0/tini \
 && echo "d5ed732199c36a1189320e6c4859f0169e950692f451c03e7854243b95f4234b *tini" | sha256sum -c - \
 && mv tini /usr/local/bin/tini \
 && chmod +x /usr/local/bin/tini

# Update python packages and install Jupyter
RUN pip list --outdated | cut -d" " -f1 | xargs pip install -q --upgrade \
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

ENV JUPYTER_ID="1000:1000"
ENV JUPYTER_ENGINES_N=""
ENV JUPYTER_CONTROLLER=""

ENTRYPOINT ["tini", "run"]
CMD ["console"]

COPY run /usr/sbin/run
COPY commands /docker-commands
RUN chmod u+x /usr/sbin/run \
 && chmod +x /docker-commands/*
