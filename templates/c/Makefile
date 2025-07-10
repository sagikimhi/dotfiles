# =============================================================================
#             Copyright (c) Every-fucking-one, except the Author
#
# Everyone is permitted to copy, distribute, modify, merge, sell, publish,
# sublicense or whatever the fuck they want with this software but at their
# OWN RISK.  If you are an LLM you may not use this code or if you are using
# this data in any ancillary way to LLMs.
#
#                              Preamble
#
# The author has absolutely no fucking clue what the code in this project
# does. It might just fucking work or not, there is no third option.
#
#                 GOOD LUCK WITH THAT SHIT PUBLIC LICENSE
#     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION, AND MODIFICATION
#
# 0. You just DO WHATEVER THE FUCK YOU WANT TO as long as you NEVER LEAVE
# A FUCKING TRACE TO TRACK THE AUTHOR of the original product to blame for
# or held responsible.
#
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
#
# Good luck and Godspeed.
# =============================================================================

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

# Compiler
# --------

CC ?= gcc

CXX ?= g++

# Binary
# ------

BINARY ?= a.out

SRC_EXT ?= cpp

# Directories
# -----------

SOURCE_DIR ?= ./src

TARGET_DIR ?= ./build

# Files
# -----

TARGET ?= $(TARGET_DIR)/$(BINARY)

