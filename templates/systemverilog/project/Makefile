# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

SIM ?= vcs

MODULE ?= testbench

TOPLEVEL ?= $(shell basename $(wildcard top/*top.sv))

GHDL_ARGS ?= --ieee=synopsys

DOCS_TITLE ?= $(shell basename $(shell pwd))

DOCS_SUBTITLE ?= SUBTITLE

TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES ?= \
	$(wildcard src/*.sv) $(wildcard test/*.sv) $(wildcard top/*.sv)

VERILOG_HEADERS ?= \
	$(wildcard src/*.svh) $(wildcard test/*.svh) $(wildcard top/*.svh)

COCOTB_HDL_TIMEUNIT ?= 1ns

COCOTB_HDL_TIMEPRECISION ?= 1ps

# -----------------------------------------------------------------------------
# Includes
# -----------------------------------------------------------------------------

ifeq ($(MAKECMDGOALS),$(or help))
	include ./ref/Makefile.help
endif

ifeq ($(MAKECMDGOALS),$(or sim,clean,regression))
	include $(shell cocotb-config --makefiles)/Makefile.sim
endif

# -----------------------------------------------------------------------------
# Targets
# -----------------------------------------------------------------------------

.PHONY: all
all: help

.PHONY: help
help:
	$(info $(help_targets))
	$(info $(help_variables))
	@exit 0

.PHONY: docs
docs:
	@./bin/build-docs-docker "$(DOCS_TITLE)" "$(DOCS_SUBTITLE)"

.PHONY: format
format:
	@./bin/reformat $(VERILOG_SOURCES) $(VERILOG_HEADERS)

.PHONY: clean
clean:
	@rm -rf ./sim_build

