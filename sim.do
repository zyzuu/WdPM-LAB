set DESIGN_DIR /home/student/MG/WdPM/design
set VERIF_DIR /home/student/MG/WdPM/verif
vlog -work top -sv \
$DESIGN_DIR/alu_pkg.sv \
$DESIGN_DIR/alu.sv \
$DESIGN_DIR/accumulator.sv \
$DESIGN_DIR/id_pkg.sv \
$DESIGN_DIR/instruction_decoder.sv \
$DESIGN_DIR/program_counter.sv \
$DESIGN_DIR/program_memory.sv
vsim -voptargs="+acc" top
add wave -r /*
run -all
