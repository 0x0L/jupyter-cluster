.PHONY: notebook controller scipy

BUILD:=docker build --rm --force-rm -t

all: notebook controller scipy

pull:
	docker pull 0x0l/notebook
	docker pull 0x0l/controller
	docker pull 0x0l/scipy

notebook:
	$(BUILD) 0x0l/notebook notebook

controller: notebook
	$(BUILD) 0x0l/controller controller

scipy: notebook
	$(BUILD) 0x0l/scipy scipy
