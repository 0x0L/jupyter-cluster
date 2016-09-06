BUILD_FLAGS:=--rm --force-rm
#--no-cache

IMAGES = $(patsubst images/%/,%,$(wildcard images/*/))

.PHONY: $(IMAGES)
$(IMAGES):
	docker build $(BUILD_FLAGS) -t 0x0l/$@ images/$@
