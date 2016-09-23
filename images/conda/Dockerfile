FROM continuumio/anaconda3:latest


RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y \
      g++ \
      gcc \
      graphviz


RUN conda update -y --all \
 && conda uninstall -y \
      anaconda \
      anaconda-build \
      anaconda-client \
      anaconda-navigator \
      anaconda-verify \
      nb_anacondacloud \
      nb_conda \
      nb_conda_kernels


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
      https://github.com/pymc-devs/pymc3/archive/master.zip \
      https://github.com/automl/auto-sklearn/archive/master.zip
