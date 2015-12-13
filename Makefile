BUILD:=docker build --rm --force-rm

pull:
	docker pull 0x0l/jupyter
	docker pull 0x0l/scipy

jupyter:
	$(BUILD) -t 0x0l/jupyter images/jupyter

scipy:
	$(BUILD) -t 0x0l/scipy images/scipy

install:
	cp bin/jupyter-docker "${HOME}/bin"

.PHONY: jupyter scipy
