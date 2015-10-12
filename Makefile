.PHONY: notebook scipy

BUILD:=docker build --rm --force-rm -t

all: notebook scipy

pull:
	docker pull 0x0l/notebook
	docker pull 0x0l/scipy

notebook:
	$(BUILD) 0x0l/notebook notebook

scipy: notebook
	$(BUILD) 0x0l/scipy scipy
