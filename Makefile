include ../wot-make/npm.mk

define clean_
	@rm -rf node_modules npm-debug.log
endef
