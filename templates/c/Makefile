# -----------------------------------------------------------------------------
# Constants
# -----------------------------------------------------------------------------

CWD := $(shell realpath $(dir $(lastword $(MAKEFILE_LIST))))

# -----------------------------------------------------------------------------
# User Variables/Options
# -----------------------------------------------------------------------------

## CC: compiler invocation command
CC ?= gcc

## CFLAGS: flags to pass to compiler invocation command
CFLAGS ?= -Wall -Wextra -Werror -I$(SRC_DIR)

## BIN: target binary name
BIN ?= a.out

## VERBOSE: verbosity control, empty means quiet, non-empty means verbose
VERBOSE ?=

## SRC_EXT: source code extension, should be either c or cpp
SRC_EXT ?= c

## SRC_DIR: path to directory containing source files to be built
SRC_DIR ?= ./src

## BUILD_DIR: path to directory to which build outputs will be written
BUILD_DIR ?= ./build

# -----------------------------------------------------------------------------
# Internal Variables
# -----------------------------------------------------------------------------

ifeq ($(VERBOSE),)
	HIDE ?= @
else
	HIDE ?=
endif

SOURCES := $(filter-out %main.$(SRC_EXT),$(wildcard $(SRC_DIR)/*.$(SRC_EXT)))

OBJECTS := $(subst $(SRC_DIR),$(BUILD_DIR),$(SOURCES:.$(SRC_EXT)=.o))

.DEFAULT_GOAL := help

# -----------------------------------------------------------------------------
# Goals
# -----------------------------------------------------------------------------

.PHONY: help build clean vars

build: $(BIN) ## compile and link the binary target

clean: ## clean leftover artifacts from previous build
	$(HIDE)rm -rf $(BUILD_DIR) $(BIN)

help: ## show this help menu and exit
	$(HIDE)printf "`tput sgr0`─────────────────────────────────────`tput bold``tput setaf 6`Rules`tput sgr0`────────────────────────────────────\n"
	$(HIDE)sed -ne "/@sed/!s/\(^[^#?=]*\):.*##\s*\(.*\)/`tput setaf 6``tput bold`\1`tput setaf 8`:\2/p" $(MAKEFILE_LIST) | column -t -s: -c80 -Cwidth=20,strictwidth -d
	$(HIDE)printf "`tput sgr0`────────────────────────────────────`tput bold``tput setaf 2`Options`tput sgr0`───────────────────────────────────\n"
	$(HIDE)sed -ne "/@sed/!s/## \(.*\): \(.*\)/`tput setaf 2``tput bold`\1`tput setaf 8`:\2/p" $(MAKEFILE_LIST) | column -t -s: -c80 -Cwidth=20,strictwidth -d

$(BIN): $(OBJECTS) $(SRC_DIR)/main.c
	$(HIDE)$(CC) $(STD) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(HIDE)$(CC) $(STD) $(CFLAGS) -c -o $@ $<

$(BUILD_DIR):
	$(HIDE)mkdir -p $@
