UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Darwin)
	BREW_BIN:=/usr/local/bin
endif
ifeq ($(UNAME_S), Linux) 
	BREW_BIN:=${HOMEBREW_PREFIX}/bin
endif

brew: ${BREW_BIN}/brew
${BREW_BIN}/brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ps2pdf: ${BREW_BIN}/ps2pdf
${BREW_BIN}/ps2pdf: brew
	brew install ghostscript

pdftk: ${BREW_BIN}/pdftk
${BREW_BIN}/pdftk: brew
	brew install pdftk-java
