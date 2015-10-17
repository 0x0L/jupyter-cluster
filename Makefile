BUILD:=docker build --rm --force-rm -t

jupyter:
	$(BUILD) 0x0l/jupyter images/jupyter

scipy:
	$(BUILD) 0x0l/scipy images/scipy

.PHONY: jupyter scipy
