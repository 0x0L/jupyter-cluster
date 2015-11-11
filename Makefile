BUILD:=docker build --rm --force-rm

jupyter:
	$(BUILD) -t 0x0l/jupyter images/jupyter

scipy:
	$(BUILD) -t 0x0l/scipy images/scipy

ml:
	$(BUILD) -t 0x0l/ml images/ml

install:
	cp bin/jupyter-docker "${HOME}/bin"

.PHONY: jupyter scipy ml
