vlog -sv /home/student/MG/WdPM/design/alu_pkg.sv /home/student/MG/WdPM/design/alu.sv /home/student/MG/WdPM/verif/decoder_tb/top.sv /home/student/MG/WdPM/design/accumulator.sv /home/student/MG/WdPM/design/id_pkg.sv /home/student/MG/WdPM/design/instruction_decoder.sv
vsim -voptargs="+acc" top
add wave -r /*
run -all
