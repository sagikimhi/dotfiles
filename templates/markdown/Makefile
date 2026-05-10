## CWD: Absolute path to parent directory (CONTANT)
CWD:=$(shell realpath $(dir $(lastword $(MAKEFILE_LIST))))

## FILES_IN: Input markdown files
FILES_IN ?= $(wildcard *.md)

## FILES_OUT: Output PDF files
FILES_OUT ?= $(FILES_IN:%.md=%.pdf)

## PANDOC_FLAGS: Flags to pass to pandoc command
PANDOC_FLAGS ?= \
	--to pdf \
	--from markdown \
	--template eisvogel \
	--top-level-division="chapter" \
	--filter pandoc-latex-environment \
	--listings


## DEFAULT_GOAL: The default goal to run
.DEFAULT_GOAL ?= help

# -----------------------------------------------------------------------------
# Goals
# -----------------------------------------------------------------------------

.PHONY: all pdf help clean

all: clean pdf ## run the clean rule followed by the pdf rule to regenerate pdf outputs

pdf: $(FILES_OUT) ## convert all markdown files in current directory to pdf with pandoc

help: ## print this help menu and exit
	@printf "`tput sgr0`─────────────────────────────────────`tput bold``tput setaf 6`Rules`tput sgr0`─────────────────────────────────────\n"
	@sed -ne "/@sed/!s/\(^[^#?=]*\):.*##\s*\(.*\)/`tput setaf 6``tput bold`\1`tput setaf 8`:\2/p" $(MAKEFILE_LIST) | column -t -s: -c80 -Cwidth=20,strictwidth -d
	@printf "`tput sgr0`───────────────────────────────────`tput bold``tput setaf 2`Variables`tput sgr0`───────────────────────────────────\n"
	@sed -ne "/@sed/!s/## \(.*\): \(.*\)/`tput setaf 2``tput bold`\1`tput setaf 8`:\2/p" $(MAKEFILE_LIST) | column -t -s: -c80 -Cwidth=20,strictwidth -d

clean: ## remove all generated pdf files
ifneq ($(FILES_OUT),)
	rm -f $(FILES_OUT)
endif

%.pdf: %.md
	pandoc $< -o $@ $(PANDOC_FLAGS)
