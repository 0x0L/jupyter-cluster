FROM continuumio/anaconda3:latest

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y \
  gcc \
  g++

RUN conda update -y --all \
 && conda install -y \
  cvxopt \
  ipyparallel \
  netcdf4 \
  seaborn \
  xarray

RUN conda remove nb_anacondacloud

RUN conda install -y -c conda-forge \
  deap \
  ffmpeg \
  ipywidgets \
  keras \
  pykalman \
  theano \
  widgetsnbextension

RUN jupyter nbextension enable --py widgetsnbextension

RUN conda install -y -c gusdunn pymc3

RUN conda install -y -c Quantopian \
  pyfolio \
  qgrid
