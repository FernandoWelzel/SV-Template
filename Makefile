# ================================================== #
#                    Makefile
#
#  Designer: Fernando WELZEL
# ================================================== #

# ================= CONFIGURATION ================== #
# Folders definitions
SRC_DIR  ?= ./src
WORK_DIR ?= ./work

# Getting folders for compilation
SRC_FOLDERS   := $(wildcard $(SRC)/*/)
BENCH_FOLDERS := $(wildcard $(BENCH)/*/)

# =================== TARGETS ===================== #
rtl_sim: $(SIM_WORK_DIR)

# ================ RTL SIMULATION ================= #
$(WORK_DIR): #TODO: Create basic simulation functions

# =================== CLEAN ======================== #
clean:
	rm -r $(WORK_DIR)