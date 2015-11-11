FROM 0x0l/pandas:latest

RUN pip install -q \
      bokeh \
      nltk \
      pykalman \
      scikit-learn \
      textblob \
 && rm -fr /root/.cache /tmp/*

RUN pip install -q --upgrade \
      https://github.com/Theano/Theano/archive/master.zip \
      https://github.com/fchollet/keras/archive/master.zip \
      https://github.com/lasagne/lasagne/archive/master.zip \
      https://github.com/pymc-devs/pymc3/archive/master.zip \
      picklable-itertools progressbar2 six toolz \
      https://github.com/mila-udem/fuel/archive/master.zip \
      https://github.com/mila-udem/blocks/archive/master.zip \
      https://github.com/mila-udem/blocks-extras/archive/master.zip \
 && rm -fr /root/.cache /tmp/*

RUN wget https://github.com/mila-udem/blocks-examples/archive/master.zip \
 && mv /master.zip /blocks-examples.zip

RUN pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl
