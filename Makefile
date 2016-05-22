BUILD:=docker build --rm --force-rm

all: base alpha

base:
	# docker pull ubuntu
	$(BUILD) -t 0x0l/base images/base

jupyter:
	# docker pull ubuntu
	$(BUILD) -t 0x0l/jupyter images/jupyter

alpha:
	# docker pull ubuntu
	$(BUILD) -t 0x0l/alpha images/alpha

# scipy:
# 	$(BUILD) -t 0x0l/scipy images/scipy
#
# data:
# 	$(BUILD) -t 0x0l/data images/data

# install:
# 	cp bin/jupyter-docker "${HOME}/bin"