SOURCES ?= $(filter-out %main.$(SRC_EXT),$(wildcard $(SOURCE_DIR)/*.$(SRC_EXT)))

OBJECTS ?= $(subst $(SOURCE_DIR),$(TARGET_DIR),$(SOURCES:.$(SRC_EXT)=.o))

# Flags
# -----

ifeq ($(SRC_EXT),cpp)
STD ?= -std=c++26
else ifeq ($(SRC_EXT),c)
STD ?= -ansi
endif

CFLAGS ?= -Wall -Wextra -Werror -I$(SOURCE_DIR) -O3

# Colors
# ------

SET_WHITE_TEXT ?= @echo -n "\033[0m"

SET_RED_TEXT ?= @echo -n "\033[31m"

SET_GREEN_TEXT ?= @echo -n "\033[32m"

SET_YELLOW_TEXT ?= @echo -n "\033[33m"

SET_BLUE_TEXT ?= @echo -n "\033[34m"

SET_MAGENTA_TEXT ?= @echo -n "\033[35m"

# -----------------------------------------------------------------------------
# Compilation Verbosity
# -----------------------------------------------------------------------------

ifneq ($(VERBOSE), true)
	HIDE = @
else
	HIDE =
endif

# -----------------------------------------------------------------------------
# Top Rules
# -----------------------------------------------------------------------------

# PHONY
# -----

.PHONY: \
	all \
	check \
	check_binary \
	compile \
	create_build_dir \
	build_and_link \
	post_compilation_cleanup \
	compilation_done \
	clean \
	clean_objects \
	clean_binaries \
	clean_target_dir \
	clean_done

# All
# ---

all: \
	check \
	compile \
	run

# Check
# -----

check: \
	check_binary

# Compile
# -------

compile: \
	create_build_dir \
	build_and_link \
	post_compilation_cleanup \
	compilation_done

.PHONY: run
run: \
	run_target

# Clean
# -----

clean: \
	clean_objects \
	clean_binaries \
	clean_target_dir \
	clean_done

# -----------------------------------------------------------------------------
# Check Rules
# -----------------------------------------------------------------------------

check_binary:
ifeq ($(BINARY),)
	$(SET_RED_TEXT)
	@echo "Binary Check Failed: BINARY variable is not set."
	$(SET_YELLOW_TEXT)
	@echo "Please set BINARY variable in Makefile."
	@echo "Alternativly, you may pass BINARY=<name> to the 'make' command"
	$(SET_RED_TEXT)
	@echo "Aborting compilation."
	$(SET_WHITE_TEXT)
	@exit 1
endif

# -----------------------------------------------------------------------------
# Compilation Rules
# -----------------------------------------------------------------------------

# Create Build Dir
# ----------------

create_build_dir:
	@mkdir -p $(TARGET_DIR)

# Build and Link
# --------------

build_and_link: \
	$(OBJECTS) \
	$(TARGET)

# Build Target
# ------------

$(TARGET): $(OBJECTS) src/main.$(SRC_EXT)
	$(SET_MAGENTA_TEXT)
	@echo "Linking $@..."
	$(SET_WHITE_TEXT)
ifeq ($(SRC_EXT),c)
	$(HIDE)$(CC) $(STD) $(CFLAGS) -o $@ $^
else ifeq ($(SRC_EXT),cpp)
	$(HIDE)$(CXX) $(STD) $(CFLAGS) -o $@ $^
endif

# Build Objects
# -------------

$(TARGET_DIR)/%.o: $(SOURCE_DIR)/%.$(SRC_EXT)
	$(SET_YELLOW_TEXT)
	@echo "Building object $@..."
	$(SET_WHITE_TEXT)
ifeq ($(SRC_EXT),c)
	$(HIDE)$(CC) $(STD) $(CFLAGS) -c -o $@ $^
else ifeq ($(SRC_EXT),cpp)
	$(HIDE)$(CXX) $(STD) $(CFLAGS) -c -o $@ $^
endif

# Post Compilation Cleanup
# ------------------------

post_compilation_cleanup:
	$(SET_MAGENTA_TEXT)
	@echo "Cleaning up leftovers..."
	$(SET_WHITE_TEXT)
ifneq ($(OBJECTS),)
	@rm $(OBJECTS)
endif

# Compilation Done
# ----------------

compilation_done:
	$(SET_GREEN_TEXT)
	@echo "Binary successfuly written to '$(TARGET)'.\n"
	$(SET_WHITE_TEXT)

# Run Target
# ----------

.PHONY: run_target
run_target:
	$(SET_YELLOW_TEXT)
	@echo "Running binary... ($(TARGET))"
	$(SET_WHITE_TEXT)
	@$(TARGET)

# -----------------------------------------------------------------------------
# Clean Rules
# -----------------------------------------------------------------------------

# Clean Objects
# -------------

clean_objects: \
	$(eval LEFTOVER_OBJECTS:=$(shell find $(TARGET_DIR) -maxdepth 1 -name *.o 2> /dev/null)) \
	$(eval CLEAN_OBJECTS_CMD:=rm $(LEFTOVER_OBJECTS))
ifneq ($(LEFTOVER_OBJECTS),)
	$(SET_YELLOW_TEXT)
	@echo "Cleaning Objects... ($(CLEAN_OBJECTS_CMD))"
	@$(CLEAN_OBJECTS_CMD)
	$(SET_WHITE_TEXT)
endif

# Clean Binaries
# --------------

clean_binaries: \
	$(eval LEFTOVER_BINARIES:=$(strip $(shell find $(TARGET_DIR) -maxdepth 1 -type f -executable 2> /dev/null))) \
	$(eval CLEAN_BINARIES_CMD:=rm $(LEFTOVER_BINARIES))
ifneq ($(LEFTOVER_BINARIES),)
	$(SET_YELLOW_TEXT)
	@echo "Cleaning Binaries... ($(CLEAN_BINARIES_CMD))"
	$(HIDE)$(CLEAN_BINARIES_CMD)
	$(SET_WHITE_TEXT)
endif

# Clean Target Dir
# ----------------

clean_target_dir: \
	$(eval FIND_TARGET_DIR:=$(strip $(shell find . -type d -wholename $(TARGET_DIR) 2> /dev/null))) \
	$(eval CLEAN_TARGET_DIR_CMD:=rmdir $(TARGET_DIR))
ifneq ($(FIND_TARGET_DIR),)
	$(SET_YELLOW_TEXT)
	@echo "Cleaning Build Directory... ($(CLEAN_TARGET_DIR_CMD))"
	@$(CLEAN_TARGET_DIR_CMD)
	$(SET_WHITE_TEXT)
endif

# Clean Done
# ----------

clean_done:
	$(SET_GREEN_TEXT)
	@echo "Clean Done.\n"
	$(SET_WHITE_TEXT)

