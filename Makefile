PREFIX ?= /usr/local/bin
LOCAL_BIN = ./bin
ifeq ($(XDG_CONFIG_HOME),)
  XDG_CONFIG_HOME=~/.config
endif
CONF_DIR ?= $(XDG_CONFIG_HOME)/tagr


all:
	@echo Run \'[PREFIX=/prefix/path] make install\' to install tagr.
	@echo Depending on the PREFIX you might need to use sudo...

config:
	@mkdir -p $(CONF_DIR)
	@cp tags $(CONF_DIR)/tags

install: config
	@mkdir -p $(PREFIX)	
	@cp tagr $(PREFIX)/
	@chmod 755 $(PREFIX)/tagr
	@mkdir -p $(LOCAL_BIN)
	@ln -sf $(PREFIX)/tagr $(LOCAL_BIN)/tagr-"`uuidgen`"

uninstall:
	rm -f $(PREFIX)/tagr
	rm -f `readlink -f $(LOCAL_BIN)/*`

clean:
	rm -rf $(LOCAL_BIN)

