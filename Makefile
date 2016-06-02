BUILD:=docker build --rm --force-rm

all: base alpha

base:
	$(BUILD) -t 0x0l/base images/base

alpha:
	$(BUILD) -t 0x0l/alpha images/alpha

jupyter:
	$(BUILD) -t 0x0l/jupyter images/jupyter

# scipy:
# 	$(BUILD) -t 0x0l/scipy images/scipy
#
# data:
# 	$(BUILD) -t 0x0l/data images/data

# install:
# 	cp bin/jupyter-docker "${HOME}/bin"
