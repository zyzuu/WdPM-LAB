design_dir := design
verif_dir := verif
# Design files
design_files += $(design_dir)/dff.sv
design_files += $(design_dir)/accumulator.sv
design_files += $(design_dir)/share_pkg.sv
design_files += $(design_dir)/alu.sv
design_files += $(design_dir)/instruction_decoder.sv
design_files += $(design_dir)/program_counter.sv
design_files += $(design_dir)/mux_mem_rf_imm.sv
design_files += $(design_dir)/program_memory.sv
design_files += $(design_dir)/register_file.sv
design_files += $(design_dir)/memory.sv
design_files += $(design_dir)/simple_top.sv
# Verification files
verif_files += $(verif_dir)/simple_tb/simple_tb.sv
# Misc flags
output_file = test
waves_dump = dump.vcd
# Compilation flags
comp_flags += -g2012 # use systemverilog 2012
comp_flags += -Wall
comp_flags += -o $(output_file) # output file test

comp:
	@iverilog $(comp_flags) $(design_files) $(verif_files)

run:
	@vvp $(output_file)

waves:
	@gtkwave $(waves_dump) dump.gtkw

all: comp run waves